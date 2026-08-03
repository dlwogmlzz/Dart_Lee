import 'package:flutter/material.dart';
import 'package:flutter_04/mvvm_change_notifier/counter_viewmodel.dart';
import 'package:provider/provider.dart';

class MvvnProviderHomePage extends StatelessWidget {
  const MvvnProviderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MVVM Provider Counter App")),
      body: SafeArea(
        child: Center(
          // provider - comsumer
          child: Consumer<CounterViewmodel>(
            builder: (context, viewModel, child) {
              return Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Counter.count : ${viewModel.count}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      viewModel.countUp();
                    },
                    child: Text("카운트 증가"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      viewModel.countDown();
                    },
                    child: Text("카운트 감소"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
