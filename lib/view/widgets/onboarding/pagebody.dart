import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  final String title;
  final String description;
  const PageBody({
    super.key,
    required this.title,
    required this.description,
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
            title,
            style: Themes.title_xl,
            textAlign: TextAlign.center,
          ),
          Themes.spaceY32,
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              description,
              style: Themes.text_base,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
