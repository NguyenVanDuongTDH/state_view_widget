// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields
// ignore_for_file: invalid_use_of_protected_member, must_be_immutable

import 'package:flutter/material.dart';

class ConsumerKey {
  void Function()? func;

  void reBuild() => func != null ? func!() : null;
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
  void initState() {
    super.initState();
    widget._key?.func = () {
      setState(() {});
    };
  }

  @override
  void dispose() {
    super.dispose();
    widget._key?.func = null;
  }

  @override
  Widget build(BuildContext context) {
    return widget._child();
  }
}

