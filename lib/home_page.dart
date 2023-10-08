import 'package:flutter/material.dart';
import 'package:my_demo_app/app_bloc.dart';
import 'package:my_demo_app/counter_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppBloc _bloc;

  @override
  void initState() {
    _bloc = AppBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: CounterView(
        count: _bloc.count,
        increment: _bloc.increment,
        decrement: _bloc.decrement,
      ),
    );
  }
}
