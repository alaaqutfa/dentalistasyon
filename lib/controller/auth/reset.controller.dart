import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/auth.model.dart';
import 'package:dentalistasyon/data/repos/auth.repos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetController extends GetxController {
  //* Variables :
  GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {};
  var data = Get.arguments;
  bool ready = false;
  RxBool isObscured = true.obs;

  //* Functions :
  Future create();
  Future reset();
}

class ResetControllerImp extends ResetController {
  final BuildContext context;
  ResetControllerImp({required this.context});

  @override
  void onInit() async {
    super.onInit();
    await create();
  }

  @override
  Future create() async {
    insertControllers(controllers, resetFields);
    ready = true;
    update();
  }

  @override
  Future reset() async {
    bool valid = checkFormState(resetFormKey);
    if (valid) {
      var res = await AuthRepos.changePasswordAfterOtp(
        data["user"]["id"],
        data["otp"],
        controllers["Password"]!.text,
      );
      if (res) {
        Get.offAllNamed(
          AppRoutes.login,
          arguments: {
            "user": data["user"],
          },
        );
      }
      if (res.containsKey("errors")) {
        if (context.mounted) {
          return AppDialog.error(
            context,
            "${"Failed".tr}, ${"Try again!".tr}",
            () {},
          );
        }
      }
    } else {}
  }
}
