import 'package:flutter/material.dart';
import 'package:flutter_02/pages/first_scroll_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scroll',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue,
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const FirstScrollPage(),
    );
  }
}
