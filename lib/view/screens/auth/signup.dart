import 'package:dentalistasyon/controller/auth/signup.controller.dart';
import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/view/widgets/auth/signup/body.signup.dart';
import 'package:dentalistasyon/view/widgets/partials/language.btn.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: SignupControllerImp(context: context),
        builder: (controller) => SignupBody(
          formKey: controller.signupFormKey,
          isChecked: controller.isChecked,
          isObscured: controller.isObscured,
          onTapPrimaryBtn: () async {
            await controller.signup();
          },
          onTapGuestBtn: () {},
          controllers: controller.controllers,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: Themes.edgeMd,
        child: langBtn(),
      ),
    );
  }
}
