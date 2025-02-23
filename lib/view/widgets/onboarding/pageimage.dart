import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:flutter/material.dart';

class PageImage extends StatelessWidget {
  final String imagePath;
  const PageImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: Themes.edgeMd,
      child: Image.asset(
        imagePath,
        width: MediaQuery.of(context).size.width - 100,
        height: MediaQuery.of(context).size.width - 100,
        fit: BoxFit.contain,
      ),
    );
  }
}
