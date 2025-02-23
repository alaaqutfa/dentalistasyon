import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/auth.modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgotController extends GetxController {
  //* Variables :
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {};
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
  Future send() async {
    bool valid = checkFormState(formKey);
    if (valid) {
      Map<String, String> info =
          controllers.map((key, controller) => MapEntry(key, controller.text));
      print(info);
      Get.toNamed(AppRoutes.verify, arguments: {
        "next": AppRoutes.reset,
        "email": controllers["Email"]?.text,
        "info": info,
        "OTP": "1111",
      });
    } else {}
  }

  @override
  Future create() async {
    insertControllers(controllers, forgotFields);
    ready = true;
    update();
  }
}
