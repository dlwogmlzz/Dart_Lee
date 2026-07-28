import 'package:flutter/material.dart';

class FirstMissionPage extends StatelessWidget {
  const FirstMissionPage({super.key});

  final String buttontitle = "ユーチューブショッピングへ移動!";

  final String imgSrc =
      "https://images.unsplash.com/photo-1785038278893-6e708804c1be?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxMHx8fGVufDB8fHx8fA%3D%3D";
  final String title = "タイトル";
  final String desc = "説明です。";

  static final Widget missionTitle = Text(
    '最新の提携先メリット',
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          alignment: Alignment.center,
          // color: Colors.amberAccent,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                missionTitle,
                BannerItem(imgSrc: imgSrc, title: title, desc: desc),
                BannerItem(imgSrc: imgSrc, title: title, desc: desc),
                AdsButton(title: buttontitle),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static final Widget missionBox = Container(
    height: 100,
    color: Colors.lightGreenAccent,
  );
  // required String imgSrc = "https://images.unsplash.com/photo-1785038278893-6e708804c1be?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxMHx8fGVufDB8fHx8fA%3D%3D",
  // required String title,
  // required String desc,
  // 기본 값이 있으면 required를 빼야됨.
}

class AdsButton extends StatelessWidget {
  const AdsButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey,
      ),
      onPressed: () {
        print('버튼 클릭됨 :$title');
      },
      child: Text(title),
    );
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required this.imgSrc,
    required this.title,
    required this.desc,
  });

  final String imgSrc;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            height: 100,
            width: 100,
            imgSrc,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(title), Text(desc)],
        ),
      ],
    );
  }
}

// ClipRRect (
//   borderRadius: BorderRadius.circular(8.0),
//   child: Image.network(
//     subject['images']['large'],
//     height: 150.0,
//     width: 100.0,
//   ),
// )
