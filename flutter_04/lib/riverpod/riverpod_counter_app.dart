import 'package:flutter/material.dart';
import 'package:flutter_04/riverpod/riverpod_counter_home_page.dart';

class RiverpodCounterApp extends StatelessWidget {
  const RiverpodCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RiverpodCounterHomePage(),
    );
  }
}
