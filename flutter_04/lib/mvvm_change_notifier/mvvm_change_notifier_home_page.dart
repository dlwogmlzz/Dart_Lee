import 'package:flutter/material.dart';
import 'package:flutter_04/mvvm_change_notifier/counter_viewmodel.dart';

class MvvnChangeNotifierHomePage extends StatelessWidget {
  MvvnChangeNotifierHomePage({super.key});

  final viewModel = CounterViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MVVM Counter App")),
      body: SafeArea(
        child: Center(
          child: ListenableBuilder(
            // ListenableBuilder에 mvvm을 연결시켜줘야 한다.
            listenable: viewModel,
            builder: (countext, child) {
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
