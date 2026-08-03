import 'package:flutter/material.dart';
import 'package:flutter_04/getx/getx_counter_home_page.dart';

class GetxCounterApp extends StatelessWidget {
  const GetxCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetxCounterHomePage(),
    );
  }
}
