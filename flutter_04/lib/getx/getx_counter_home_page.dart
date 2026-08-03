import 'package:flutter/material.dart';
import 'package:flutter_04/getx/getx_counter_controller.dart';
import 'package:get/get.dart';

class GetxCounterHomePage extends StatelessWidget {
  GetxCounterHomePage({super.key});

  final GetxCounterController controller = Get.put(GetxCounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Getx Counter App")),
      body: SafeArea(
        child: Center(
          // provider - comsumer
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 데이터 가져오기
              Obx(
                () => Text(
                  "Counter.count : ${controller.count}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  controller.countUp();
                },
                child: Text("카운트 증가"),
              ),

              ElevatedButton(
                onPressed: () {
                  controller.countDown();
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
