import 'package:flutter/material.dart';
import 'package:flutter_provider_counter/src/CounterProvider.dart';
import 'package:provider/provider.dart';

class AddCountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () =>
          context.read<CounterProvider>().incrementCounter(), // 데이터 호출할때는 read
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
