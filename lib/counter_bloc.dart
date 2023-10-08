import 'package:flutter/foundation.dart' show immutable;
import 'package:my_demo_app/type_definitions.dart';
import 'package:rxdart/rxdart.dart';

enum CounterAction {
  increment,
  decrement,
}

@immutable
class CounterBloc {
  final Sink<CounterAction> action;
  final Stream<Count> count;

  const CounterBloc._({
    required this.action,
    required this.count,
  });

  factory CounterBloc() {
    final action = BehaviorSubject<CounterAction>();

    final Stream<Count> result = action.scan(
      (current, type, _) =>
          type == CounterAction.increment ? current + 1 : current - 1,
      0,
    );

    return CounterBloc._(
      action: action.sink,
      count: result,
    );
  }

  void dispose() {
    action.close();
  }
}
