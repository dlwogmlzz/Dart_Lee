import 'package:flutter/material.dart';
import 'package:flutter_provider_counter/src/AddCountButton.dart';
import 'package:flutter_provider_counter/src/CountInfoText.dart';
import 'package:flutter_provider_counter/src/CountListComponent.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('그만 두고 싶다...'),
            CountInfoText(),
            CountListComponent(),
          ],
        ),
      ),
      floatingActionButton: AddCountButton(),
    );
  }
}