import 'package:flutter/material.dart';
import 'package:flutter_04/bloc/bloc_counter_home_page.dart';
import 'package:flutter_04/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCounterApp extends StatelessWidget {
  const BlocCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: BlocCounterHomePage(),
      ),
    );
  }
}
