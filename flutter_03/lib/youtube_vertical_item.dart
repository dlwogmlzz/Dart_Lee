import 'package:flutter/material.dart';

// stateless widget
class YoutubeVerticalItem extends StatelessWidget {
  // const YoutubeVerticalItem({super.key, required this.height});
  const YoutubeVerticalItem({
    super.key,
    this.height = 100,
    required this.imgUrl,
  });

  final String imgUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    // return Container(height: height, color: Colors.cyan);
    return Column(
      spacing: 10,
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(imgUrl, fit: BoxFit.fitWidth),
              Container(color: Colors.black.withValues(alpha: 0.27)),
              Positioned(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.59),
                      // color: Colors.black.withAlpha(150),
                      child: Padding(
                        // padding: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Text(
                          '3:35',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          // spacing: 20,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                imgUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'アジリティ世界大会2連覇',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '韓国在住、マルプーのホドンくん・1日前',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 3),
                    child: Container(
                      color: Colors.grey.withValues(alpha: 0.59),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 1,
                          bottom: 1,
                        ),
                        child: Text(
                          '4K',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
