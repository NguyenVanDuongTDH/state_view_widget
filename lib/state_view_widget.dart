
// ignore_for_file: must_be_immutable, invalid_use_of_protected_member, no_logic_in_create_state

import 'package:flutter/material.dart';

abstract class StateViewWidget extends StatefulWidget {
  StateViewWidget({super.key});
  State? state;
  

  void setState(void Function() fn) => state?.setState(() {
        fn();
      });
  void reBuild() => state?.setState(() {});

  @override
  State createState() {
    return view();
  }

  @factory
  @protected
  State view();
}

abstract class ViewState<T extends StateViewWidget> extends State {
  T? model;
  @override
  void initState() {
    super.initState();
    model = widget as T?;
    model?.state = this;
  }

  @override
  void dispose() {
    model?.state = null;
    model = null;
    super.dispose();
  }
}

