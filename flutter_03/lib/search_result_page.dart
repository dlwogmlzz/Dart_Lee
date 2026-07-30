import 'package:flutter/material.dart';

class SearchResultPage extends StatefulWidget {
  // 1. 데이터 변경을 하기 위해서는 StatelessWidget -> StatefulWidget으로 바꿔줘야함.
  const SearchResultPage({
    super.key,
    required this.searchTerm,
  }); // 2. 바꿔주면 const를 붙일 수 있음.

  final String searchTerm;

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("検索結果画面")),
      // body: SafeArea(child: Center(child: Text("引き継いだ検索ワード: $searchTerm"))),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "引き継いだ検索ワード: ${widget.searchTerm}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("送信カウント: $count"),
              SizedBox(height: 20),

              // button을 클릭하면 추가된 아이템의 숫자가 올라감.
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // setState - 상태가 변경 되었으니 렌더링해라!
                    count = count + 1;
                  });
                },
                child: Text("カウント増加"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // setState - 상태가 변경 되었으니 렌더링해라!
                    count = count - 1;
                    // 0미만으로 내려가질 않게 유효성 검사처리.
                    if (count < 0) {
                      count = 0;
                    }
                  });
                },
                child: Text("カウント減少"),
              ),
              // 닫기 버튼
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, count);
                },
                child: Text("閉じる"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
