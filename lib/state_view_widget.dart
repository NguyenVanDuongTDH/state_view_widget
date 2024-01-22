// ignore_for_file: must_be_immutable, invalid_use_of_protected_member, no_logic_in_create_state
library state_view_widget;

import 'package:flutter/material.dart';

abstract class StateViewWidget extends StatefulWidget {
  StateViewWidget({super.key});
  State? _state;

  void setState(void Function() fn) => _state?.setState(() {
        fn();
      });
  void reBuild() => _state?.setState(() {});

  @override
  State createState() {
    return view();
  }

  @factory
  @protected
  State view();
}

abstract class ViewState<T extends StateViewWidget> extends State {
  T? _model;
  T get model => _model!;

  @override
  void initState() {
    super.initState();
    _model = widget as T?;
    _model?._state = this;
  }

  @override
  void dispose() {
    _model?._state = null;
    _model = null;
    super.dispose();
  }
}
