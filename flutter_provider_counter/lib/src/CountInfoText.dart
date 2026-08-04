import 'package:flutter/material.dart';
import 'package:flutter_provider_counter/src/CounterProvider.dart';
import 'package:provider/provider.dart';

class CountInfoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<CounterProvider>().counter}', // watch, 데이터 변경감지
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
