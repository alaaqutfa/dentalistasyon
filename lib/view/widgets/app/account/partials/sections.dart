import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget accountSection({
  Function()? onTapProfile,
  Function()? onTapLoyalty,
  Function()? onTapAddress,
  Function()? onTapSecurity,
  Function()? onTapPayment,
  Function()? onTapDelete,
  required String point,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Account".tr,
        style: Themes.text_sm.copyWith(
          color: Themes.grayText,
        ),
        textAlign: TextAlign.start,
      ),
      Themes.spaceY8,
      Container(
        padding: Themes.edgeSm,
        decoration: BoxDecoration(
          color: Themes.whiteGray,
          borderRadius: Themes.borderRadiusSm,
        ),
        child: Column(
          children: [
            item(
              onTapProfile,
              AppImg.user_icon,
              "Profile",
              AppImg.arrow_right_icon,
            ),
            itemLoyalty(
              onTapLoyalty,
              AppImg.points_icon,
              "Loyalty points",
              AppImg.arrow_right_icon,
              point,
            ),
            item(
              onTapAddress,
              AppImg.address_icon,
              "Address",
              AppImg.arrow_right_icon,
            ),
            item(
              onTapSecurity,
              AppImg.security_icon,
              "Security",
              AppImg.arrow_right_icon,
            ),
            item(
              onTapPayment,
              AppImg.payment_icon,
              "Payment",
              AppImg.arrow_right_icon,
            ),
            item(
              onTapDelete,
              AppImg.trash_icon,
              "Delete account",
              AppImg.arrow_right_icon,
              whithBorder: false,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget settingsSection({
  Function()? onTapLanguage,
  required String langName,
  required RxBool isSwitched,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "App Settings".tr,
        style: Themes.text_sm.copyWith(
          color: Themes.grayText,
        ),
        textAlign: TextAlign.start,
      ),
      Themes.spaceY8,
      Container(
        padding: Themes.edgeSm,
        decoration: BoxDecoration(
          color: Themes.whiteGray,
          borderRadius: Themes.borderRadiusSm,
        ),
        child: Column(
          children: [
            Obx(
              () => itemNotification(
                AppImg.bell_icon,
                "Notifications",
                isSwitched,
                (value) {
                  isSwitched.value = value;
                },
              ),
            ),
            itemLanguage(
              onTapLanguage,
              AppImg.language_icon,
              "Language",
              AppImg.arrow_right_icon,
              langName,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget supportSection({
  Function()? onTapTerm,
  Function()? onTapFAQ,
  Function()? onTapContact,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Support".tr,
        style: Themes.text_sm.copyWith(
          color: Themes.grayText,
        ),
        textAlign: TextAlign.start,
      ),
      Themes.spaceY8,
      Container(
        padding: Themes.edgeSm,
        decoration: BoxDecoration(
          color: Themes.whiteGray,
          borderRadius: Themes.borderRadiusSm,
        ),
        child: Column(
          children: [
            item(
              onTapTerm,
              AppImg.term_icon,
              "Term and Conditions",
              AppImg.arrow_right_icon,
            ),
            item(
              onTapFAQ,
              AppImg.faq_icon,
              "FAQ",
              AppImg.arrow_right_icon,
            ),
            item(
              onTapContact,
              AppImg.contact_icon,
              "Contact us",
              AppImg.arrow_right_icon,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget logoutSection({
  Function()? onTapLogout,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: Themes.edgeSm,
        decoration: BoxDecoration(
          color: Themes.whiteGray,
          borderRadius: Themes.borderRadiusSm,
        ),
        child: Column(
          children: [
            ListTile(
              onTap: onTapLogout,
              leading: Image.asset(
                AppImg.logout_icon,
                width: Spacing.rem * 1.25,
                height: Spacing.lg * 1.25,
                fit: BoxFit.contain,
              ),
              title: Text(
                "Log out".tr,
                style: Themes.text_base.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget item(
  Function()? onTap,
  String leadingImg,
  String title,
  String trailingImg, {
  bool whithBorder = true,
}) {
  return Column(
    children: [
      ListTile(
        onTap: onTap,
        leading: Image.asset(
          leadingImg,
          width: Spacing.rem * 1.25,
          height: Spacing.lg * 1.25,
          fit: BoxFit.contain,
        ),
        title: Text(
          title.tr,
          style: Themes.text_base.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Image.asset(
          trailingImg,
          width: Spacing.rem * 1.25,
          height: Spacing.lg * 1.25,
          fit: BoxFit.contain,
        ),
      ),
      whithBorder
          ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.md,
              ),
              child: Divider(
                color: Themes.stroke,
                height: 1,
              ),
            )
          : Container(),
    ],
  );
}

Widget itemLoyalty(
  Function()? onTap,
  String leadingImg,
  String title,
  String trailingImg,
  String point,
) {
  return Column(
    children: [
      ListTile(
        onTap: onTap,
        leading: Image.asset(
          leadingImg,
          width: Spacing.rem * 1.25,
          height: Spacing.lg * 1.25,
          fit: BoxFit.contain,
        ),
        title: Text(
          title.tr,
          style: Themes.text_base.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              point + " point".tr,
              style: Themes.text_sm.copyWith(
                color: Themes.primary,
                fontSize: 10,
              ),
            ),
            Themes.spaceX4,
            Image.asset(
              trailingImg,
              width: Spacing.rem * 1.25,
              height: Spacing.lg * 1.25,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.md,
        ),
        child: Divider(
          color: Themes.stroke,
          height: 1,
        ),
      )
    ],
  );
}

Widget itemNotification(
  String leadingImg,
  String title,
  RxBool isSwitched,
  Function(bool)? onChanged,
) {
  return Column(
    children: [
      ListTile(
        leading: Image.asset(
          leadingImg,
          width: Spacing.rem * 1.25,
          height: Spacing.lg * 1.25,
          fit: BoxFit.contain,
        ),
        title: Text(
          title.tr,
          style: Themes.text_base.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Switch(
          value: isSwitched.value,
          onChanged: onChanged,
          inactiveTrackColor: Themes.stroke,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.md,
        ),
        child: Divider(
          color: Themes.stroke,
          height: 1,
        ),
      )
    ],
  );
}

Widget itemLanguage(
  Function()? onTap,
  String leadingImg,
  String title,
  String trailingImg,
  String name,
) {
  return ListTile(
    onTap: onTap,
    leading: Image.asset(
      leadingImg,
      width: Spacing.rem * 1.25,
      height: Spacing.lg * 1.25,
      fit: BoxFit.contain,
    ),
    title: Text(
      title.tr,
      style: Themes.text_base.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: Themes.text_sm.copyWith(
            color: Themes.primary,
            fontSize: 10,
          ),
        ),
        Themes.spaceX4,
        Image.asset(
          trailingImg,
          width: Spacing.rem * 1.25,
          height: Spacing.lg * 1.25,
          fit: BoxFit.contain,
        ),
      ],
    ),
  );
}
