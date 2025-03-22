import 'package:carousel_slider/carousel_controller.dart';
import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/carouselslider.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/shimmer_helper.dart';
import 'package:dentalistasyon/view/widgets/partials/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeShimmer extends StatelessWidget {
  final CarouselSliderController? shimmerCarouselController;
  final Function(int key)? onTap;
  final int shimmerCurrent;
  const HomeShimmer(
      {super.key,
      this.shimmerCarouselController,
      this.onTap,
      required this.shimmerCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppIndicatorSliderShimmer(
          shimmerCurrent: shimmerCurrent,
          shimmerCarouselController: shimmerCarouselController,
          onTap: onTap,
        ),
        Themes.spaceY16,
        homeSectionShimmer(
          "Hot Deals",
          () {},
          SizedBox(
            width: double.infinity,
            height: 110,
            child: AppSliderShimmer(
              milliseconds: 2500,
              content: hotDealShimmer(),
            ),
          ),
        ),
        Themes.spaceY16,
        homeSectionShimmer(
          "Brands",
          () {},
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ShimmerHelper().buildDefaultShimmer(
                  brandShimmer(),
                );
              },
            ),
          ),
        ),
        Themes.spaceY16,
        homeSectionShimmer(
          "New Arrivals",
          () {},
          productHorizontalBuilderShimmer(),
        ),
        Themes.spaceY16,
        homeSectionShimmer(
          "Featured Items",
          () {},
          productHorizontalBuilderShimmer(),
        ),
        Themes.spaceY16,
        homeSectionShimmer(
          "Most Popular",
          () {},
          productHorizontalBuilderShimmer(),
        ),
        Themes.spaceY16,
        homeSectionShimmer(
          "Back in Stock",
          () {},
          productHorizontalBuilderShimmer(),
        ),
        Themes.spaceY16,
        homeSectionShimmer(
          "Buy More, Save More",
          () {},
          productHorizontalBuilderShimmer(),
        ),
        Themes.spaceY16,
        homeSectionShimmer(
          "Express",
          () {},
          productHorizontalBuilderShimmer(),
        ),
        Themes.spaceY16,
        homeSectionShimmer(
          "Latest Products",
          () {},
          productVerticalBuilderShimmer(context),
        ),
      ],
    );
  }
}

Widget homeSectionShimmer(String title, Function()? onTap, Widget content) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShimmerHelper().buildDefaultShimmer(
            Text(
              title.tr,
              style: Themes.title_lg,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                ShimmerHelper().buildDefaultShimmer(
                  Text(
                    "See All".tr,
                    style: Themes.linkStyle,
                  ),
                ),
                Themes.spaceX8,
                ShimmerHelper().buildDefaultShimmer(
                  FaIcon(
                    FontAwesomeIcons.chevronRight,
                    color: Themes.link,
                    size: Spacing.md,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Themes.spaceY16,
      content
    ],
  );
}

Widget hotDealShimmer() {
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
              ShimmerHelper().buildDefaultShimmer(
                defHotDealImgShimmer(),
              ),
              Themes.spaceX8,
              // بقية التفاصيل
              Padding(
                padding: Themes.edgeXs,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // السعر
                    ShimmerHelper().buildDefaultShimmer(
                      defDiscountPrice("00", "TL", "00"),
                    ),
                    // اسم المنتج
                    ShimmerHelper().buildDefaultShimmer(
                      defProductName("Loading..."),
                    ),
                    // التقيم وعدد المبيعات
                    ShimmerHelper().buildDefaultShimmer(
                      defRateAndSold("00", "00"),
                    ),
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
                buildTimeBoxShimmer('00', "D"),
                buildTimeBoxShimmer('00', "H"),
                buildTimeBoxShimmer('00', "M"),
                buildTimeBoxShimmer('00', "S"),
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
                color: Themes.shimmerHighlighted,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Spacing.md),
                  bottomRight: Radius.circular(Spacing.md),
                ),
              ),
              child: ShimmerHelper().buildDefaultShimmer(
                Text('-00%',
                    style: Themes.text_base.copyWith(
                      color: Themes.light,
                    )),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget defHotDealImgShimmer() {
  return Container(
    width: 120,
    height: 110,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Spacing.md),
        bottomLeft: Radius.circular(Spacing.md),
      ),
      color: Themes.bg,
    ),
    clipBehavior: Clip.antiAlias,
    child: Image.asset(
      AppImg.placeholder,
      fit: BoxFit.cover,
      width: 120,
      height: 110,
    ),
  );
}

Widget buildTimeBoxShimmer(String value, String char) {
  return Container(
    width: 20,
    height: 20,
    margin: const EdgeInsets.symmetric(
      horizontal: Spacing.xs / 2,
    ),
    padding: EdgeInsets.symmetric(horizontal: Spacing.xs / 2),
    decoration: BoxDecoration(
      color: Themes.shimmerHighlighted,
      borderRadius: Themes.borderRadiusXs / 2,
    ),
    child: Column(
      children: [
        ShimmerHelper().buildDefaultShimmer(
          Text(
            value,
            style: Themes.text_sm.copyWith(
              color: Themes.light,
              fontSize: Spacing.sm + 2,
            ),
          ),
        ),
        ShimmerHelper().buildDefaultShimmer(
          Text(
            char,
            style: Themes.text_sm.copyWith(
              color: Themes.light,
              fontWeight: FontWeight.w500,
              fontSize: Spacing.xs,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget brandShimmer() {
  return Container(
    margin: EdgeInsets.only(right: Spacing.sm),
    child: Column(
      children: [
        // صورة البراند
        CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage(
            AppImg.placeholder,
          ),
        ),
        Themes.spaceY16,
        // اسم البراند
        Text(
          "Brand Name".tr,
          style: Themes.text_base,
        ),
      ],
    ),
  );
}

Widget productShimmer(
  BuildContext context,
) {
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
      child: Column(
        children: [
          // صورة المنتج
          ShimmerHelper().buildDefaultShimmer(
            defProductImgShimmer(),
          ),
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
                    ShimmerHelper().buildDefaultShimmer(
                      defProductName("Loading..."),
                    ),
                    // زر المفضلة
                    defProductFavBtn(() {},false),
                  ],
                ),
                Themes.spaceY4,
                // السعر - العملة
                ShimmerHelper().buildDefaultShimmer(
                  defPrice("00", "TL"),
                ),
                Themes.spaceY4,
                // التقيم وعدد المبيعات
                ShimmerHelper().buildDefaultShimmer(
                  defRateAndSold("00", "00"),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget defProductImgShimmer() {
  return Container(
    width: double.infinity,
    height: 125,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Spacing.md),
        topRight: Radius.circular(Spacing.md),
      ),
    ),
    clipBehavior: Clip.antiAlias,
    child: Image.asset(
      AppImg.placeholder,
      fit: BoxFit.cover,
      width: double.infinity,
      height: 125,
    ),
  );
}

Widget productHorizontalBuilderShimmer() {
  return SizedBox(
    height: 250,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return productShimmer(context);
      },
    ),
  );
}

Widget productVerticalBuilderShimmer(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: (MediaQuery.of(context).size.width / 2 - 30) / 230,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: productShimmer(context),
        );
      },
    ),
  );
}
