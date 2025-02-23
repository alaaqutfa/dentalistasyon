import 'dart:io';
import 'package:dentalistasyon/core/services/services.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SplashController extends GetxController {
  Services services = Get.find();
  late bool? isShowOnboarding = services.shared.getBool("onboarding");

  Future splashFunction(bool fromBtn);
  splashPaths();
}

class SplashControllerImp extends SplashController {
  BuildContext context;
  SplashControllerImp(this.context);

  @override
  void onReady() async {
    super.onReady();
    if (isShowOnboarding == null) services.shared.setBool("onboarding", false);
    await splashFunction(false);
  }

  @override
  Future splashFunction(bool fromBtn) async {
    if (fromBtn) {
      try {
        var res = await InternetAddress.lookup("google.com");
        if (res.isNotEmpty && res[0].rawAddress.isNotEmpty) {
          services.wifiConn = true;
        } else {
          services.wifiConn = false;
        }
      } on SocketException catch (_) {
        services.wifiConn = false;
      }
      await splashPaths();
    }
    Future.delayed(Duration(seconds: 2), () {
      splashPaths();
    });
  }

  @override
  Future splashPaths() async {
    if (services.wifiConn) {
      if (isShowOnboarding == false) {
        Get.offAllNamed(AppRoutes.onboarding);
      } else {
        Get.offAllNamed(AppRoutes.starter);
      }
    } else {
      Get.offAllNamed(AppRoutes.nointernet);
    }
  }
}
