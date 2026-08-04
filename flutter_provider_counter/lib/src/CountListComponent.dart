import 'package:flutter/material.dart';
import 'package:flutter_provider_counter/src/CounterProvider.dart';
import 'package:provider/provider.dart';

class CountListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<CounterProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.countList.length,
            itemBuilder: (context, index) =>
                ListTile(title: Text('${provider.countList[index]}')),
          );
        },
      ),
    );
  }
}
