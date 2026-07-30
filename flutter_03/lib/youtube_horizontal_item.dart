import 'package:flutter/material.dart';

class YoutubeHorizontalItem extends StatelessWidget {
  const YoutubeHorizontalItem({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          // 사진을 지정된 높이로 딱맞추기
          fit: StackFit.expand,
          children: [
            Image.network(imgUrl, fit: BoxFit.cover),
            // withAlpha(100)
            // Container(color: Colors.black.withAlpha(100)),
            Container(
              color: Colors.black.withValues(
                alpha: 0.39,
              ), // 변환 공식: 원래 값(100) / 255.0
            ),
            // 아이템의 위치를 넣음
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "世界のドッグアジリティ優勝犬",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "再生回数1億回",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
