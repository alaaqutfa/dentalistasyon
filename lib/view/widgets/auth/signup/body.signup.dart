import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/data/model/auth.model.dart';
import 'package:dentalistasyon/view/widgets/auth/body.auth.dart';
import 'package:dentalistasyon/view/widgets/auth/build.form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupBody extends StatelessWidget {
  final Key? formKey;
  final RxBool isObscured;
  final RxBool isChecked;
  final Function()? onTapPrimaryBtn;
  final Function()? onTapGuestBtn;
  final Map<String, TextEditingController> controllers;
  const SignupBody({
    super.key,
    required this.isObscured,
    required this.isChecked,
    this.formKey,
    this.onTapPrimaryBtn,
    this.onTapGuestBtn, required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      title: "Sign up now",
      desc: "start exploring ",
      Form: authForm(
        formKey,
        signupFields,
        isObscured,
        isChecked,
        false,
        onTapPrimaryBtn,
        onTapGuestBtn,
        controllers
      ),
      question: "Already have an account?",
      link: "Login",
      linkEvent: () {
        Get.offAllNamed(AppRoutes.login);
      },
    );
  }
}
