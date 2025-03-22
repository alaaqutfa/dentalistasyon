import 'package:dentalistasyon/controller/app/account.controller.dart';
import 'package:dentalistasyon/view/widgets/app/account/body.loyalty.points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoyaltyPointss extends StatelessWidget {
  const LoyaltyPointss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: AccountControllerImp(context: context),
        builder: (controller) => LoyaltyPointssBody(),
      ),
    );
  }
}
