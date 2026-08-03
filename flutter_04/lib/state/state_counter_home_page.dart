import 'package:flutter/material.dart';

// State 화면 + 데이터 + 로직 전부 담고 있음.
// 그래서 각각 화면과 데이터, 로직으로 분할 할수 있도록(mvvm) 하는 것이 좋음.
// 데이터 변경에 따른 제 렌더링을 위해 StatelessWidget에서 StatefulWidget으로 변경
class StateCounterHomePage extends StatefulWidget {
  const StateCounterHomePage({super.key});

  @override
  State<StateCounterHomePage> createState() => _StateCounterHomePageState();
}

class _StateCounterHomePageState extends State<StateCounterHomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("State Counter App")),
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Counter.count : $count",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    count += 1; // count = count + 1;
                  });
                },
                child: Text("카운트 증가"),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    count -= 1; // count = count - 1;

                    if (count < 0) {
                      count = 0;
                    }
                  });
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
