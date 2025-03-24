import 'package:dentalistasyon/controller/app/cart.controller.dart';
import 'package:dentalistasyon/view/widgets/app/cart/body.cart.dart';
import 'package:dentalistasyon/view/widgets/partials/nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: defNav(context, 2),
      body: GetBuilder(
        init: CartControllerImp(context: context),
        builder: (controller) => CartBody(
          ready: controller.ready,
          onRefresh: () async {
            await controller.reFresh();
          },
          cart: controller.cart,
          cartTotal: controller.cartTotal,
          totalPrice: controller.totalPrice,
          totalDiscountedPrice: controller.totalDiscountedPrice,
          shippingPrice: controller.shippingPrice,
          totalAmount: controller.totalAmount,
          productQuantities: controller.productQuantities,
          quantitiesControllers: controller.quantitiesControllers,
          onPressedDecreaseQuantity: (id) => controller.decreaseQuantity(id),
          onPressedIncreaseQuantity: (id) => controller.increaseQuantity(id),
          onSubmittedQuantity: (id,value) => controller.updateQuantity(id, value),
        ),
      ),
    );
  }
}
