import 'package:dentalistasyon/controller/splash.controller.dart';
import 'package:dentalistasyon/core/services/services.dart';
import 'package:dentalistasyon/view/widgets/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Services services = Get.find();
    Get.put<SplashControllerImp>(SplashControllerImp(context));
    return Scaffold(
      body: SplashBody(
        version: services.packageInfo.version,
      ),
    );
  }
}
