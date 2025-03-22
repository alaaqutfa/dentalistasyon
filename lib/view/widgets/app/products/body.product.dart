import 'package:dentalistasyon/config/app.config.dart';
import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/shimmer_helper.dart';
import 'package:dentalistasyon/data/model/products.model.dart';
import 'package:dentalistasyon/view/widgets/app/home/partials/sections.home.dart';
import 'package:dentalistasyon/view/widgets/app/home/partials/shimmer.home.dart';
import 'package:dentalistasyon/view/widgets/partials/appBtn.dart';
import 'package:dentalistasyon/view/widgets/partials/product.dart';
import 'package:dentalistasyon/view/widgets/partials/refreshpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ProductBody extends StatelessWidget {
  final bool ready;
  final Map<String, dynamic> product;
  final Future<void> Function() onRefresh;
  final RxString mainImg;
  final List<dynamic> reviews;
  final List<dynamic> relatedProducts;
  const ProductBody({
    super.key,
    required this.product,
    required this.onRefresh,
    required this.mainImg,
    required this.reviews,
    required this.relatedProducts,
    required this.ready,
  });

  @override
  Widget build(BuildContext context) {
    return AppRefreshPage(
      onRefresh: onRefresh,
      child: ready
          ? buildContent(context, product, mainImg, reviews, relatedProducts)
          : buildContentShimmer(context, product),
    );
  }
}

Widget buildContent(
  BuildContext context,
  Map<String, dynamic> product,
  RxString mainImg,
  List<dynamic> reviews,
  List<dynamic> relatedProducts,
) {
  return Container(
    color: Themes.bg,
    padding: Themes.edgeMd,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Themes.spaceY16,
        productHeader(product),
        Themes.spaceY16,
        productImgContainer(product, mainImg),
        Themes.spaceY16,
        buildOfferToolTipContainer(),
        Themes.spaceY16,
        buildProductInfo(context, product),
        Themes.spaceY16,
        //TODO Stock Status
        buildStockStatus(),
        Themes.spaceY16,
        //TODO Packaging Type
        buildPackagingType(),
        Themes.spaceY16,
        //TODO Product Details
        buildProductDetails(),
        Themes.spaceY16,
        // Reviews
        homeSection("Reviews", () {}, buildHorizontalReviews(reviews)),
        Themes.spaceY16,
        // Related
        homeSection(
          "Related",
          () {},
          buildHorizontalRelatedProduct(
            relatedProducts,
            "",
            Colors.transparent,
          ),
        ),
        Themes.spaceY16,
      ],
    ),
  );
}

Widget productHeader(Map<String, dynamic> product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          Get.back();
        },
        icon: FaIcon(
          FontAwesomeIcons.arrowLeftLong,
        ),
      ),
      InkWell(
        onTap: () {
          Share.share("${AppConfig.defSiteUrl}/${product["id"]}");
        },
        child: Image.asset(
          AppImg.share_icon,
        ),
      ),
    ],
  );
}

Widget productImgContainer(Map<String, dynamic> product, RxString mainImg) {
  return Container(
    width: double.infinity,
    height: 404,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Themes.stroke,
      ),
      borderRadius: Themes.borderRadiusMd,
    ),
    child: Column(
      children: [
        Obx(
          () => thumbnail(mainImg.value),
        ),
        Themes.spaceY16,
        gallery(product, mainImg),
        Themes.spaceY16,
      ],
    ),
  );
}

Widget thumbnail(String img) {
  return Container(
    width: double.infinity,
    height: 297,
    padding: Themes.edgeXs,
    decoration: BoxDecoration(
      color: Themes.light,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Spacing.md),
        topRight: Radius.circular(Spacing.md),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Image.network(
      img,
      width: double.infinity,
      height: 297,
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
            height: 297, // التأكد من أن العرض والارتفاع متساويين
            fit: BoxFit.cover,
          ), // عرض أيقونة خطأ إذا فشل تحميل الصورة
        );
      },
    ),
  );
}

Widget gallery(Map<String, dynamic> product, RxString img) {
  return Container(
    width: double.infinity,
    height: 59,
    padding: EdgeInsets.symmetric(
      horizontal: Spacing.md,
    ),
    child: ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: product["productImages"].length,
      itemBuilder: (context, index) => galleryImg(product, img, index),
    ),
  );
}

