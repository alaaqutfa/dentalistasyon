import 'package:dentalistasyon/controller/auth/login.controller.dart';
import 'package:dentalistasyon/view/widgets/auth/login/body.login.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: LoginControllerImp(context: context),
        builder: (controller) => LoginBody(
          formKey: controller.formKey,
          isObscured: controller.isObscured,
          isChecked: controller.isChecked,
          onTapPrimaryBtn: () async {
            await controller.login();
          },
          onTapGuestBtn: () {},
        ),
      ),
    );
  }
}
