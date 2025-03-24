import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/widgets/partials/appImg.dart';
import 'package:dentalistasyon/view/widgets/partials/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

homeSection(String title, Function()? onTapSeeAll, Widget content) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.tr,
            style: Themes.title_lg,
          ),
          InkWell(
            onTap: onTapSeeAll,
            child: Row(
              children: [
                Text(
                  "See All".tr,
                  style: Themes.linkStyle,
                ),
                Themes.spaceX8,
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Themes.link,
                  size: Spacing.md,
                ),
              ],
            ),
          )
        ],
      ),
      Themes.spaceY16,
      content
    ],
  );
}

Widget hotDeal(Map<String, dynamic> deal) {
  String name = deal["name"] ?? "";
  String imgUrl = deal["imgUrl"] ?? "";
  String newPrice = deal["newPrice"] ?? 0;
  String discounted_price = deal["discounted_price"] ?? 0;
  String discountPercentage = deal["discountPercentage"] ?? 0;
  String rate = deal["rate"].toString();
  String sold = deal["sold"] ?? "0";
  return SizedBox(
    width: double.infinity,
    height: 110,
    child: Card(
      margin: const EdgeInsets.only(right: Spacing.md),
      color: Themes.bg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Spacing.md), // تحديد نصف القطر
        side: BorderSide(
          width: 1, // عرض الحدود
          color: Themes.stroke, // لون الحدود
        ),
      ),
      child: Stack(
        children: [
          // محتوى البطاقة الرئيسي
          Row(
            children: [
              // صورة المنتج
              hotDealImg(imgUrl),
              Themes.spaceX8,
              // بقية التفاصيل
              Padding(
                padding: Themes.edgeXs,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // السعر
                    defDiscountPrice(newPrice, discounted_price, "TL"),
                    // اسم المنتج
                    defProductEllipsisName(name, 150, 2),
                    // التقيم وعدد المبيعات
                    defRateAndSold(rate, sold),
                  ],
                ),
              ),
            ],
          ),

          // العداد التنازلي (مثال ثابت هنا)
          Positioned(
            top: Spacing.sm,
            right: Spacing.sm,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTimeBox('05', "D"),
                buildTimeBox('05', "H"),
                buildTimeBox('05', "M"),
                buildTimeBox('05', "S"),
              ],
            ),
          ),

          // شارة الخصم في الزاوية العلوية اليسرى
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: Themes.edgeXs,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Spacing.md),
                  bottomRight: Radius.circular(Spacing.md),
                ),
              ),
              child: Text(
                '-$discountPercentage%',
                style: Themes.text_base.copyWith(
                  color: Themes.light,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget hotDealImg(String img) {
  return Container(
    width: 120,
    height: 110,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Spacing.md),
        bottomLeft: Radius.circular(Spacing.md),
      ),
      color: Colors.transparent,
    ),
    clipBehavior: Clip.antiAlias,
    child: AppNetworkImg(
      img,
      width: 120,
      height: 110,
      fit: BoxFit.contain,
      assetFit: BoxFit.cover,
    ),
  );
}

// ويدجت بسيطة لبناء خانة للوقت (يمكن استبدال القيم بحساب حقيقي)
Widget buildTimeBox(String value, String char) {
  return Container(
    width: 20,
    height: 20,
    margin: const EdgeInsets.symmetric(
      horizontal: Spacing.xs / 2,
    ),
    padding: EdgeInsets.symmetric(horizontal: Spacing.xs / 2),
    decoration: BoxDecoration(
      color: Themes.error,
      borderRadius: Themes.borderRadiusXs / 2,
    ),
    child: Column(
      children: [
        Text(
          value,
          style: Themes.text_sm.copyWith(
            color: Themes.light,
            fontSize: Spacing.sm + 2,
          ),
        ),
        Text(
          char,
          style: Themes.text_sm.copyWith(
            color: Themes.light,
            fontWeight: FontWeight.w500,
            fontSize: Spacing.xs,
          ),
        ),
      ],
    ),
  );
}

Widget brand(Map<String, dynamic> brand) {
  String name = brand["name"] ?? "";
  String imgUrl = brand["img"] ?? "";
  return Container(
    margin: EdgeInsets.only(right: Spacing.md),
    child: Column(
      children: [
        // صورة البراند
        CircleAvatar(
          radius: 45,
          backgroundColor: Themes.light,
          child: ClipOval(
            child: AppNetworkImg(
              imgUrl,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              assetFit: BoxFit.cover,
            ),
          ),
        ),
        Themes.spaceY16,
        // اسم البراند
        Text(
          name,
          style: Themes.text_base,
        ),
      ],
    ),
  );
}
