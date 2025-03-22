import 'package:flutter/material.dart';
import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:get/get.dart';

Widget defBtn(
  double? width,
  Color? color,
  Function()? onTap,
  String text,
  bool white,
) {
  return Container(
    width: width,
    padding: Themes.edgeMd,
    decoration: BoxDecoration(
      color: color,
      borderRadius: Themes.borderRadiusMd,
    ),
    child: InkWell(
      onTap: onTap,
      child: Text(
        text.tr,
        style: white
            ? Themes.title_lg.copyWith(
                color: Themes.light,
              )
            : Themes.title_lg,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget guestBtn(
  double? width,
  Color? color,
  Function()? onTap,
  String text,
) {
  return Container(
    width: width,
    padding: Themes.edgeMd,
    decoration: BoxDecoration(
      color: color,
      border: Border.all(
        width: 1,
        color: Themes.primary,
      ),
      borderRadius: Themes.borderRadiusMd,
    ),
    child: InkWell(
      onTap: onTap,
      child: Text(
        text.tr,
        style: Themes.title_lg.copyWith(
          color: Themes.primary,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget defLink(Function()? onTap, String text) {
  return InkWell(
    onTap: onTap,
    child: Text(
      text.tr,
      style: Themes.linkStyle,
      textAlign: TextAlign.center,
    ),
  );
}

