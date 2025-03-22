import 'package:dentalistasyon/controller/app/orders.controller.dart';
import 'package:dentalistasyon/view/widgets/app/orders/body.show.order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowOrder extends StatelessWidget {
  const ShowOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: OrdersControllerImp(context: context),
        builder: (controller) => ShowOrderBody(),
      ),
    );
  }
}