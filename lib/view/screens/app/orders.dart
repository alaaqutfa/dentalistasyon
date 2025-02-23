import 'package:dentalistasyon/controller/app/orders.controller.dart';
import 'package:dentalistasyon/view/widgets/app/orders/body.orders.dart';
import 'package:dentalistasyon/view/widgets/partials/nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: defNav(context, 3),
      body: GetBuilder(
        init: OrdersControllerImp(context: context),
        builder: (controller) => OrdersBody(),
      ),
    );
  }
}
