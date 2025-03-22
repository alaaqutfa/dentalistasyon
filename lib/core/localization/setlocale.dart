import 'package:dentalistasyon/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetlocaleController extends GetxController {
  Locale? language;
  Services services = Get.find();
  String currentLocale = "tr";

  @override
  Future<void> onInit() async {
    super.onInit();
    if (services.shared.getString("lang") != null) {
      currentLocale = services.shared.getString("lang")!;
      language = Locale(currentLocale);
    } else {
      //Get.deviceLocale!.languageCode
      services.shared.setString("lang", "tr");
      language = Locale("tr");
    }
    update();
  }

  setLocale(String locale) {
    Locale localeCode = Locale(locale);
    services.shared.setString("lang", locale);
    currentLocale = locale;
    Get.updateLocale(localeCode);
    update();
    Future.delayed(Duration(milliseconds: 500), () {
      Get.back();
    });
  }
}
