import 'package:dentalistasyon/controller/app/products.controller.dart';
import 'package:dentalistasyon/view/widgets/app/products/body.product.dart';
import 'package:dentalistasyon/view/widgets/partials/floatingActionBtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProductsControllerImp(context: context),
      builder: (controller) => Scaffold(
        floatingActionButton: defFloatingActionButton(context),
        body: ProductBody(
          ready: controller.ready,
          onRefresh: () async {
            await controller.reFresh();
          },
          product: controller.product,
          mainImg: controller.mainImg,
          reviews: controller.reviews,
          relatedProducts: controller.relatedProducts,
        ),
        bottomNavigationBar: controller.ready
            ? buildBottomNavigationBar(
                controller.addedToCart,
                controller.product["price"],
                () async {
                  await controller.addToCart();
                },
              )
            : buildBottomNavigationBarShimmer(),
      ),
    );
  }
}
