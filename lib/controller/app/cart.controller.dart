import 'package:dentalistasyon/core/services/services.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/repos/cart.repos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  //* Variables :
  Services services = Get.find();
  late String lang;
  bool ready = false;
  List<dynamic> cart = [];
  String cartTotal = "0";
  String totalPrice = "0";
  String totalDiscountedPrice = "0";
  String shippingPrice = "0";
  String totalAmount = "0";
  int cartPage = 1;
  int cartLimit = 10;
  var productQuantities = <String, RxInt>{}.obs;
  Map<String, TextEditingController> quantitiesControllers = {};
  //* Functions :
  Future reFresh();
  Future getCart();
  Future increaseQuantity(String productId);
  Future decreaseQuantity(String productId);
  Future updateQuantity(String productId, String value);
}

class CartControllerImp extends CartController {
  final BuildContext context;
  CartControllerImp({required this.context});

  @override
  void onInit() async {
    super.onInit();
    await reFresh();
  }

  @override
  Future getCart() async {
    var res = await CartRepos.getUserCart(cartPage, cartLimit);
    // var getCartTotal = await CartRepos.cartTotal();
    // cartTotal = (getCartTotal as num?)?.toStringAsFixed(2) ?? "0.00";
    cart = getDataFromUserCart(res["items"]);
    double totalPriceNum = 0;
    double totalDiscountedPriceNum = 0;
    double totalDiscountedPriceCalcNum = 0;
    double shippingPriceNum = 0;
    double totalAmountNum = 0;
    for (var item in cart) {
      String productId = item["id"].toString();
      int quantity = int.tryParse(item["quantity"].toString()) ?? 0;
      productQuantities[productId] = quantity.obs;
      quantitiesControllers[productId] = TextEditingController();
      quantitiesControllers[productId]!.text =
          productQuantities[productId]!.value.toString();
      totalPriceNum += double.parse(item["totalPrice"]);
      totalDiscountedPriceNum += double.parse(item["totalDiscountedPrice"]);
      shippingPriceNum += double.parse(item["shippingPrice"]);
    }
    totalPrice = totalPriceNum.toStringAsFixed(2);
    totalDiscountedPriceCalcNum = totalPriceNum - totalDiscountedPriceNum;
    totalDiscountedPrice = totalDiscountedPriceCalcNum.toStringAsFixed(2);
    shippingPrice = shippingPriceNum.toStringAsFixed(2);
    totalAmountNum =
        (totalPriceNum - totalDiscountedPriceCalcNum) + shippingPriceNum;
    totalAmount = totalAmountNum.toStringAsFixed(2);
    cartTotal = totalAmount;
    update();
  }

  @override
  Future reFresh() async {
    ready = false;
    update();
    await getCart();
    ready = true;
    update();
  }

  @override
  increaseQuantity(String productId) async {
    if (productQuantities.containsKey(productId)) {
      productQuantities[productId]!.value++;
    } else {
      productQuantities[productId] = 1.obs;
    }
    try {
      await CartRepos.updateCartItemQuantity(
        productId,
        "INCREMENT",
      );
    } catch (e) {
      print("خطأ في تحديث السيرفر: $e");
      productQuantities[productId]!.value--; // التراجع في حالة الفشل
    }
    quantitiesControllers[productId]!.text =
        productQuantities[productId]!.value.toString();
    await getCart();
  }

  @override
  decreaseQuantity(String productId) async {
    if (productQuantities.containsKey(productId) &&
        productQuantities[productId]!.value > 0) {
      productQuantities[productId]!.value--;
      try {
        await CartRepos.updateCartItemQuantity(
          productId,
          "DECREMENT",
        );
      } catch (e) {
        print("خطأ في تحديث السيرفر: $e");
        productQuantities[productId]!.value++;
      }
      quantitiesControllers[productId]!.text =
          productQuantities[productId]!.value.toString();
      await getCart();
    }
  }

  @override
  updateQuantity(String productId, String value) async {
    int? newValue = int.tryParse(value);
    if (newValue != null && newValue > 0) {
      productQuantities[productId]!.value = newValue;
    } else {
      productQuantities[productId]!.value = 1;
    }
    quantitiesControllers[productId]!.text =
        productQuantities[productId]!.value.toString();
    await getCart();
  }
}