Widget galleryImg(Map<String, dynamic> product, RxString img, int index) {
  return InkWell(
    onTap: () {
      img.value = product["productImages"][index]["image_url"] ?? "";
    },
    child: Container(
      width: 59,
      height: 59,
      margin: index > 0
          ? EdgeInsets.symmetric(
              horizontal: Spacing.sm,
            )
          : EdgeInsets.only(
              right: Spacing.sm,
            ),
      decoration: BoxDecoration(
        color: Themes.light,
        borderRadius: Themes.borderRadiusSm,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(
        product["productImages"][index]["image_url"],
        width: 59,
        height: 59,
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
              height: 297, // التأكد من أن العرض والارتفاع متساويين
              fit: BoxFit.cover,
            ), // عرض أيقونة خطأ إذا فشل تحميل الصورة
          );
        },
      ),
    ),
  );
}

Widget buildOfferToolTipContainer() {
  return SizedBox(
    width: double.infinity,
    height: Spacing.lg,
    child: ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: offerToolTipModel.length,
      itemBuilder: (context, index) => Row(
        children: [
          offerToolTip(
            offerToolTipModel[index]["color"],
            offerToolTipModel[index]["name"],
          ),
          Themes.spaceX8,
        ],
      ),
    ),
  );
}

Widget buildProductInfo(BuildContext context, Map<String, dynamic> product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Categories & Name & Company & Rate
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //TODO Categories
          Text(
            "Categories".tr,
            style: Themes.text_sm.copyWith(
              color: Themes.iconGray,
              fontSize: FontSizes.sm - 2,
            ),
          ),
          Themes.spaceY4,
          // Name
          defProductEllipsisName(
            product["name"],
            MediaQuery.of(context).size.width - 150,
            3,
          ),
          Themes.spaceY4,
          // Company & Rate
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //TODO Company
              Text(
                "Company".tr,
                style: Themes.text_sm.copyWith(
                  color: Themes.iconGray,
                  fontSize: FontSizes.sm - 2,
                ),
              ),
              Themes.spaceX4,
              Text(
                "|",
                style: Themes.text_sm.copyWith(
                  color: Themes.iconGray,
                  fontSize: FontSizes.sm - 2,
                ),
              ),
              Themes.spaceX4,
              Row(
                children: [
                  Text(
                    "Rate".tr,
                    style: Themes.text_sm.copyWith(
                      color: Themes.iconGray,
                      fontSize: FontSizes.sm - 2,
                    ),
                  ),
                  Text(
                    "(",
                    style: Themes.text_sm.copyWith(
                      color: Themes.iconGray,
                      fontSize: FontSizes.sm - 2,
                    ),
                  ),
                  Text(
                    product["averageRating"],
                    style: Themes.text_sm.copyWith(
                      color: Themes.iconGray,
                      fontSize: FontSizes.sm - 2,
                    ),
                  ),
                  Text(
                    ")",
                    style: Themes.text_sm.copyWith(
                      color: Themes.iconGray,
                      fontSize: FontSizes.sm - 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Themes.spaceY4,
          //TODO Expiry date :
          Row(
            children: [
              Text(
                "Expiry date : ".tr,
                style: Themes.text_sm.copyWith(
                  color: Themes.iconGray,
                  fontSize: FontSizes.sm - 2,
                ),
              ),
              Text(
                "20/12/2030",
                style: Themes.text_sm.copyWith(
                  color: Themes.iconGray,
                  fontSize: FontSizes.sm - 2,
                ),
              ),
            ],
          )
        ],
      ),

      // Price & Currency
      buildPrice(product["price"], "TL"),
    ],
  );
}

Widget buildStockStatus() {
  return Row(
    children: [
      Image.asset(
        AppImg.verify_icon,
        color: Themes.success,
      ),
      Themes.spaceX8,
      Text(
        "In stock".tr,
        style: Themes.title_lg.copyWith(
          fontSize: FontSizes.sm - 2,
          color: Themes.success,
        ),
      ),
      Themes.spaceX8,
      Text(
        "Shipping takes 4 Business day".tr,
        style: Themes.text_sm.copyWith(
          color: Themes.iconGray,
          fontSize: FontSizes.sm - 2,
        ),
      ),
    ],
  );
}

