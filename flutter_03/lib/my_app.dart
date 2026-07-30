import 'package:flutter/material.dart';
import 'package:flutter_03/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Cloneアプリ',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
