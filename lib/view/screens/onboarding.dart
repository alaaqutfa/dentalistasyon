import 'package:dentalistasyon/controller/onboarding.controller.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/widgets/onboarding/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnBoardingControllerImp>(
        init: OnBoardingControllerImp(context),
        builder: (controller) {
          return OnboardingBody(
            version: controller.version,
            leadingFunction: () {
              Get.toNamed(AppRoutes.locales);
            },
            trailingFunction: () {
              controller.exitOnboarding(AppRoutes.login);
            },
            onFinish: () {
              controller.exitOnboarding(AppRoutes.signup);
            },
          );
        },
      ),
    );
  }
}
