// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ConsumerKey {
  void Function()? func;

  void reBuild() {
    try {
      func != null ? func!() : null;
    } catch (e) {
      func = null;
    }
  }
}

class Consumer extends StatefulWidget {
  Consumer({ConsumerKey? key, required Widget Function() child})
      : _child = child,
        _key = key;
  final ConsumerKey? _key;
  Widget Function() _child;

  @override
  State<Consumer> createState() => _ConsumerState();
}

class _ConsumerState extends State<Consumer> {
  @override
  Widget build(BuildContext context) {
    widget._key?.func = () {
      setState(() {});
    };
    return widget._child();
  }
}
