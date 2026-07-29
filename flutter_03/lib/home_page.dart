import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: Icon(Icons.video_call), // video icon 추가
        title: TextField(
          focusNode: focusNode,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('検索クリック');
              // 검색창 클릭시, 포커스 OFF
              focusNode.unfocus();
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print('録音スタート');
              // 녹음버튼 클릭시, 다시 포커스 ON
              focusNode.requestFocus();
            },
            icon: Icon(Icons.mic),
          ),
          IconButton(
            onPressed: () {
              print('その他..');
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(100, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: 80, color: Colors.cyan),
                  );
                }),
              ),
            ),
            ...List.generate(100, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 150, color: Colors.lightGreenAccent),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Shorts"),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_rounded),
            label: "My Page",
          ),
        ],
      ),
    );
  }
}
