import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/data/model/auth.model.dart';
import 'package:dentalistasyon/view/widgets/auth/body.auth.dart';
import 'package:dentalistasyon/view/widgets/auth/build.form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBody extends StatelessWidget {
  final Key? formKey;
  final RxBool isObscured;
  final RxBool isChecked;
  final Function()? onTapPrimaryBtn;
  final Function()? onTapGuestBtn;
  const LoginBody({
    super.key,
    this.formKey,
    required this.isObscured,
    required this.isChecked,
    this.onTapPrimaryBtn, this.onTapGuestBtn,
  });

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      title: "Welcome back!",
      desc: "Sign in to access your account 🤩",
      Form: authForm(
        formKey,
        loginFields,
        isObscured,
        isChecked,
        true,
        onTapPrimaryBtn,
        onTapGuestBtn,
        {}
      ),
      question: "Don’t have an account?",
      link: "Create account",
      linkEvent: () {
        Get.offAllNamed(AppRoutes.signup);
      },
    );
  }
}
