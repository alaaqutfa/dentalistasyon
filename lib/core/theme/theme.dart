import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:themed/themed.dart';

class Themes {
  //* Custom Colors :
  static const primary = ColorRef(AppColor.primary);
  static const accentCyan = ColorRef(AppColor.accentCyan);
  static const healthGreen = ColorRef(AppColor.healthGreen);
  static const lightGray = ColorRef(AppColor.lightGray);
  static const darkBlue = ColorRef(AppColor.darkBlue);
  static const light = ColorRef(AppColor.light);
  static const dark = ColorRef(AppColor.dark);
  static const success = ColorRef(AppColor.success);
  static const error = ColorRef(AppColor.error);
  static const link = ColorRef(AppColor.link);
  static const stroke = ColorRef(AppColor.stroke);
  static const grayText = ColorRef(AppColor.grayText);
  static const iconGray = ColorRef(AppColor.iconGray);
  static const whiteGray = ColorRef(AppColor.whiteGray);
  static const text = ColorRef(AppColor.textDark);
  static const bg = ColorRef(AppColor.backgroundWhite);
  static ColorRef shimmerBase = ColorRef(AppColor.shimmerBase);
  static ColorRef shimmerHighlighted = ColorRef(AppColor.shimmerHighlighted);

  //* Custom Styles :
  static var title_2xl = TextStyleRef(
    TextStyle(
      fontSize: FontSizes.xxl,
      color: AppColor.textDark,
      fontWeight: FontWeight.w700,
    ),
  );
  static var title_xl = TextStyleRef(
    TextStyle(
      fontSize: FontSizes.xl,
      color: AppColor.textDark,
      fontWeight: FontWeight.w600,
    ),
  );
  static var title_lg = TextStyleRef(
    TextStyle(
      fontSize: FontSizes.lg,
      color: AppColor.textDark,
      fontWeight: FontWeight.w500,
    ),
  );
  static var text_base = TextStyleRef(
    TextStyle(
      fontSize: FontSizes.base,
      color: AppColor.textDark,
      fontWeight: FontWeight.w400,
    ),
  );
  static var text_sm = TextStyleRef(
    TextStyle(
      fontSize: FontSizes.sm,
      color: AppColor.textDark,
      fontWeight: FontWeight.w400,
    ),
  );
  static var text_xs = TextStyleRef(
    TextStyle(
      fontSize: FontSizes.xs,
      color: AppColor.textDark,
      fontWeight: FontWeight.w400,
    ),
  );
  static const linkStyle = TextStyleRef(
    TextStyle(
      fontSize: FontSizes.sm,
      color: AppColor.link,
      fontWeight: FontWeight.w500,
    ),
  );
  static const decorationLinkStyle = TextStyleRef(
    TextStyle(
      fontSize: FontSizes.sm,
      color: AppColor.link,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
      decorationColor: AppColor.link,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 2,
    ),
  );

  //* Custom EdgeInsets :
  static const EdgeInsets edgeXs = EdgeInsets.all(Spacing.xs);
  static const EdgeInsets edgeSm = EdgeInsets.all(Spacing.sm);
  static const EdgeInsets edgeMd = EdgeInsets.all(Spacing.md);
  static const EdgeInsets edgeLg = EdgeInsets.all(Spacing.lg);

  //* Custom BorderRadius :
  static const BorderRadius borderRadiusXs =
      BorderRadius.all(Radius.circular(Spacing.xs));
  static const BorderRadius borderRadiusSm =
      BorderRadius.all(Radius.circular(Spacing.sm));
  static const BorderRadius borderRadiusMd =
      BorderRadius.all(Radius.circular(Spacing.md));
  static const BorderRadius borderRadiusLg =
      BorderRadius.all(Radius.circular(Spacing.lg));

  //* Custom BoxShadow :
  static const BoxShadow sm = BoxShadow(
    color: Colors.black26,
    blurRadius: 2.0,
    offset: Offset(0, 1),
  );
  static const BoxShadow md = BoxShadow(
    color: Colors.black38,
    blurRadius: 4.0,
    offset: Offset(0, 2),
  );

  //* Custom Widgets :
  static const Widget spaceY64 = SizedBox(height: 64);
  static const Widget spaceY32 = SizedBox(height: 32);
  static const Widget spaceY16 = SizedBox(height: 16);
  static const Widget spaceY24 = SizedBox(height: 24);
  static const Widget spaceY8 = SizedBox(height: 8);
  static const Widget spaceY4 = SizedBox(height: 4);
  static const Widget spaceX32 = SizedBox(width: 32);
  static const Widget spaceX24 = SizedBox(width: 24);
  static const Widget spaceX16 = SizedBox(width: 16);
  static const Widget spaceX8 = SizedBox(width: 8);
  static const Widget spaceX4 = SizedBox(width: 4);
}
