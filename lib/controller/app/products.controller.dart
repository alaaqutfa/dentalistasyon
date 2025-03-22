import 'package:dentalistasyon/core/services/services.dart';
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

  //* Functions :
  Future reFresh();
  Future getProduct();
  Future addToCart();
}

class ProductsControllerImp extends ProductsController {
  final BuildContext context;
  ProductsControllerImp({required this.context});

  @override
  void onInit() async {
    super.onInit();
    await reFresh();
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
    print(res);
  }
}
