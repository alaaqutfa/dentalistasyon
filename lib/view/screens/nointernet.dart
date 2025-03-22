import 'package:dentalistasyon/controller/splash.controller.dart';
import 'package:dentalistasyon/view/widgets/splash/nointernet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    SplashControllerImp controller = Get.put(SplashControllerImp(context));
    return Scaffold(
      body: NoInternetBody(
        onTap: () async {
          await controller.splashFunction(true);
        },
      ),
    );
  }
}
