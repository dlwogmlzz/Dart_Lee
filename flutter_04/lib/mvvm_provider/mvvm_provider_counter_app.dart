import 'package:flutter/material.dart';
import 'package:flutter_04/mvvm_provider/mvvn_provider_home_page.dart';

class MvvmProviderCounterApp extends StatelessWidget {
  const MvvmProviderCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MvvnProviderHomePage(),);
  }
}