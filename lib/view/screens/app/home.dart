import 'package:dentalistasyon/controller/app/home.controller.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/user.model.dart';
import 'package:dentalistasyon/view/widgets/app/home/body.home.dart';
import 'package:dentalistasyon/view/widgets/partials/floatingActionBtn.dart';
import 'package:dentalistasyon/view/widgets/partials/nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: defFloatingActionButton(context),
      bottomNavigationBar: defNav(context, 0),
      body: GetBuilder(
        init: HomeControllerImp(context: context),
        builder: (controller) => HomeBody(
          onRefresh: () async {
            await controller.reFresh();
          },
          ready: controller.ready,
          avatar: User.avatar_url ?? "",
          name: User.name,
          address: "",
          onPressedMail: () {},
          onPressedNotfi: () {},
          searchController: controller.search,
          searchOnChanged: (value) {},
          searchValidator: (value) => textValidator(value),
          imageUrls: controller.imageUrls,
          buttonCarouselController: controller.buttonCarouselController,
          current: controller.current,
          onTapAppSlider: (key) {
            controller.buttonCarouselController.animateToPage(key);
            controller.current = key;
            controller.update();
          },
          deals: controller.hotDeals,
          brands: controller.brands,
          newArrivalsProducts: controller.newArrivalsProducts,
          featuredItemsProducts: controller.featuredItemsProducts,
          mostPopularProducts: controller.mostPopularProducts,
          backinStockProducts: controller.backinStockProducts,
          buyMoreSaveMoreProducts: controller.buyMoreSaveMoreProducts,
          expressProducts: controller.expressProducts,
          latestProducts: controller.latestProducts,
          scrollController: controller.scrollController,
          loading: controller.isLoading,
        ),
      ),
    );
  }
}
