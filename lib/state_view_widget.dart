// ignore_for_file: must_be_immutable, invalid_use_of_protected_member, no_logic_in_create_state
library state_view_widget;

import 'package:flutter/material.dart';
export 'package:flutter/material.dart';

abstract class StateViewWidget extends StatefulWidget {
  StateViewWidget({super.key});
  State? _state;
  void reBuild() {
    try {
      _state!.setState(() {});
    } on Exception catch (e) {
      print(e);
    }
  }
}

abstract class StateView<T extends StateViewWidget> extends State {
  T get model => widget as T;
  @override
  @protected
  @mustCallSuper
  Widget build(BuildContext context) {
    (widget as StateViewWidget)._state = this;
    throw UnimplementedError();
  }
}
