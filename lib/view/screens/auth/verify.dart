import 'package:dentalistasyon/controller/auth/verify.controller.dart';
import 'package:dentalistasyon/view/widgets/auth/verify/body.verify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: VerifyControllerImp(context: context),
        builder: (controller) => VerifyBody(
          seconds: controller.seconds,
          onSubmit: (value) {
            controller.validate = true;
            controller.otp = value;
            controller.update();
          },
          onTapSendAgain: () async {
            await controller.resend();
          },
          onTapVerify: controller.validate ? () async {
            await controller.verify();
          } : null,
          email: controller.data["user"]["email"],
        ),
      ),
    );
  }
}
