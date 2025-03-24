import 'package:dentalistasyon/core/services/services.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/repos/cart.repos.dart';
import 'package:dentalistasyon/data/repos/products.repos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductsController extends GetxController {
  //* Variables :
  Services services = Get.find();
  late String lang;
  bool ready = false;
  var data = Get.arguments;
  Map<String, dynamic> storeProduct = {};
  Map<String, dynamic> product = {};
  List<dynamic> reviews = [];
  List<dynamic> relatedProducts = [];
  RxString mainImg = "".obs;
  int reviewsPage = 1;
  int reviewsLimit = 10;
  int relatedProductsPage = 1;
  int relatedProductsLimit = 10;
  bool addedToCart = false;

  //* Functions :
  Future reFresh();
  Future getProduct();
  Future checkCart();
  Future addToCart();
}

class ProductsControllerImp extends ProductsController {
  final BuildContext context;
  ProductsControllerImp({required this.context});

  @override
  void onInit() async {
    super.onInit();
    await reFresh();
    await checkCart();
  }

  @override
  Future reFresh() async {
    ready = false;
    update();
    await getProduct();
    mainImg.value = product["img"];
    List<dynamic> reviewsStored = storeProduct["reviews"]["items"] ?? [{}];
    reviews = getDataReviewsFromProduct(reviewsStored);
    List<dynamic> relatedProductsStored =
        storeProduct["relatedProducts"]["items"] ?? [{}];
    relatedProducts = getDataRelatedProductsFromProduct(relatedProductsStored);
    ready = true;
    update();
  }

  @override
  Future getProduct() async {
    var res = await ProductsRepos.storeProduct(
      data["id"],
      reviewsPage,
      reviewsLimit,
      relatedProductsPage,
      relatedProductsLimit,
    );
    storeProduct = res;
    product = getDataFromStoreProduct(res);
  }

  @override
  Future addToCart() async {
    var res = await CartRepos.addToCart(product["id"], 1);
    if (res["productId"] == product["id"]) {
      addedToCart = true;
      update();
      if (context.mounted) {
        AppDialog.success(
          context,
          "Added to cart successfully".tr,
          () {},
        );
      }
    } else {
      addedToCart = false;
      update();
      if (context.mounted) {
        AppDialog.error(
          context,
          "Something went wrong. Please try again later.".tr,
          () {},
        );
      }
    }
  }

  @override
  Future checkCart() async {
    var res = await CartRepos.getUserCart(1, 10);
    if (res["items"] != null) {
      List<dynamic> cartProducts =
          res["items"].map((item) => item["productId"]).toList();
      for (var productId in cartProducts) {
        if (productId == product["id"]) {
          addedToCart = true;
          update();
          return;
        }
      }
    }
  }
}
