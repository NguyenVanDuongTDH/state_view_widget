
import 'package:flutter/material.dart';
// ignore_for_file: invalid_use_of_protected_member, must_be_immutable

typedef ConsumerKey = GlobalKey<_ConsumerState>;

extension Uint8ListToPyBytes on ConsumerKey {
  void reBuild() {
    return currentState?.setState(() {});
  }

  void setState(void Function() fn) => currentState?.setState(fn);
}

class Consumer extends StatefulWidget {
  Consumer({Key? key, required this.child}) : super(key: key);

  Widget Function() child;

  @override
  State<Consumer> createState() => _ConsumerState();
}

class _ConsumerState extends State<Consumer> {
  @override
  Widget build(BuildContext context) {
    return widget.child();
  }
}
