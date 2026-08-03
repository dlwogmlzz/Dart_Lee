import 'package:flutter/material.dart';
import 'package:flutter_04/mvvm_change_notifier/mvvm_change_notifier_home_page.dart';

class MvvmChangeNotifierApp extends StatelessWidget {
  const MvvmChangeNotifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MvvnChangeNotifierHomePage(),);
  }
}