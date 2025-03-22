import 'package:dentalistasyon/core/services/api.services.dart';
import 'package:dentalistasyon/core/services/auth.services.dart';
import 'package:dentalistasyon/core/services/services.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/user.model.dart';
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
      services.wifiConn = await checkInternetConnection();
    }
    Future.delayed(Duration(seconds: 1), () async {
      await splashPaths();
    });
  }

  @override
  Future splashPaths() async {
    if (services.wifiConn) {
      isShowOnboarding = services.shared.getBool("onboarding");

      if (isShowOnboarding == false || isShowOnboarding == null) {
        Get.offAllNamed(AppRoutes.onboarding);
        return;
      }

      String? accessToken = await ApiService.getValidAccessToken();
      String? id = services.shared.getString("id");

      if (accessToken != null && id != null) {
        // جلب معلومات المستخدم
        bool getUser = await User.init(id);
        
        if (getUser) {
          // ✅ التوكن صالح، الدخول مباشرة إلى الصفحة الرئيسية
          Get.offAllNamed(AppRoutes.home);
        } else {
          // ❌ id غير صالح
          AuthService.clearTokens();
          Get.offAllNamed(AppRoutes.starter);
        }
      } else {
        // ❌ التوكن غير صالح ولا يمكن تجديده، تسجيل خروج المستخدم
        AuthService.clearTokens();
        Get.offAllNamed(AppRoutes.starter);
      }
    } else {
      Get.offAllNamed(AppRoutes.nointernet);
    }
  }
}
