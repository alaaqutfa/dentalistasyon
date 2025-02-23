import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/auth.modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetController extends GetxController {
  //* Variables :
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {};
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
    bool valid = checkFormState(formKey);
    if (valid) {
      // Map<String, String> info =
      //     controllers.map((key, controller) => MapEntry(key, controller.text));
      Get.offAllNamed(AppRoutes.login);
    } else {}
  }
}
