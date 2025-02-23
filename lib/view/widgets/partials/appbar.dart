import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget? defAppBar(String title,bool? centerTitle) {
  return AppBar(
    backgroundColor: Themes.bg,
    title: Text(
      title.tr,
      style: Themes.title_xl,
    ),
    centerTitle: centerTitle,
  );
}
