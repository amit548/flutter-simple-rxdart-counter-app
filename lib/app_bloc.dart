import 'package:flutter/foundation.dart' show immutable;
import 'package:my_demo_app/counter_bloc.dart';

@immutable
class AppBloc {
  final CounterBloc _counterBloc;

  const AppBloc._({required CounterBloc counterBloc})
      : _counterBloc = counterBloc;

  factory AppBloc() {
    final counterBloc = CounterBloc();
    return AppBloc._(
      counterBloc: counterBloc,
    );
  }

  Stream<int> get count => _counterBloc.count;

  void increment() => _counterBloc.action.add(CounterAction.increment);

  void decrement() => _counterBloc.action.add(CounterAction.decrement);

  void dispose() {
    _counterBloc.dispose();
  }
}
