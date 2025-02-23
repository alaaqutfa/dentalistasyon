import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/view/widgets/partials/appBtn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyBody extends StatelessWidget {
  final String email;
  final RxBool autovalidate;
  final void Function(String)? onSubmit;
  final void Function(String)? onCodeChanged;
  final RxInt seconds;
  final Function()? onTapSendAgain;
  final Function()? onTapVerify;
  const VerifyBody({
    super.key,
    this.onSubmit,
    required this.autovalidate,
    this.onCodeChanged,
    required this.seconds,
    this.onTapSendAgain,
    this.onTapVerify,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Themes.bg,
        padding: Themes.edgeMd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topContent(autovalidate, onSubmit, onCodeChanged, email),
            Themes.spaceY64,
            bottomContent(
              seconds,
              onTapSendAgain,
              onTapVerify,
            ),
          ],
        ),
      ),
    );
  }
}

Widget topContent(
  RxBool autovalidate,
  void Function(String)? onSubmit,
  void Function(String)? onCodeChanged,
  String email,
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
        "Verify code".tr,
        style: Themes.title_2xl,
      ),
      Themes.spaceY8,
      Text(
        "Enter the 4-digit code we just texted to your Email, ".tr + email,
        style: Themes.text_base.copyWith(
          color: Themes.grayText,
        ),
      ),
      Themes.spaceY32,
      Obx(
        () => Center(
          child: OtpTextField(
            autoFocus: true,
            numberOfFields: 4,
            fieldWidth: 64,
            fieldHeight: 64,
            fillColor: Themes.bg,
            borderColor: Themes.stroke,
            enabledBorderColor:
                autovalidate.value ? Themes.stroke : Themes.error,
            cursorColor: Themes.primary,
            focusedBorderColor: Themes.primary,
            showFieldAsBox: true,
            borderRadius: Themes.borderRadiusSm,
            textStyle: Themes.text_base,
            onCodeChanged: onCodeChanged,
            onSubmit: onSubmit,
          ),
        ),
      ),
      Themes.spaceY32,
    ],
  );
}

Widget bottomContent(
  RxInt seconds,
  Function()? onTapSendAgain,
  Function()? onTapVerify,
) {
  return Column(
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Didn’t receive a code?".tr,
            style: Themes.text_sm,
          ),
          Themes.spaceX4,
          Obx(
            () => Center(
              child: seconds.value > 0
                  ? Text(
                      '00:${seconds.value.toString().padLeft(2, '0')}',
                      style: Themes.text_sm.copyWith(
                        color:
                            seconds.value > 0 ? Themes.grayText : Themes.error,
                      ),
                    )
                  : defLink(onTapSendAgain, "send agin"),
            ),
          ),
        ],
      ),
      Themes.spaceY32,
      defBtn(
        double.infinity,
        Themes.primary,
        onTapVerify,
        "Verify",
        true,
      )
    ],
  );
}
