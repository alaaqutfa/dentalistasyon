import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthBody extends StatelessWidget {
  final String title;
  final String desc;
  final Widget Form;
  final String question;
  final String link;
  final Function()? linkEvent;
  final Function()? onTapSocialGoogleBtn;
  final Function()? onTapSocialFacebookBtn;
  final Function()? onTapSocialAppleBtn;

  const AuthBody({
    super.key,
    required this.title,
    required this.desc,
    required this.Form,
    required this.question,
    required this.link,
    this.linkEvent,
    this.onTapSocialGoogleBtn,
    this.onTapSocialFacebookBtn,
    this.onTapSocialAppleBtn,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Themes.bg,
        padding: Themes.edgeMd,
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            logo(context),
            Themes.spaceY32,
            Text(
              title.tr,
              style: Themes.title_2xl,
            ),
            Themes.spaceY16,
            Text(
              desc.tr,
              style: Themes.text_base.copyWith(
                color: Themes.grayText,
              ),
            ),
            Themes.spaceY32,
            Form,
            Themes.spaceY16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 40,
                  child: Divider(
                    color: Themes.stroke,
                    height: 1,
                    thickness: 1,
                  ),
                ),
                Text(
                  "Or".tr,
                  style: Themes.text_sm.copyWith(
                    color: Themes.grayText,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 40,
                  child: Divider(
                    color: Themes.stroke,
                    height: 1,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            Themes.spaceY16,
            social(
              MediaQuery.of(context).size.width / 3 - Spacing.md,
              onTapSocialGoogleBtn,
              onTapSocialFacebookBtn,
              onTapSocialAppleBtn,
            ),
            Themes.spaceY16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  question.tr,
                  style: Themes.text_sm,
                ),
                Themes.spaceX8,
                InkWell(
                  onTap: linkEvent,
                  child: Text(
                    link.tr,
                    style: Themes.linkStyle,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget logo(BuildContext context) {
  return Center(
    child: Image.asset(
      AppImg.logo,
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.width / 4,
      fit: BoxFit.contain,
    ),
  );
}

Widget social(
  double? width,
  Function()? onTapSocialGoogleBtn,
  Function()? onTapSocialFacebookBtn,
  Function()? onTapSocialAppleBtn,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      socialBoxBtn(
        width,
        AppImg.google_icon,
        onTapSocialGoogleBtn,
      ),
      socialBoxBtn(
        width,
        AppImg.facebook_icon,
        onTapSocialFacebookBtn,
      ),
      socialBoxBtn(
        width,
        AppImg.apple_icon,
        onTapSocialAppleBtn,
      ),
    ],
  );
}

Widget socialBoxBtn(
  double? width,
  String img,
  Function()? onTap,
) {
  return Container(
    width: width,
    padding: Themes.edgeSm,
    decoration: BoxDecoration(
      color: Themes.bg,
      border: Border.all(
        color: Themes.stroke,
      ),
      borderRadius: Themes.borderRadiusSm,
    ),
    child: InkWell(
      onTap: onTap,
      child: Center(
        child: Image.asset(
          img,
          width: Spacing.lg,
          height: Spacing.lg,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
