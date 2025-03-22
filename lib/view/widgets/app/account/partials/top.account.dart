import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget avatarAccountSide(String avatar, String name, String email) {
  return Row(
    children: [
      CircleAvatar(
        radius: Spacing.xl,
        backgroundColor: Themes.primary.withOpacity(0.2),
        backgroundImage: AssetImage(
          AppImg.placeholder,
        ),
        foregroundImage: avatar != "" ? NetworkImage(avatar) : null,
      ),
      Themes.spaceX8,
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Themes.text_base.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Themes.spaceY4,
          Text(
            email,
            style: Themes.text_sm.copyWith(
              color: Themes.grayText,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget accountIconBtn(
  double? width,
  Color? color,
  Function()? onTap,
  String img,
  String text,
) {
  return Container(
    width: width,
    padding: Themes.edgeMd,
    decoration: BoxDecoration(
      color: color,
      borderRadius: Themes.borderRadiusMd,
      border: Border.all(
        width: 1,
        color: Themes.stroke,
        style: BorderStyle.solid,
      ),
    ),
    child: InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            img,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          Themes.spaceY8,
          Text(
            text.tr,
            style: Themes.text_base.copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
