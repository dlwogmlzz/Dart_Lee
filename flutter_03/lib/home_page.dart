import 'package:flutter/material.dart';
import 'package:flutter_03/search_result_page.dart';
import 'package:flutter_03/youtube_horizontal_item.dart';
import 'package:flutter_03/youtube_vertical_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final focusNode = FocusNode();
  final String imgUrl =
      'https://images.unsplash.com/photo-1662157984565-4bdf9b9c3a48?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDA3fHwlRUElQjAlOTUlRUMlOTUlODQlRUMlQTclODB8ZW58MHx8MHx8fDA%3D';

  // 내가 검색한 값
  String searchTerm = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: Icon(Icons.video_call), // video icon 추가
        title: TextField(
          // 사용자가 입력한 input값이 들어옴.
          onChanged: (input) {
            searchTerm = input;
          },
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
            onPressed: () async {
              // await를 사용하려면 onPressed(눌렀을때)에 async가 있어야 한다.
              print('検索クリック');
              // 검색창 클릭시, 포커스 OFF
              focusNode.unfocus();

              // 화면이동, await로 기다리게
              final resultFromDetail = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SearchResultPage(searchTerm: searchTerm),
                ),
              );

              if (resultFromDetail == null) {
                // 받은 데이터가 비어있으면 그냥 리턴
                return;
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('受信データ: $resultFromDetail'),
                  action: SnackBarAction(label: 'OK', onPressed: () {}),
                ),
              );
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Difficult Dart & Flutter'),
                  action: SnackBarAction(label: 'Action', onPressed: () {}),
                ),
              );
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        // 검색창을 눌러놓은 상태(검색창이 포커스)에서 스크롤을 할 경우, 포커스가 사라짐.
        child: NotificationListener<ScrollNotification>(
          // ScrollNotification을 통해서 받을 수 있는 기능.
          // onNotification: (event) {
          //   print(event.metrics.axisDirection);
          onNotification: (event) {
            if (event is ScrollUpdateNotification) {
              if (event.metrics.axis == Axis.vertical) {
                if (event.scrollDelta! > 0) {
                  print('Drag Down');
                } else if (event.scrollDelta! < 0) {
                  print('Drag Up');
                }
              } else {
                if (event.scrollDelta! > 0) {
                  print('Drag Right');
                } else if (event.scrollDelta! < 0) {
                  print('Drag Left');
                }
              }
            }

            if (focusNode.hasFocus) {
              // 만약에 focusNode가 포커스 되어있다면, 포커스를 해지해라.
              focusNode.unfocus();
            }
            return true;
          },
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(50, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: Container(width: 80, color: Colors.cyan),
                      child: YoutubeHorizontalItem(imgUrl: imgUrl),
                    );
                  }),
                ),
              ),
              ...List.generate(50, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: YoutubeVerticalItem(height: 200, imgUrl: imgUrl),
                );
              }),
            ],
          ),
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
