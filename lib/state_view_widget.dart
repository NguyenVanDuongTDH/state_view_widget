// ignore_for_file: must_be_immutable, invalid_use_of_protected_member, no_logic_in_create_state
library state_view_widget;

import 'package:flutter/material.dart';

abstract class StateViewWidget extends StatefulWidget {
  StateViewWidget({super.key});
  State? _state;
  void reBuild() => _state!.setState(() {});
}

abstract class StateView<T extends StateViewWidget> extends State {
  T get model => widget as T;
  @override
  void initState() {
    super.initState();
    model._state = this;
  }

  @override
  void dispose() {
    if (model._state != null) model._state = null;
    super.dispose();
  }
}

