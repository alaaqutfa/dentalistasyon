import 'package:dentalistasyon/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  //* Variables :
  Services services = Get.find();
  late String version = services.packageInfo.version;

  //* Functions :
  exitOnboarding(String page);
}

class OnBoardingControllerImp extends OnBoardingController {
  BuildContext context;
  OnBoardingControllerImp(this.context);
  
  @override
  exitOnboarding(String page) {
    services.shared.setBool("onboarding", true);
    Get.offAllNamed(page);
  }


}
