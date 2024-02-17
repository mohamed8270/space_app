import 'package:flutter/material.dart';
import 'package:space_app/constants/theme.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.ScreenSize,
    required this.imgurl,
  });

  final Size ScreenSize;
  final String imgurl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: ScreenSize.height * 0.4,
        width: ScreenSize.width * 0.75,
        decoration: BoxDecoration(
          color: Swhite.withOpacity(0.03),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imgurl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
