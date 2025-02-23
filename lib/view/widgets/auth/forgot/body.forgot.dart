import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/data/model/auth.modal.dart';
import 'package:dentalistasyon/view/widgets/auth/build.form.dart';
import 'package:dentalistasyon/view/widgets/partials/appBtn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ForgotBody extends StatelessWidget {
  final Key? formKey;
  final dynamic Function()? onTapContinue;
  const ForgotBody({super.key, this.formKey, this.onTapContinue});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Themes.bg,
        padding: Themes.edgeMd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topContent(formKey),
            Themes.spaceY64,
            defBtn(
              double.infinity,
              Themes.primary,
              onTapContinue,
              "Continue",
              true,
            ),
          ],
        ),
      ),
    );
  }
}

Widget topContent(
  Key? key,
) {
  return ListView(
    physics: AlwaysScrollableScrollPhysics(),
    shrinkWrap: true,
    children: [
      IconButton(
        alignment: Alignment.centerLeft,
        onPressed: () {
          Get.back();
        },
        icon: FaIcon(
          FontAwesomeIcons.xmark,
          color: Themes.text,
        ),
      ),
      Text(
        "Forget Password?".tr,
        style: Themes.title_2xl,
      ),
      Themes.spaceY8,
      Text(
        "Don’t worry! Please enter the email".tr,
        style: Themes.text_base.copyWith(
          color: Themes.grayText,
        ),
      ),
      Themes.spaceY16,
      authJustFieldForm(key, forgotFields, {}, false.obs),
    ],
  );
}
