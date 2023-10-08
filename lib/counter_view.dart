import 'package:flutter/material.dart';
import 'package:my_demo_app/type_definitions.dart';

class CounterView extends StatelessWidget {
  final Stream<Count> count;
  final IncrementFunction increment;
  final DecrementFunction decrement;

  const CounterView({
    super.key,
    required this.count,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder(
            stream: count,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'Count: ${snapshot.requireData}',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                );
              } else {
                return Text(
                  'Waiting for count data',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                );
              }
            },
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.outlined(
                onPressed: increment,
                icon: const Icon(Icons.add),
              ),
              const SizedBox(width: 10.0),
              IconButton.outlined(
                onPressed: decrement,
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
