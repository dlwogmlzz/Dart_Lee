import 'package:flutter/material.dart';
import 'package:flutter_04/riverpod/riverpod_counter_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final riverpodCounterProvider =
    NotifierProvider<RiverpodCounterNotifier, CounterState>(() {
      return RiverpodCounterNotifier();
    });
// final riverpodcCounterProvider =
//     NotifierProvider<RiverpodCounterNotifier, CounterState>(
//       RiverpodCounterNotifier.new,
//     );

// class RiverpodCounterHomePage extends StatelessWidget {
//   RiverpodCounterHomePage({super.key});

class RiverpodCounterHomePage extends ConsumerWidget {
  const RiverpodCounterHomePage({super.key});

  // final GetxCounterController controller = Get.put(GetxCounterController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Riverpod Counter App")),
      body: SafeArea(
        child: Center(
          // provider - comsumer
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 데이터 가져오기
              ConsumerCounterText(), // 내부적으로 알아서 렌더링이 됨.

              ElevatedButton(
                onPressed: () {
                  ref.read(riverpodCounterProvider.notifier).countUp();
                  // controller.countUp();
                },
                child: Text("카운트 증가"),
              ),

              ElevatedButton(
                onPressed: () {
                  ref.read(riverpodCounterProvider.notifier).countDown();
                  // controller.countDown();
                },
                child: Text("카운트 감소"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConsumerCounterText extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref - reference형태로 riverpod를 통해 접근할수 있는 것.
    return Text(
      "Counter.count : ${ref.watch(riverpodCounterProvider).count}", // 데이터변경에 대해서 감지하는 것이기 때문에 watch(데이터를 받아보는것)를 사용한다.
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
