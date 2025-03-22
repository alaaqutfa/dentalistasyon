import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/widgets/app/account/partials/sections.dart';
import 'package:dentalistasyon/view/widgets/app/account/partials/top.account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountBody extends StatelessWidget {
  final String avatar;
  final String name;
  final String email;
  final String point;
  final String langName;
  final RxBool isSwitched;
  final Function()? onTapDelete;
  final Function()? onTapLogout;
  const AccountBody({
    super.key,
    required this.avatar,
    required this.name,
    required this.email,
    required this.isSwitched,
    this.onTapLogout,
    required this.point,
    required this.langName,
    this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Themes.light,
        padding: Themes.edgeMd,
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Themes.spaceY16,
            Text(
              "Profile".tr,
              style: Themes.title_2xl,
            ),
            Themes.spaceY16,
            avatarAccountSide(avatar, name, email),
            Themes.spaceY16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                accountIconBtn(
                  MediaQuery.of(context).size.width / 2 - 25,
                  Themes.whiteGray,
                  () {},
                  AppImg.calendar_icon,
                  "Events",
                ),
                Themes.spaceX8,
                accountIconBtn(
                  MediaQuery.of(context).size.width / 2 - 25,
                  Themes.whiteGray,
                  () {},
                  AppImg.fav_icon,
                  "Favorites",
                ),
                Themes.spaceX8,
              ],
            ),
            Themes.spaceY16,
            accountSection(
              onTapProfile: () {
                Get.toNamed(AppRoutes.profile);
              },
              onTapLoyalty: () {
                Get.toNamed(AppRoutes.points);
              },
              point: point,
              onTapAddress: () {},
              onTapSecurity: () {},
              onTapPayment: () {},
              onTapDelete: () {
                AppDialog.warning(
                  context,
                  "Are you sure you want to delete your account?",
                  () {},
                  onTapDelete,
                );
              },
            ),
            Themes.spaceY16,
            settingsSection(
              onTapLanguage: () {
                Get.toNamed(AppRoutes.locales);
              },
              langName: langName,
              isSwitched: isSwitched,
            ),
            Themes.spaceY16,
            supportSection(
              onTapTerm: () {
                Get.toNamed(AppRoutes.termAndPrivacy);
              },
              onTapFAQ: () {},
              onTapContact: () {},
            ),
            Themes.spaceY16,
            logoutSection(
              onTapLogout: () {
                AppDialog.warning(
                  context,
                  "Are you sure you want to log out?",
                  () {},
                  onTapLogout,
                );
              },
            ),
            Themes.spaceY16,
          ],
        ),
      ),
    );
  }
}
