// ignore_for_file: unused_local_variable
import 'package:carousel_slider/carousel_controller.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/repos/home.repos.dart';
import 'package:dentalistasyon/data/repos/products.repos.dart';
import 'package:dentalistasyon/view/widgets/partials/appDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  //* Variables :
  bool ready = false;
  var data = Get.arguments;
  TextEditingController search = TextEditingController();
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  List<String> imageUrls = [];
  int current = 0;
  List<Map<String, dynamic>> hotDeals = [];
  List<Map<String, dynamic>> brands = [];
  List<Map<String, dynamic>> newArrivalsProducts = [];
  List<Map<String, dynamic>> featuredItemsProducts = [];
  List<Map<String, dynamic>> mostPopularProducts = [];
  List<Map<String, dynamic>> backinStockProducts = [];
  List<Map<String, dynamic>> buyMoreSaveMoreProducts = [];
  List<Map<String, dynamic>> expressProducts = [];
  List<Map<String, dynamic>> latestProducts = [];
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool stopLoading = false;
  bool isDialogShown = false;
  int latestProductsPage = 1;
  int latestProductsLimitItem = 10;
  int latestProductsTotalPages = 1;

  //* Functions :
  Future reFresh();
  Future faceAll();
  Future loadMore();
  cleanAll();
  onTapProduct(String id);
  scrollListener();
  Future getHotDeals();
  Future getBrands();
  Future getNewArrivalsProducts();
  Future getFeaturedItemsProducts();
  Future getMostPopularProducts();
  Future getBackinStockProducts();
  Future getBuyMoreSaveMoreProducts();
  Future getExpressProducts();
  Future getLatestProducts();
}

class HomeControllerImp extends HomeController {
  final BuildContext context;
  HomeControllerImp({required this.context});

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(scrollListener);
    await reFresh();
  }

  @override
  void onClose() async {
    scrollController.dispose();
    super.onClose();
  }

  @override
  Future reFresh() async {
    ready = false;
    update();
    cleanAll();
    await faceAll();
    ready = true;
    update();
  }

  @override
  Future faceAll() async {
    await getHotDeals();
    await getBrands();
    await getNewArrivalsProducts();
    await getFeaturedItemsProducts();
    await getMostPopularProducts();
    await getBackinStockProducts();
    await getBuyMoreSaveMoreProducts();
    await getExpressProducts();
    await getLatestProducts();
  }

  @override
  cleanAll() {
    hotDeals = [];
    brands = [];
    newArrivalsProducts = [];
    featuredItemsProducts = [];
    mostPopularProducts = [];
    backinStockProducts = [];
    buyMoreSaveMoreProducts = [];
    expressProducts = [];
    latestProducts = [];
  }

  @override
  onTapProduct(String id) {
    Get.toNamed(
      AppRoutes.product,
      arguments: {"id": id},
    );
  }

  @override
  scrollListener() {
    // عند الوصول لنهاية الصفحة، قم بتحميل المزيد
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }

  @override
  Future loadMore() async {
    if (stopLoading) return;
    if (isLoading) return;
    isLoading = true;
    update();
    latestProductsPage++;
    var res = await ProductsRepos.randomProducts(
      latestProductsPage,
      latestProductsLimitItem,
    );
    if (latestProductsPage <= latestProductsTotalPages) {
      List<Map<String, dynamic>> newLatestProducts =
          getDataFromProducts(res['items']);
      latestProducts.addAll(newLatestProducts);
    } else {
      stopLoading = true;
      if (!isDialogShown) {
        isDialogShown = true;
        Get.dialog(successDialogMsg("You have viewed all products."));
        Future.delayed(Duration(milliseconds: 2000), () {
          if (Get.isDialogOpen ?? false) {
            Get.back();
          }
        });
      }
    }
    isLoading = false;
    update();
  }

  @override
  Future getHotDeals() async {
    var res = await ProductsRepos.activeHotDeals(
      latestProductsPage,
      latestProductsLimitItem,
    );
    hotDeals = getHotDealsData(res['items']);
  }

  @override
  Future getBrands() async {
    var res = await HomeRepos.getBrands(
      latestProductsPage,
      latestProductsLimitItem,
    );
    brands = getBrandsData(res['items']);
  }

  @override
  Future getNewArrivalsProducts() async {
    var res = await ProductsRepos.newArrivals(
      latestProductsPage,
      latestProductsLimitItem,
    );
    newArrivalsProducts = getDataFromProducts(res['items']);
  }

  @override
  Future getFeaturedItemsProducts() async {
    var res = await ProductsRepos.featuredProducts(
      latestProductsPage,
      latestProductsLimitItem,
    );
    featuredItemsProducts = getDataFromProducts(res['items']);
  }

  @override
  Future getMostPopularProducts() async {
    var res = await ProductsRepos.popularProducts(
      latestProductsPage,
      latestProductsLimitItem,
    );
    mostPopularProducts = getDataFromProducts(res['items']);
  }

  @override
  Future getBackinStockProducts() async {
    var res = await ProductsRepos.backInStockProducts(
      latestProductsPage,
      latestProductsLimitItem,
    );
    backinStockProducts = getDataFromProducts(res['items']);
  }

  @override
  Future getBuyMoreSaveMoreProducts() async {
    var res = await ProductsRepos.buyMoreSaveMorePromotions(
      latestProductsPage,
      latestProductsLimitItem,
    );
    buyMoreSaveMoreProducts = getDataFromProducts(res['items']);
  }

  @override
  Future getExpressProducts() async {
    var res = await ProductsRepos.expressProducts(
      latestProductsPage,
      latestProductsLimitItem,
    );
    expressProducts = getDataFromProducts(res['items']);
  }

  @override
  Future getLatestProducts() async {
    var res = await ProductsRepos.randomProducts(
      latestProductsPage,
      latestProductsLimitItem,
    );
    latestProducts = getDataFromProducts(res['items']);
    latestProductsTotalPages = res["meta"]["totalPages"];
  }
}
