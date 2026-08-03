import 'package:flutter/material.dart';

class FirstScrollPage extends StatelessWidget {
  const FirstScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('初めのスクロール'), centerTitle: true),
      body: SafeArea(child: _getListBody()),
    );
  }

  Widget _getListBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(100, (index) {
        // 10000개면 스크롤 안됨.. 렉걸림

        if (index % 2 == 0) {
          return SizedBox(height: 300, child: _getHorizontalList());
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: Text(
              'Item Index : $index',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ), // Container alignment - 내부 아이템 요소 위치 잡기.
          ),
        );
      }),
    );
  }

  Widget _getHorizontalList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(100, (index) {
        // 10000개면 스크롤 안됨.. 렉걸림
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.deepOrange,
            alignment: Alignment.center,
            child: Text(
              'Item Index : $index',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ), // Container alignment - 내부 아이템 요소 위치 잡기.
          ),
        );
      }),
    );

    Widget getScrollBody() {
      return SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: List.generate(100, (index) {
            // 10000개면 스크롤 안됨..
            return Container(
              width: 200,
              height: 200,
              color: Colors.greenAccent,
              alignment: Alignment.center,
              child: Text(
                'Item Index : $index',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ), // Container alignment - 내부 아이템 요소 위치 잡기.
            );
          }),
        ),
      );
    }
  }
}