Widget buildPackagingType() {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: Themes.edgeMd,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Themes.stroke,
        ),
        borderRadius: Themes.borderRadiusSm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Packaging Type"),
          Image.asset(AppImg.arrow_right_icon)
        ],
      ),
    ),
  );
}

Widget buildProductDetails() {
  return Column(
    children: [
      // Nav
      Container(
        padding: Themes.edgeXs,
        decoration: BoxDecoration(
          color: Themes.stroke,
          borderRadius: Themes.borderRadiusSm,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: 107.67,
                padding: Themes.edgeSm,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Themes.light,
                  borderRadius: Themes.borderRadiusSm,
                ),
                child: Text(
                  "Details",
                  style: Themes.text_sm.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: Themes.edgeSm,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Themes.stroke,
                  borderRadius: Themes.borderRadiusSm,
                ),
                child: Text(
                  "Specs",
                  style: Themes.text_sm.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: Themes.edgeSm,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Themes.stroke,
                  borderRadius: Themes.borderRadiusSm,
                ),
                child: Text(
                  "Packaging",
                  style: Themes.text_sm.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
      Themes.spaceY16,
      // Details
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Discover our cutting-edge Dental Densit product, crafted with sustainable materials and designed to provide optimal protection for your dental tools. Ideal for all your dental storage requirements!",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Themes.text_base.copyWith(
              fontSize: FontSizes.sm - 2,
            ),
          ),
          Themes.spaceY16,
          InkWell(
            onTap: () {},
            child: Text(
              "Read More".tr,
              style: Themes.text_sm.copyWith(
                fontWeight: FontWeight.w500,
                color: Themes.success,
              ),
            ),
          )
        ],
      ),
    ],
  );
}

Widget buildHorizontalReviews(List<dynamic> reviews) {
  return reviews.isNotEmpty
      ? SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 150,
                padding: Themes.edgeMd,
                margin: EdgeInsets.only(
                  right: Spacing.md,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Themes.stroke,
                  ),
                  borderRadius: Themes.borderRadiusMd,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              reviews[index]["userName"].toString(),
                              style: Themes.text_sm.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Themes.spaceY8,
                            SizedBox(
                              height: 15,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, i) {
                                  bool colored =
                                      i < reviews[index]["ratingProduct"];
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        AppImg.star_icon,
                                        color: colored
                                            ? Color(0xffFFBE00)
                                            : Themes.stroke,
                                      ),
                                      Themes.spaceX4,
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Text(
                          reviews[index]["createdAt"].toString(),
                          style: Themes.text_sm.copyWith(
                            color: Themes.iconGray,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(
                        reviews[index]["comment"],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Themes.text_base.copyWith(
                          fontSize: FontSizes.sm - 2,
                          color: Themes.iconGray,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      : SizedBox(
          height: 150,
          child: Center(
            child: Text(
              "There are no data to display".tr,
              style: Themes.text_base,
            ),
          ),
        );
}

Widget buildHorizontalRelatedProduct(
  List<dynamic> products,
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

Widget buildBottomNavigationBar(String price, Function()? onTap) {
  return Container(
    width: double.infinity,
    height: 100,
    padding: Themes.edgeMd,
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Total Price".tr,
              style: Themes.text_sm.copyWith(
                fontSize: FontSizes.sm - 2,
              ),
            ),
            Themes.spaceY8,
            // Price & Currency
            buildPrice(price, "TL"),
          ],
        ),
        Themes.spaceX16,
        defBtn(210, Themes.primary, () {}, "Add to cart", true),
      ],
    ),
  );
}

Widget buildPrice(String price, String currency) {
  return Row(
    children: [
      Text(
        price,
        style: Themes.title_xl.copyWith(
          color: Themes.primary,
        ),
      ),
      Themes.spaceX4,
      Text(
        currency,
        style: Themes.title_xl.copyWith(
          color: Themes.primary,
        ),
      ),
    ],
  );
}

Widget buildContentShimmer(BuildContext context, Map<String, dynamic> product) {
  return Container(
    color: Themes.bg,
    padding: Themes.edgeMd,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Themes.spaceY16,
        productHeader(product),
        Themes.spaceY16,
        productImgContainerShimmer(),
        Themes.spaceY16,
        buildOfferToolTipContainerShimmer(),
        Themes.spaceY16,
        buildProductInfoShimmer(context),
        Themes.spaceY16,
        buildStockStatusShimmer(),
        Themes.spaceY16,
        buildPackagingTypeShimmer(),
        Themes.spaceY16,
        buildProductDetailsShimmer(),
        Themes.spaceY16,
        homeSectionShimmer(
          "Reviews",
          () {},
          buildHorizontalReviewsShimmer(),
        ),
        Themes.spaceY16,
        homeSectionShimmer(
          "Related",
          () {},
          productHorizontalBuilderShimmer(),
        ),
      ],
    ),
  );
}

