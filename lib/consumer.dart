// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'state_view_widget.dart';

class WidgetRef {
  Consumer? _consumer;
  
  void reBuild() {
    _consumer?.reBuild();
  }
}

class Consumer extends StateViewWidget {
  Consumer({super.key, required Widget Function() child, WidgetRef? ref})
      : _child = child {
    ref?._consumer = this;
  }
  Widget Function() _child;
  @override
  StateView<Consumer> createState() => ConsumerWidgeState();
}

class ConsumerWidgeState extends StateView<Consumer> {
  @override
  Widget view(BuildContext context) {
    return model._child();
  }
}
