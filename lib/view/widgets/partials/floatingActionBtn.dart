import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

Widget defFloatingActionButton(BuildContext context) {
  return InkWell(
    onTap: () {
      AppDialog.customQuestion(
        context,
        "Need help?",
        "Contact us",
        FontAwesome.whatsapp,
        Themes.success,
        Themes.primary,
        FontAwesome.phone,
        () async {
          await showPage("tel:+905319463598");
        },
        () async {
          await showPage("https://wa.me/905319463598");
        },
        "",
        "",
      );
    },
    child: CircleAvatar(
      backgroundColor: Themes.primary,
      radius: Spacing.lg,
      child: Image.asset(
        AppImg.contact_icon,
        color: Themes.light,
        width: Spacing.xxl,
        height: Spacing.xxl,
      ),
    ),
  );
}
