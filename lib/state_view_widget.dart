// ignore_for_file: must_be_immutable, invalid_use_of_protected_member, no_logic_in_create_state
library state_view_widget;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_view_widget/consumer.dart';
export 'package:flutter/material.dart';

abstract class StateViewWidget extends StatefulWidget2 {
  StateViewWidget({super.key, this.ref});
  WidgetRef? ref;
  StateView? _state;
  void reBuild() {
    try {
      _state!.setState(() {});
    } on Exception catch (e) {
      print(e);
    }
  }
}

// abstract class StateView<T extends StateViewWidget> extends State {
//   T get model => widget as T;
//   @override
//   void initState() {
//     super.initState();
//     model._state = this;
//   }
// }



const String _flutterWidgetsLibrary = 'package:flutter/widgets.dart';

enum _StateLifecycle {
  created,
  initialized,
  ready,
  defunct,
}

@optionalTypeArgs
abstract class StateView<T extends StateViewWidget> with Diagnosticable {
  T get widget => _widget!;
  T? _widget;

  _StateLifecycle _debugLifecycleState = _StateLifecycle.created;

  bool _debugTypesAreRight(Widget widget) => widget is T;

  BuildContext get context {
    assert(() {
      if (_element == null) {
        throw FlutterError(
          'This widget has been unmounted, so the State no longer has a context (and should be considered defunct). \n'
          'Consider canceling any active work during "dispose" or using the "mounted" getter to determine if the State is still active.',
        );
      }
      return true;
    }());
    return _element!;
  }
  StatefulElement? _element;

  bool get mounted => _element != null;
  @protected
  @mustCallSuper
  void initState() {
    assert(_debugLifecycleState == _StateLifecycle.created);
    if (kFlutterMemoryAllocationsEnabled) {
      FlutterMemoryAllocations.instance.dispatchObjectCreated(
        library: _flutterWidgetsLibrary,
        className: '$State',
        object: this,
      );
    }
  }

  @mustCallSuper
  @protected
  void didUpdateWidget(covariant T oldWidget) { }

  @protected
  @mustCallSuper
  void reassemble() { }

  @protected
  void setState(VoidCallback fn) {
    assert(() {
      if (_debugLifecycleState == _StateLifecycle.defunct) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('setState() called after dispose(): $this'),
          ErrorDescription(
            'This error happens if you call setState() on a State object for a widget that '
            'no longer appears in the widget tree (e.g., whose parent widget no longer '
            'includes the widget in its build). This error can occur when code calls '
            'setState() from a timer or an animation callback.',
          ),
          ErrorHint(
            'The preferred solution is '
            'to cancel the timer or stop listening to the animation in the dispose() '
            'callback. Another solution is to check the "mounted" property of this '
            'object before calling setState() to ensure the object is still in the '
            'tree.',
          ),
          ErrorHint(
            'This error might indicate a memory leak if setState() is being called '
            'because another object is retaining a reference to this State object '
            'after it has been removed from the tree. To avoid memory leaks, '
            'consider breaking the reference to this object during dispose().',
          ),
        ]);
      }
      if (_debugLifecycleState == _StateLifecycle.created && !mounted) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('setState() called in constructor: $this'),
          ErrorHint(
            'This happens when you call setState() on a State object for a widget that '
            "hasn't been inserted into the widget tree yet. It is not necessary to call "
            'setState() in the constructor, since the state is already assumed to be dirty '
            'when it is initially created.',
          ),
        ]);
      }
      return true;
    }());
    final Object? result = fn() as dynamic;
    assert(() {
      if (result is Future) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('setState() callback argument returned a Future.'),
          ErrorDescription(
            'The setState() method on $this was called with a closure or method that '
            'returned a Future. Maybe it is marked as "async".',
          ),
          ErrorHint(
            'Instead of performing asynchronous work inside a call to setState(), first '
            'execute the work (without updating the widget state), and then synchronously '
            'update the state inside a call to setState().',
          ),
        ]);
      }
      // We ignore other types of return values so that you can do things like:
      //   setState(() => x = 3);
      return true;
    }());
    _element!.markNeedsBuild();
  }
  @protected
  @mustCallSuper
  void deactivate() { }

  @protected
  @mustCallSuper
  void activate() { }

  @protected
  @mustCallSuper
  void dispose() {
    assert(_debugLifecycleState == _StateLifecycle.ready);
    assert(() {
      _debugLifecycleState = _StateLifecycle.defunct;
      return true;
    }());
    if (kFlutterMemoryAllocationsEnabled) {
      FlutterMemoryAllocations.instance.dispatchObjectDisposed(object: this);
    }
  }

  @protected
  @mustCallSuper
  Widget build(BuildContext context){
    widget._state = this;
    return const Placeholder();
  }

  @protected
  @mustCallSuper
  void didChangeDependencies() { }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    assert(() {
      properties.add(EnumProperty<_StateLifecycle>('lifecycle state', _debugLifecycleState, defaultValue: _StateLifecycle.ready));
      return true;
    }());
    properties.add(ObjectFlagProperty<T>('_widget', _widget, ifNull: 'no widget'));
    properties.add(ObjectFlagProperty<StatefulElement>('_element', _element, ifNull: 'not mounted'));
  }
}


////////////////
///////////////
///
///
///
abstract class StatefulWidget2 extends Widget {
  /// Initializes [key] for subclasses.
  const StatefulWidget2({ super.key });

  /// Creates a [StatefulElement] to manage this widget's location in the tree.
  ///
  /// It is uncommon for subclasses to override this method.
  @override
  StatefulElement createElement() => StatefulElement(this as StatefulWidget);

  /// Creates the mutable state for this widget at a given location in the tree.
  ///
  /// Subclasses should override this method to return a newly created
  /// instance of their associated [State] subclass:
  ///
  /// ```dart
  /// @override
  /// State<SomeWidget> createState() => _SomeWidgetState();
  /// ```
  ///
  /// The framework can call this method multiple times over the lifetime of
  /// a [StatefulWidget]. For example, if the widget is inserted into the tree
  /// in multiple locations, the framework will create a separate [State] object
  /// for each location. Similarly, if the widget is removed from the tree and
  /// later inserted into the tree again, the framework will call [createState]
  /// again to create a fresh [State] object, simplifying the lifecycle of
  /// [State] objects.
  @protected
  @factory
  StateView createState();
}


