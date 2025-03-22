import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget product(
  BuildContext context,
  Map<String, dynamic> product,
  bool hadToolTip,
  String toolTipText,
  Color toolTipColor, {
  Function()? onPressedFavBtn,
}) {
  String name = product["name"] ?? "";
  String imgUrl = product["img"] ?? "";
  String price = product["price"] ?? "";
  String rate = product["rate"] ?? "0";
  String sold = product["sold"] ?? "0";
  bool isInWishlist = product["isInWishlist"] ?? false;
  return SizedBox(
    width: MediaQuery.of(context).size.width / 2 - 30,
    height: 230,
    child: Card(
      margin: const EdgeInsets.only(right: Spacing.md, bottom: Spacing.md),
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
          // محتوى المنتج الرئيسي
          Column(
            children: [
              // صورة المنتج
              defProductImg(imgUrl),
              // بقية التفاصيل
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // اسم المنتج & زر المفضلة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // اسم المنتج
                        defProductEllipsisName(name, 100, 1),
                        // زر المفضلة
                        defProductFavBtn(onPressedFavBtn, isInWishlist),
                      ],
                    ),
                    Themes.spaceY4,
                    // السعر - العملة
                    defPrice(price, "TL"),
                    Themes.spaceY4,
                    // التقيم وعدد المبيعات
                    defRateAndSold(rate, sold),
                  ],
                ),
              ),
            ],
          ),

          // Tooltip
          hadToolTip
              ? Positioned(
                  top: Spacing.md,
                  left: Spacing.md,
                  child: offerToolTip(toolTipColor, toolTipText),
                )
              : Container(),
        ],
      ),
    ),
  );
}

Widget offerToolTip(
  Color toolTipColor,
  String toolTipText,
) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: Spacing.sm,
      vertical: Spacing.xs,
    ),
    decoration: BoxDecoration(
      borderRadius: Themes.borderRadiusSm,
      color: toolTipColor,
    ),
    child: Text(
      toolTipText.tr,
      style: Themes.text_base.copyWith(
        color: Themes.light,
        fontSize: 9,
      ),
    ),
  );
}

Widget defProduct(
  Map<String, dynamic> product,
  bool hadToolTip,
  String toolTip,
  Color toolTipColor,
) {
  String name = product["name"] ?? "";
  String imgUrl = product["img"] ?? "";
  String price = product["price"] ?? "";
  String rate = product["rate"] ?? "0";
  String sold = product["sold"] ?? "0";
  return SizedBox(
    width: 160,
    height: 230,
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
          // محتوى المنتج الرئيسي
          Column(
            children: [
              // صورة المنتج
              defProductImg(imgUrl),
              // بقية التفاصيل
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // اسم المنتج & زر المفضلة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // اسم المنتج
                        Text(
                          name,
                          style: Themes.title_lg.copyWith(
                            color: Themes.grayText,
                            fontSize: Spacing.md - 2,
                          ),
                        ),

                        // زر المفضلة
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: IconButton(
                              onPressed: () {},
                              color: Themes.grayText,
                              iconSize: 12,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffF3F4F6)),
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.heart,
                                size: 12,
                              )),
                        )
                      ],
                    ),
                    Themes.spaceY4,
                    // السعر - العملة
                    defPrice(price, "TL"),
                    Themes.spaceY4,
                    // التقيم وعدد المبيعات
                    defRateAndSold(rate, sold),
                  ],
                ),
              ),
            ],
          ),

          // Tooltip
          hadToolTip
              ? Positioned(
                  top: Spacing.md,
                  left: Spacing.md,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Spacing.sm,
                      vertical: Spacing.xs,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: Themes.borderRadiusSm,
                      color: toolTipColor,
                    ),
                    child: Text(
                      toolTip,
                      style: Themes.text_base.copyWith(
                        color: Themes.light,
                        fontSize: 9,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    ),
  );
}

Widget defProductImg(
  String img,
) {
  return Container(
    width: double.infinity,
    height: 125,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Spacing.md),
        topRight: Radius.circular(Spacing.md),
      ),
      color: Themes.light,
    ),
    clipBehavior: Clip.antiAlias,
    child: Image.network(
      img,
      width: double.infinity - 10, // يمكنك ضبط الحجم هنا حسب الحاجة
      height: 125, // التأكد من أن العرض والارتفاع متساويين
      fit: BoxFit.contain,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child; // الصورة تم تحميلها بالكامل
        } else {
          return Center(
            child: CircularProgressIndicator(), // عرض مؤشر التحميل
          );
        }
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return Center(
          child: Image.asset(
            AppImg.placeholder,
            width: double.infinity, // يمكنك ضبط الحجم هنا حسب الحاجة
            height: 125, // التأكد من أن العرض والارتفاع متساويين
            fit: BoxFit.cover,
          ), // عرض أيقونة خطأ إذا فشل تحميل الصورة
        );
      },
    ),
  );
}

