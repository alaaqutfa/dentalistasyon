import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  const PageBody({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Themes.edgeMd,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: (MediaQuery.of(context).size.width - 100) + 32,
          ),
          Themes.spaceY32,
          Text(
            icon,
            style: Themes.title_2xl.copyWith(
              fontSize: Spacing.rem * 2,
            ),
          ),
          Themes.spaceY8,
          Text(
            title,
            style: Themes.title_xl,
            textAlign: TextAlign.start,
          ),
          Themes.spaceY8,
          Text(
            description,
            style: Themes.text_base,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
