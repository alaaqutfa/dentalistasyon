import 'package:dentalistasyon/controller/app/orders.controller.dart';
import 'package:dentalistasyon/view/widgets/app/orders/body.add.review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReview extends StatelessWidget {
  const AddReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: OrdersControllerImp(context: context),
        builder: (controller) => AddReviewBody(),
      ),
    );
  }
}
