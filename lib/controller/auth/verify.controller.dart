import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/data/repos/auth.repos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

abstract class VerifyController extends GetxController {
  //* Variables :
  final Map<String, TextEditingController> controllers = {};
  var data = Get.arguments;
  RxInt seconds = 60.obs;
  Timer? timer;
  bool validate = false;
  String otp = "";
  //* Functions :
  startCountdown();
  resetCountdown();
  Future verify();
  Future resend();
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
    if (validate) {
      dynamic res;
      if (data["purpose"] == "CHANGE_PASSWORD") {
        res = await AuthRepos.verifyPasswordResetOtp(data["user"]["id"], otp);
      } else {
        res = await AuthRepos.verifyOtp(data["user"]["id"], otp);
      }
      if (res) {
        return Get.offNamed(data["next"], arguments: {
          "otp": otp,
          "user": data["user"],
        });
      }
      if (res.containsKey("errors")) {
        if (context.mounted) {
          return AppDialog.error(
            context,
            "Invalid OTP".tr,
            () {},
          );
        }
      }
    }
  }

  @override
  Future resend() async {
    resetCountdown();
    var res = await AuthRepos.resendOtp(data["purpose"], data["user"]["email"]);
    if (res) {
      if (context.mounted) {
        return AppDialog.success(
          context,
          "OTP code has been sent successfully to ".tr + data["user"]["email"],
          () {},
        );
      }
    }
    if (res.containsKey("errors")) {
      if (context.mounted) {
        return AppDialog.error(
          context,
          "OTP resend is not allowed yet. Please wait a bit longer.".tr,
          () {},
        );
      }
    }
  }
}
