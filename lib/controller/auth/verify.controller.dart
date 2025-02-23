import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

abstract class VerifyController extends GetxController {
  //* Variables :
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {};
  var data = Get.arguments;
  bool ready = false;
  RxInt seconds = 60.obs;
  Timer? timer;
  RxBool autovalidate = true.obs;
  //* Functions :
  startCountdown();
  resetCountdown();
  Future verify();
}

class VerifyControllerImp extends VerifyController {
  final BuildContext context;
  VerifyControllerImp({required this.context});

  @override
  void onInit() async {
    super.onInit();
    startCountdown();
  }

  @override
  startCountdown() {
    if (timer != null && timer!.isActive) return;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        seconds.value = 00;
        timer.cancel();
      }
    });
  }

  @override
  resetCountdown() {
    timer?.cancel();
    seconds.value = 60;
    startCountdown();
  }

  @override
  Future verify() async {
    if (autovalidate.value) {
      if (data["next"] == AppRoutes.home) {
        Get.offAllNamed(data["next"], arguments: data["info"]);
      } else {
        Get.toNamed(data["next"]);
      }
    }
  }
}
