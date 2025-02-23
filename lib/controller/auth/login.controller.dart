import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/auth.modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  //* Variables :
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {};
  Map<String, dynamic> data = Get.arguments ?? {};
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
    controllers['email']?.text = data['email'] ?? '';
  }

  @override
  Future create() async {
    insertControllers(controllers, loginFields);
    ready = true;
    update();
  }

  @override
  Future login() async {
    bool valid = checkFormState(formKey);
    if (valid) {
      Map<String, String> info =
          controllers.map((key, controller) => MapEntry(key, controller.text));
      print(info);
      Get.toNamed(AppRoutes.home, arguments: info);
    } else {}
  }
}
