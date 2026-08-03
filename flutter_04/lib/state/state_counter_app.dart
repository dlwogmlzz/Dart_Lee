import 'package:flutter/material.dart';
import 'package:flutter_04/state/state_counter_home_page.dart';

class StateCounterApp extends StatelessWidget {
  const StateCounterApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StateCounterHomePage(),);
  }
}