Widget defProductName(
  String name,
) {
  return Text(
    name,
    style: Themes.title_lg.copyWith(
      color: Themes.grayText,
      fontSize: Spacing.md - 2,
    ),
  );
}

Widget defProductEllipsisName(
  String name,
  double? width,
  int? maxLines,
) {
  return SizedBox(
    width: width,
    child: Text(
      name,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: Themes.title_lg.copyWith(
        color: Themes.grayText,
        fontSize: Spacing.md - 2,
      ),
    ),
  );
}

Widget defProductFavBtn(
  Function()? onPressed,
  bool isInWishlist,
) {
  return SizedBox(
    width: 24,
    height: 24,
    child: IconButton(
      onPressed: onPressed,
      color: isInWishlist ? Themes.error : Themes.grayText,
      iconSize: 12,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            isInWishlist ? Themes.error : Themes.lightGray),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      icon: FaIcon(
        FontAwesomeIcons.heart,
        size: 12,
        color: isInWishlist ? Themes.light : Themes.grayText,
      ),
    ),
  );
}

Widget defPrice(
  String price,
  String currency,
) {
  return Row(
    children: [
      // السعر
      Text(
        price,
        style: Themes.title_lg.copyWith(
          fontSize: Spacing.md + 2,
        ),
      ),
      Themes.spaceX4,
      // العملة
      Text(
        currency,
        style: Themes.text_xs,
      ),
    ],
  );
}

Widget defDiscountPrice(
  String newPrice,
  String discounted_price,
  String currency,
) {
  return Row(
    children: [
      Row(
        children: [
          // السعر بعد الخصم
          Text(
            newPrice,
            style: Themes.title_lg.copyWith(
              color: Themes.error,
              fontSize: Spacing.md + 2,
            ),
          ),
          Themes.spaceX4,
          // العملة
          Text(
            currency,
            style: Themes.text_xs.copyWith(
              color: Themes.error,
            ),
          ),
        ],
      ),
      Themes.spaceX4,
      Row(
        children: [
          // السعر القديم
          Text(
            discounted_price,
            style: Themes.text_sm.copyWith(
              decoration: TextDecoration.lineThrough,
              decorationColor: Themes.grayText.withOpacity(0.8),
              color: Themes.grayText.withOpacity(0.8),
            ),
          ),
          Themes.spaceX4,
          // العملة
          Text(
            currency,
            style: Themes.text_xs.copyWith(
              decoration: TextDecoration.lineThrough,
              decorationColor: Themes.grayText.withOpacity(0.8),
              color: Themes.grayText.withOpacity(0.8),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget defRateAndSold(
  String rate,
  String sold,
) {
  return Row(
    children: [
      const Icon(
        Icons.star,
        color: Colors.amber,
        size: Spacing.sm + 4,
      ),
      Themes.spaceX4,
      Text(
        rate,
        style: Themes.text_sm.copyWith(
          color: Themes.grayText,
          fontSize: Spacing.sm + 4,
        ),
      ),
      Themes.spaceX8,
      Text(
        "|",
        style: Themes.text_sm.copyWith(
          color: Themes.grayText,
          fontSize: Spacing.sm + 4,
        ),
      ),
      Themes.spaceX8,
      Text(sold + " sold".tr,
          style: Themes.text_sm.copyWith(
            color: Themes.grayText,
            fontSize: Spacing.sm + 4,
          )),
    ],
  );
}

Widget buildHorizontalProduct(
  List<Map<String, dynamic>> products,
  String toolTipText,
  Color toolTipColor,
) {
  return products.isNotEmpty
      ? SizedBox(
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // يمكنك تنفيذ إجراء عند النقر هنا
                    print("\x1B[2J\x1B[0;0H");
                    print("================");
                    print(products[index]["id"]);
                    print("================");
                    Get.toNamed(AppRoutes.product,
                        arguments: {"id": products[index]["id"]});
                  },
                  child: product(
                    context,
                    products[index],
                    true,
                    toolTipText,
                    toolTipColor,
                  ),
                );
              }),
        )
      : SizedBox(
          height: 250,
          child: Center(
            child: Text(
              "There are no data to display".tr,
              style: Themes.text_base,
            ),
          ),
        );
}

Widget buildGridProduct(
  BuildContext context,
  List<Map<String, dynamic>> products,
) {
  return products.isNotEmpty
      ? SizedBox(
          width: double.infinity,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio:
                  (MediaQuery.of(context).size.width / 2 - 30) / 230,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // يمكنك تنفيذ إجراء عند النقر هنا
                  print("\x1B[2J\x1B[0;0H");
                  print("================");
                  print(products[index]["id"]);
                  print("================");
                  Get.toNamed(AppRoutes.product,
                      arguments: {"id": products[index]["id"]});
                },
                child: product(
                  context,
                  products[index],
                  false,
                  "",
                  Themes.bg,
                ),
              );
            },
          ),
        )
      : SizedBox(
          height: 250,
          child: Center(
            child: Text(
              "There are no data to display".tr,
              style: Themes.text_base,
            ),
          ),
        );
}
