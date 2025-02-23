import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/auth.modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  //* Variables :
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {};
  bool ready = false;
  RxBool isObscured = true.obs;
  RxBool isChecked = false.obs;
  List<String> role = [
    "doctor",
    "student",
  ];
  String roleValue = "doctor";
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
  }

  @override
  Future create() async {
    insertControllers(controllers, signupFields);
    ready = true;
    update();
  }

  @override
  Future signup() async {
    bool valid = checkFormState(formKey);
    if (valid) {
      Map<String, String> info =
          controllers.map((key, controller) => MapEntry(key, controller.text));
      print(info);
      Get.toNamed(AppRoutes.verify, arguments: {
        "next": AppRoutes.home,
        "email": controllers["Email"]?.text,
        "info": info,
        "OTP": "1111",
      });
    } else {}
  }
}
