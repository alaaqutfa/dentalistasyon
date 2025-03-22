import 'package:carousel_slider/carousel_controller.dart';
import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/carouselslider.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/data/model/products.model.dart';
import 'package:dentalistasyon/view/widgets/app/home/partials/nav.home.dart';
import 'package:dentalistasyon/view/widgets/partials/search.home.dart';
import 'package:dentalistasyon/view/widgets/app/home/partials/sections.home.dart';
import 'package:dentalistasyon/view/widgets/app/home/partials/shimmer.home.dart';
import 'package:dentalistasyon/view/widgets/partials/progress.dart';
import 'package:dentalistasyon/view/widgets/partials/refreshpage.dart';
import 'package:dentalistasyon/view/widgets/partials/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final bool ready;
  final String avatar;
  final String name;
  final String address;
  final Function()? onPressedMail;
  final Function()? onPressedNotfi;
  final TextEditingController? searchController;
  final dynamic Function(String)? searchOnChanged;
  final String? Function(String?)? searchValidator;
  final List<String> imageUrls;
  final CarouselSliderController buttonCarouselController;
  final int current;
  final Function(int)? onTapAppSlider;
  final List<Map<String, dynamic>> deals;
  final List<Map<String, dynamic>> brands;
  final List<Map<String, dynamic>> newArrivalsProducts;
  final List<Map<String, dynamic>> featuredItemsProducts;
  final List<Map<String, dynamic>> mostPopularProducts;
  final List<Map<String, dynamic>> backinStockProducts;
  final List<Map<String, dynamic>> buyMoreSaveMoreProducts;
  final List<Map<String, dynamic>> expressProducts;
  final List<Map<String, dynamic>> latestProducts;
  final ScrollController? scrollController;
  final bool loading;

  const HomeBody({
    super.key,
    this.onPressedMail,
    this.onPressedNotfi,
    required this.avatar,
    required this.name,
    required this.address,
    this.searchController,
    this.searchOnChanged,
    this.searchValidator,
    required this.buttonCarouselController,
    required this.imageUrls,
    required this.current,
    this.onTapAppSlider,
    required this.deals,
    required this.brands,
    this.scrollController,
    required this.loading,
    required this.onRefresh,
    required this.ready,
    required this.newArrivalsProducts,
    required this.featuredItemsProducts,
    required this.mostPopularProducts,
    required this.backinStockProducts,
    required this.buyMoreSaveMoreProducts,
    required this.expressProducts,
    required this.latestProducts,
  });

  @override
  Widget build(BuildContext context) {
    return AppRefreshPage(
      onRefresh: onRefresh,
      controller: scrollController,
      child: Container(
        color: Themes.bg,
        padding: Themes.edgeMd,
        child: Column(
          children: [
            homeNav(
              avatar,
              name,
              address,
              onPressedMail,
              onPressedNotfi,
            ),
            Themes.spaceY16,
            searchBox(
              searchController: searchController,
              searchOnChanged: searchOnChanged,
              searchValidator: searchValidator,
            ),
            Themes.spaceY16,
            ready
                ? homeBody(context)
                : HomeShimmer(
                    shimmerCurrent: current,
                    shimmerCarouselController: buttonCarouselController,
                    onTap: onTapAppSlider,
                  ),
          ],
        ),
      ),
    );
  }

  Widget homeBody(BuildContext context) {
    return Column(
      children: [
        imageUrls.isNotEmpty
            ? AppIndicatorSlider(
                current: current,
                buttonCarouselController: buttonCarouselController,
                items: imageUrls
                    .map((url) => ClipRRect(
                          borderRadius: Themes.borderRadiusSm,
                          child: Image.network(
                            url,
                            width: double.infinity,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ))
                    .toList(),
                onTap: onTapAppSlider,
              )
            : Container(),
        Themes.spaceY16,
        homeSection(
          "Hot Deals",
          () {},
          SizedBox(
            width: double.infinity,
            height: 110,
            child: deals.isNotEmpty
                ? AppSlider(
                    carouselController: CarouselSliderController(),
                    milliseconds: 2500,
                    items: deals
                        .map(
                          (deal) => InkWell(
                            onTap: () {
                              // يمكنك تنفيذ إجراء عند النقر هنا
                              print("\x1B[2J\x1B[0;0H");
                              print("================");
                              print(deal["id"]);
                              print("================");
                              Get.toNamed(AppRoutes.product,
                                  arguments: {"id": deal["id"]});
                            },
                            child: hotDeal(deal),
                          ),
                        )
                        .toList(),
                  )
                : Center(
                    child: Text(
                      "There are no data to display".tr,
                      style: Themes.text_base,
                    ),
                  ),
          ),
        ),
        Themes.spaceY16,
        homeSection(
          "Brands",
          () {},
          brands.isNotEmpty
              ? SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: brands.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // يمكنك تنفيذ إجراء عند النقر هنا
                          print("\x1B[2J\x1B[0;0H");
                          print("================");
                          print(brands[index]);
                          print("================");
                        },
                        child: brand(brands[index]),
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
                ),
        ),
        Themes.spaceY16,
        homeSection(
          "New Arrivals",
          () {},
          buildHorizontalProduct(
            newArrivalsProducts,
            offerToolTipModel[0]["name"],
            offerToolTipModel[0]["color"],
          ),
        ),
        Themes.spaceY16,
        homeSection(
          "Featured Items",
          () {},
          buildHorizontalProduct(
            featuredItemsProducts,
            offerToolTipModel[1]["name"],
            offerToolTipModel[1]["color"],
          ),
        ),
        Themes.spaceY16,
        homeSection(
          "Most Popular",
          () {},
          buildHorizontalProduct(
            mostPopularProducts,
            offerToolTipModel[2]["name"],
            offerToolTipModel[2]["color"],
          ),
        ),
        Themes.spaceY16,
        homeSection(
          "Back in Stock",
          () {},
          buildHorizontalProduct(
            backinStockProducts,
            offerToolTipModel[3]["name"],
            offerToolTipModel[3]["color"],
          ),
        ),
        Themes.spaceY16,
        homeSection(
          "Buy More, Save More",
          () {},
          buildHorizontalProduct(
            buyMoreSaveMoreProducts,
            offerToolTipModel[4]["name"],
            offerToolTipModel[4]["color"],
          ),
        ),
        Themes.spaceY16,
        homeSection(
          "Express",
          () {},
          buildHorizontalProduct(
            expressProducts,
            offerToolTipModel[5]["name"],
            offerToolTipModel[5]["color"],
          ),
        ),
        Themes.spaceY16,
        homeSection(
          "Latest Products",
          () {},
          buildGridProduct(context, latestProducts),
        ),
        Themes.spaceY16,
        loading ? AppProgress() : Container(),
        Themes.spaceY16,
      ],
    );
  }
}
