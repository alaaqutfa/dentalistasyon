import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget homeNav(
  String avatar,
  String name,
  String address,
  Function()? onPressedMail,
  Function()? onPressedNotfi,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      avatarSide(avatar, name, address),
      notfiSide(
        onPressedMail,
        onPressedNotfi,
      ),
    ],
  );
}

Widget avatarSide(String avatar, String name, String address) {
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
            style: Themes.title_lg,
          ),
          Themes.spaceY4,
          Text(
            address,
            style: Themes.text_base,
          ),
        ],
      ),
    ],
  );
}

Widget notfiSide(
  Function()? onPressedMail,
  Function()? onPressedNotfi,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      navIcon(onPressedMail, FontAwesomeIcons.commentDots),
      navIcon(onPressedNotfi, FontAwesomeIcons.bell),
    ],
  );
}

Widget navIcon(Function()? onPressed, IconData? icon) {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      IconButton(
        onPressed: onPressed,
        iconSize: Spacing.lg,
        color: Themes.grayText.withOpacity(0.5),
        icon: FaIcon(
          icon,
        ),
      ),
      Positioned(
        bottom: Spacing.xl - 2,
        right: Spacing.sm + 2,
        child: CircleAvatar(
          radius: Spacing.sm / 2,
          backgroundColor: Themes.error,
        ),
      ),
    ],
  );
}
