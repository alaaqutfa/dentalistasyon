import 'package:dentalistasyon/controller/auth/reset.controller.dart';
import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/view/widgets/auth/reset/body.reset.dart';
import 'package:dentalistasyon/view/widgets/partials/language.btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reset extends StatelessWidget {
  const Reset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: ResetControllerImp(context: context),
        builder: (controller) => ResetBody(
          formKey: controller.resetFormKey,
          controllers: controller.controllers,
          isObscured: controller.isObscured,
          onTapSave: () async {
            await controller.reset();
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
