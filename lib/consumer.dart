// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class WidgetRef {
  void Function()? _func;
  BuildContext? _context;
  BuildContext get context => _context!;

  void reBuild() {
    try {
      _func != null ? _func!() : null;
    } catch (e) {
      _func = null;
    }
  }
}

class Consumer extends StatefulWidget {
  Consumer(
      {super.key,
      required Widget Function(WidgetRef ref) child,
      WidgetRef? ref})
      : _child = child,
        _ref = ref;
  Widget Function(WidgetRef ref) _child;
  WidgetRef? _ref;
  @override
  State<Consumer> createState() => _ConsumerState();
}

class _ConsumerState extends State<Consumer> {
  @override
  Widget build(BuildContext context) {
    widget._ref?._func = () {
      setState(() {});
    };
    return widget._child(widget._ref!);
  }
}



// class Consumer extends StatefulWidget {
//   Consumer({ConsumerKey? key, required Widget Function() child})
//       : _child = child,
//         _key = key;
//   final ConsumerKey? _key;
//   Widget Function() _child;

//   @override
//   State<Consumer> createState() => _ConsumerState();
// }

// class _ConsumerState extends State<Consumer> {
//   @override
//   Widget build(BuildContext context) {
//     widget._key?.func = () {
//       setState(() {});
//     };
//     return widget._child();
//   }
// }
