import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget langBtn() {
  return InkWell(
    onTap: () {
      Get.toNamed(AppRoutes.locales);
    },
    child: SizedBox(
      width: Spacing.lg,
      height: Spacing.lg,
      child: Image.asset(
        AppImg.language_icon,
        color: Themes.primary,
        fit: BoxFit.contain,
      ),
    ),
  );
}
