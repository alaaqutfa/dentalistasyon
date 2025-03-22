import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/widgets/auth/starter/body.starter.dart';
import 'package:dentalistasyon/view/widgets/partials/language.btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StarterBody(
        onTapCreate: () {
          Get.toNamed(AppRoutes.signup);
        },
        onTapLogin: () {
          Get.toNamed(AppRoutes.login);
        },
        onTapTermAndPrivacy: () {
          Get.toNamed(AppRoutes.termAndPrivacy);
        },
      ),
      bottomNavigationBar: Padding(
        padding: Themes.edgeMd,
        child: langBtn(),
      ),
    );
  }
}
