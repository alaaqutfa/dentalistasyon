import 'package:dentalistasyon/controller/app/account.controller.dart';
import 'package:dentalistasyon/view/widgets/app/account/security/body.security.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: AccountControllerImp(context: context),
        builder: (controller) => SecurityBody(),
      ),
    );
  }
}
