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
          autovalidate: controller.autovalidate,
          onCodeChanged: (value) {
            controller.autovalidate.value =
                controller.data["OTP"]?.contains(value) ?? false;
            controller.update();
          },
          onSubmit: (value) {
            controller.autovalidate.value = controller.data["OTP"] == value;
            controller.update();
          },
          onTapSendAgain: () {
            controller.resetCountdown();
          },
          onTapVerify: () async {
            await controller.verify();
          },
          email: controller.data["email"],
        ),
      ),
    );
  }
}