Widget productImgContainerShimmer() {
  return Container(
    width: double.infinity,
    height: 404,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Themes.stroke,
      ),
      borderRadius: Themes.borderRadiusMd,
    ),
    child: Column(
      children: [
        Obx(
          () => ShimmerHelper().buildDefaultShimmer(thumbnailShimmer()),
        ),
        Themes.spaceY16,
        galleryShimmer(),
        Themes.spaceY16,
      ],
    ),
  );
}

Widget thumbnailShimmer() {
  return Container(
    width: double.infinity,
    height: 297,
    padding: Themes.edgeXs,
    decoration: BoxDecoration(
      color: Themes.light,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Spacing.md),
        topRight: Radius.circular(Spacing.md),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Image.asset(
      AppImg.placeholder,
      width: double.infinity,
      height: 297,
      fit: BoxFit.contain,
    ),
  );
}

Widget galleryShimmer() {
  return Container(
    width: double.infinity,
    height: 59,
    padding: EdgeInsets.symmetric(
      horizontal: Spacing.md,
    ),
    child: ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) =>
          ShimmerHelper().buildDefaultShimmer(galleryImgShimmer(index)),
    ),
  );
}

Widget galleryImgShimmer(int index) {
  return Container(
    width: 59,
    height: 59,
    margin: index > 0
        ? EdgeInsets.symmetric(
            horizontal: Spacing.sm,
          )
        : EdgeInsets.only(
            right: Spacing.sm,
          ),
    decoration: BoxDecoration(
      color: Themes.light,
      borderRadius: Themes.borderRadiusSm,
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Image.asset(
      AppImg.placeholder,
      width: 59,
      height: 59,
      fit: BoxFit.contain,
    ),
  );
}

Widget buildOfferToolTipContainerShimmer() {
  return SizedBox(
    width: double.infinity,
    height: Spacing.lg,
    child: ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: offerToolTipModel.length,
      itemBuilder: (context, index) => Row(
        children: [
          ShimmerHelper().buildDefaultShimmer(
            offerToolTip(
              offerToolTipModel[index]["color"],
              offerToolTipModel[index]["name"],
            ),
          ),
          Themes.spaceX8,
        ],
      ),
    ),
  );
}

Widget buildProductInfoShimmer(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Categories & Name & Company & Rate
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ShimmerHelper().buildDefaultShimmer(Text(
            "Categories".tr,
            style: Themes.text_sm.copyWith(
              color: Themes.iconGray,
              fontSize: FontSizes.sm - 2,
            ),
          )),
          Themes.spaceY4,
          // Name
          ShimmerHelper().buildDefaultShimmer(defProductEllipsisName(
            "Loading...".tr,
            MediaQuery.of(context).size.width - 150,
            3,
          )),
          Themes.spaceY4,
          // Company & Rate
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShimmerHelper().buildDefaultShimmer(
                Text(
                  "Company".tr,
                  style: Themes.text_sm.copyWith(
                    color: Themes.iconGray,
                    fontSize: FontSizes.sm - 2,
                  ),
                ),
              ),
              Themes.spaceX4,
              ShimmerHelper().buildDefaultShimmer(Text(
                "|",
                style: Themes.text_sm.copyWith(
                  color: Themes.iconGray,
                  fontSize: FontSizes.sm - 2,
                ),
              )),
              Themes.spaceX4,
              ShimmerHelper().buildDefaultShimmer(Text(
                "Rate(0)".tr,
                style: Themes.text_sm.copyWith(
                  color: Themes.iconGray,
                  fontSize: FontSizes.sm - 2,
                ),
              )),
            ],
          ),
          Themes.spaceY4,
          ShimmerHelper().buildDefaultShimmer(
            Text(
              "Expiry date : ".tr,
              style: Themes.text_sm.copyWith(
                color: Themes.iconGray,
                fontSize: FontSizes.sm - 2,
              ),
            ),
          ),
        ],
      ),

      // Price & Currency
      ShimmerHelper().buildDefaultShimmer(buildPrice("00", "TL")),
    ],
  );
}

