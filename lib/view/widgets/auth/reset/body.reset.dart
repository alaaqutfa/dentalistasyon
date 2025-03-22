import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/data/model/auth.model.dart';
import 'package:dentalistasyon/view/widgets/auth/build.form.dart';
import 'package:dentalistasyon/view/widgets/partials/appBtn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ResetBody extends StatelessWidget {
  final Key? formKey;
  final Map<String, TextEditingController> controllers;
  final RxBool isObscured;
  final Function()? onTapSave;
  const ResetBody(
      {super.key,
      this.formKey,
      required this.controllers,
      required this.isObscured,
      this.onTapSave});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Themes.bg,
      padding: Themes.edgeMd,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          topContent(formKey, controllers, isObscured),
          defBtn(
            double.infinity,
            Themes.primary,
            onTapSave,
            "Save",
            true,
          ),
        ],
      ),
    ));
  }
}

Widget topContent(
  Key? key,
  Map<String, TextEditingController> controllers,
  RxBool isObscured,
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
          FontAwesomeIcons.arrowLeftLong,
          color: Themes.text,
        ),
      ),
      Text(
        "Creat New Password".tr,
        style: Themes.title_2xl,
      ),
      Themes.spaceY8,
      Text(
        "Set a new password for your account to keep it safe and secure.".tr,
        style: Themes.text_base.copyWith(
          color: Themes.grayText,
        ),
      ),
      Themes.spaceY16,
      authJustFieldForm(key, resetFields, controllers, isObscured),
    ],
  );
}
