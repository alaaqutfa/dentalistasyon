import 'package:dentalistasyon/controller/auth/forgot.controller.dart';
import 'package:dentalistasyon/view/widgets/auth/forgot/body.forgot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgot extends StatelessWidget {
  const Forgot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: ForgotControllerImp(context: context),
        builder: (controller) => ForgotBody(
          formKey: controller.formKey,
          onTapContinue: () {
            controller.send();
          },
        ),
      ),
    );
  }
}