Widget buildStockStatusShimmer() {
  return Row(
    children: [
      ShimmerHelper().buildDefaultShimmer(Image.asset(
        AppImg.verify_icon,
        color: Themes.success,
      )),
      Themes.spaceX8,
      ShimmerHelper().buildDefaultShimmer(Text(
        "In stock".tr,
        style: Themes.title_lg.copyWith(
          fontSize: FontSizes.sm - 2,
          color: Themes.success,
        ),
      )),
      Themes.spaceX8,
      ShimmerHelper().buildDefaultShimmer(Text(
        "Shipping takes 4 Business day".tr,
        style: Themes.text_sm.copyWith(
          color: Themes.iconGray,
          fontSize: FontSizes.sm - 2,
        ),
      )),
    ],
  );
}

Widget buildPackagingTypeShimmer() {
  return Container(
    padding: Themes.edgeMd,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Themes.stroke,
      ),
      borderRadius: Themes.borderRadiusSm,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShimmerHelper().buildDefaultShimmer(Text("Packaging Type")),
        ShimmerHelper()
            .buildDefaultShimmer(Image.asset(AppImg.arrow_right_icon))
      ],
    ),
  );
}

Widget buildProductDetailsShimmer() {
  return Column(
    children: [
      // Nav
      Container(
        padding: Themes.edgeXs,
        decoration: BoxDecoration(
          color: Themes.stroke,
          borderRadius: Themes.borderRadiusSm,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 107.67,
              padding: Themes.edgeSm,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Themes.light,
                borderRadius: Themes.borderRadiusSm,
              ),
              child: ShimmerHelper().buildDefaultShimmer(Text(
                "Details",
                style: Themes.text_sm.copyWith(fontWeight: FontWeight.w500),
              )),
            ),
            Container(
              padding: Themes.edgeSm,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Themes.stroke,
                borderRadius: Themes.borderRadiusSm,
              ),
              child: ShimmerHelper().buildDefaultShimmer(
                Text("Specs",
                    style:
                        Themes.text_sm.copyWith(fontWeight: FontWeight.w500)),
              ),
            ),
            Container(
              padding: Themes.edgeSm,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Themes.stroke,
                borderRadius: Themes.borderRadiusSm,
              ),
              child: ShimmerHelper().buildDefaultShimmer(
                Text("Packaging",
                    style:
                        Themes.text_sm.copyWith(fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
      Themes.spaceY16,
      // Details
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ShimmerHelper().buildDefaultShimmer(Text(
            "Discover our cutting-edge Dental Densit product, crafted with sustainable materials and designed to provide optimal protection for your dental tools. Ideal for all your dental storage requirements!",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Themes.text_base.copyWith(
              fontSize: FontSizes.sm - 2,
            ),
          )),
          Themes.spaceY16,
          ShimmerHelper().buildDefaultShimmer(
            Text(
              "Read More".tr,
              style: Themes.text_sm.copyWith(
                fontWeight: FontWeight.w500,
                color: Themes.success,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildHorizontalReviewsShimmer() {
  return SizedBox(
    height: 150,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width - 50,
          height: 150,
          padding: Themes.edgeMd,
          margin: EdgeInsets.only(
            right: Spacing.md,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Themes.stroke,
            ),
            borderRadius: Themes.borderRadiusMd,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShimmerHelper().buildDefaultShimmer(Text(
                        "Loading...".tr,
                        style: Themes.text_sm.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      Themes.spaceY8,
                      SizedBox(
                        height: 15,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, i) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ShimmerHelper().buildDefaultShimmer(Image.asset(
                                  AppImg.star_icon,
                                  color: Color(0xffFFBE00),
                                )),
                                Themes.spaceX4,
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  ShimmerHelper().buildDefaultShimmer(Text(
                    "00/00/0000",
                    style: Themes.text_sm.copyWith(
                      color: Themes.iconGray,
                    ),
                  )),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: ShimmerHelper().buildDefaultShimmer(Text(
                  "Loading...".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Themes.text_base.copyWith(
                    fontSize: FontSizes.sm - 2,
                    color: Themes.iconGray,
                  ),
                )),
              ),
            ],
          ),
        );
      },
    ),
  );
}
