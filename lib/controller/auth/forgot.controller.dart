import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/auth.model.dart';
import 'package:dentalistasyon/data/repos/auth.repos.dart';
import 'package:dentalistasyon/data/repos/user.repos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgotController extends GetxController {
  //* Variables :
  GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {};
  var data = Get.arguments;
  bool ready = false;

  //* Functions :
  Future create();
  Future send();
}

class ForgotControllerImp extends ForgotController {
  final BuildContext context;
  ForgotControllerImp({required this.context});

  @override
  void onInit() async {
    super.onInit();
    await create();
  }

  @override
  Future create() async {
    insertControllers(controllers, forgotFields);
    ready = true;
    update();
  }

  @override
  Future send() async {
    bool valid = checkFormState(forgotFormKey);
    if (valid) {
      var user = await UserRepos.getUserByEmail(controllers["Email"]!.text);
      var res = await AuthRepos.forgotPassword(controllers["Email"]!.text);
      if (res || !user.containsKey("errors")) {
        Get.toNamed(AppRoutes.verify, arguments: {
          "next": AppRoutes.reset,
          "purpose": "CHANGE_PASSWORD",
          "user": user,
        });
      }
      if (res.containsKey("errors") || user.containsKey("errors")) {
        if (context.mounted) {
          return AppDialog.error(
            context,
            "Enter a valid email address".tr,
            () {},
          );
        }
      }
    } else {
      if (context.mounted) {
        AppDialog.error(
          context,
          "Please make sure to fill in all required fields.".tr,
          () {},
        );
      }
    }
  }
}
