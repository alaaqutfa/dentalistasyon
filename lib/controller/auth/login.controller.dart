import 'package:dentalistasyon/core/services/auth.services.dart';
import 'package:dentalistasyon/core/services/services.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/auth.model.dart';
import 'package:dentalistasyon/data/model/user.model.dart';
import 'package:dentalistasyon/data/repos/auth.repos.dart';
import 'package:dentalistasyon/data/repos/user.repos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  //* Variables :
  Services services = Get.find();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {};
  var data = Get.arguments;
  bool ready = false;
  RxBool isObscured = true.obs;
  RxBool isChecked = false.obs;
  //* Functions :
  Future create();
  Future login();
}

class LoginControllerImp extends LoginController {
  final BuildContext context;
  LoginControllerImp({required this.context});

  @override
  void onInit() async {
    super.onInit();
    await create();
    controllers["Email"]!.text = data["email"] ?? "";
    controllers["Password"]!.text = "A123456a@";
  }

  @override
  Future create() async {
    insertControllers(controllers, loginFields);
    ready = true;
    update();
  }

  @override
  Future login() async {
    bool valid = checkFormState(loginFormKey);
    if (valid) {
      String? deviceId = await getDeviceId();
      print(deviceId);
      if (deviceId != null) {
        var res = await AuthRepos.login(
          controllers["Email"]!.text,
          controllers["Password"]!.text,
          isChecked.value,
          deviceId,
        );
        var user = await UserRepos.getUserByEmail(controllers["Email"]!.text);
        if (res.containsKey("errors") || user.containsKey("errors")) {
          if (context.mounted) {
            return AppDialog.error(
              context,
              "Login failed".tr,
              () {},
            );
          }
        }
        bool getUserData = await User.init(user["id"]);
        if (getUserData) {
          if (isChecked.value) {
            AuthService.saveTokens(
              res["accessToken"],
              res["refreshToken"],
              res["expiresIn"],
            );
          }
          services.shared.setString("id", user["id"]);
          Get.offAllNamed(AppRoutes.home);
        } else {
          if (context.mounted) {
            AppDialog.error(
              context,
              "Try again!".tr,
              () {},
            );
          }
        }
      } else {
        if (context.mounted) {
          AppDialog.error(
            context,
            "Try again!".tr,
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
