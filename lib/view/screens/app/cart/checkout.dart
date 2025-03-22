import 'package:dentalistasyon/controller/app/cart.controller.dart';
import 'package:dentalistasyon/view/widgets/app/cart/body.checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: CartControllerImp(context: context),
        builder: (controller) => CheckoutBody(),
      ),
    );
  }
}
