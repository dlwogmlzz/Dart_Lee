import 'package:flutter/material.dart';
import 'package:flutter_04/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class RiverpodCounterHomePage extends StatelessWidget {
//   RiverpodCounterHomePage({super.key});

class BlocCounterHomePage extends StatelessWidget {
  const BlocCounterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bloc Counter App")),
      body: SafeArea(
        child: Center(
          // provider - comsumer
          child: BlocBuilder<CounterBloc, BlocCounterState>(
            builder: (context, state) {
              return Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 데이터 가져오기
                  Text(
                    "Counter.count : ${state.count}", // 데이터변경에 대해서 감지하는 것이기 때문에 watch(데이터를 받아보는것)를 사용한다.
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterUpEvent());
                    },
                    child: Text("카운트 증가"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterDownEvent());
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
