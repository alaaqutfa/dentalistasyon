import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/widgets/partials/progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashBody extends StatelessWidget {
  final String version;
  const SplashBody({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Themes.light,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // الشعار
          Image.asset(
            AppImg.appicon,
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 4,
          ),
          Themes.spaceY16,
          // اسم التطبيق
          Text(
            "Dentalistasyon".tr,
            style: Themes.title_2xl,
          ),
          Themes.spaceY16,
          // الأصدار
          Text(
            version,
            style: Themes.text_base.copyWith(
              color: Themes.text,
            ),
          ),
          Themes.spaceY16,
          AppProgress(),
        ],
      ),
    );
  }
}
