import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';

class LocalesBody extends StatelessWidget {
  final String currentLocale;
  final Function()? onTapEn;
  final Function()? onTapTr;
  const LocalesBody(
      {super.key, this.onTapEn, this.onTapTr, required this.currentLocale});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Themes.edgeMd,
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          InkWell(
            onTap: onTapEn,
            child: Card(
                child: Padding(
              padding: Themes.edgeSm,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImg.en_icon,
                        width: Spacing.xxl,
                      ),
                      Themes.spaceX16,
                      Text("English"),
                    ],
                  ),
                  currentLocale == "en"
                      ? Image.asset(
                          AppImg.verify_icon,
                          width: Spacing.lg,
                        )
                      : Container(),
                ],
              ),
            )),
          ),
          InkWell(
            onTap: onTapTr,
            child: Card(
                child: Padding(
              padding: Themes.edgeSm,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImg.tr_icon,
                        width: Spacing.xxl,
                      ),
                      Themes.spaceX16,
                      Text("Türkçe"),
                    ],
                  ),
                  currentLocale == "tr"
                      ? Image.asset(
                          AppImg.verify_icon,
                          width: Spacing.lg,
                        )
                      : Container(),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
