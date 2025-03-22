import 'package:dentalistasyon/core/services/services.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/auth.model.dart';
import 'package:dentalistasyon/data/repos/auth.repos.dart';
import 'package:dentalistasyon/data/repos/user.repos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  //* Variables :
  Services services = Get.find();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {};
  RxBool ready = false.obs;
  RxBool isObscured = true.obs;
  RxBool isChecked = false.obs;
  //* Functions :
  Future create();
  Future signup();
}

class SignupControllerImp extends SignupController {
  final BuildContext context;
  SignupControllerImp({required this.context});

  @override
  void onInit() async {
    super.onInit();
    await create();
    controllers["Email"]!.text = "alaaqutfa.work@gmail.com";
    controllers["Name"]!.text = "Alaa Qutfa";
    controllers["Password"]!.text = "A123456a@";
    controllers["Confirm password"]!.text = "A123456a@";
    controllers["Diploma NO."]!.text = "1234567890";
  }

  @override
  Future create() async {
    insertControllers(controllers, signupFields);
    ready.value = true;
    update();
  }

  @override
  Future signup() async {
    if (isChecked.value) {
      bool valid = checkFormState(signupFormKey);
      if (valid) {
        var res = await AuthRepos.signup(
          controllers["Email"]!.text,
          controllers["Name"]!.text,
          controllers["Password"]!.text,
          controllers["Diploma NO."]!.text,
          services.shared.getString("lang") ?? "TR",
        );
        if (res.containsKey("errors")) {
          if (context.mounted) {
            return AppDialog.error(
              context,
              "Signup failed".tr,
              () {},
            );
          }
        }
        if (res["success"]) {
          var user = await UserRepos.getUserByEmail(controllers["Email"]!.text);
          if (user.containsKey("errors")) {
            if (context.mounted) {
              return AppDialog.error(
                context,
                "Signup failed".tr,
                () {},
              );
            }
          }
          Get.toNamed(AppRoutes.verify, arguments: {
            "next": AppRoutes.login,
            "purpose": "VERIFICATION",
            "user": user,
          });
        } else {
          if (context.mounted) {
            return AppDialog.error(
              context,
              "Signup failed".tr,
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
    } else {
      if (context.mounted) {
        AppDialog.warning(
          context,
          "Please agree to the terms and privacy".tr,
          () {},
          () {},
        );
      }
    }
  }
}
