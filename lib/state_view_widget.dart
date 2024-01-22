library state_view_widget;
import 'package:flutter/material.dart';
import 'consumer.dart';
export  'consumer.dart';

abstract class StateViewWidget extends StatelessWidget {
  final ConsumerKey _key = ConsumerKey();

  StateViewWidget({Key? key}) : super(key: key);
  void setState(void Function() fn) => _key.setState(fn);
  void reBuild() => _key.reBuild();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      key: _key,
      child: () => view(context),
    );
  }

  @protected
  Widget view(BuildContext context);
}