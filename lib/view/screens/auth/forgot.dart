import 'package:dentalistasyon/controller/auth/forgot.controller.dart';
import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/view/widgets/auth/forgot/body.forgot.dart';
import 'package:dentalistasyon/view/widgets/partials/language.btn.dart';
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
          formKey: controller.forgotFormKey,
          onTapContinue: () async {
            await controller.send();
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: Themes.edgeMd,
        child: langBtn(),
      ),
    );
  }
}
