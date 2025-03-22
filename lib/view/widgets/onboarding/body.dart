import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/widgets/onboarding/pagebody.dart';
import 'package:dentalistasyon/view/widgets/onboarding/pageimage.dart';
import 'package:dentalistasyon/view/widgets/partials/language.btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OnboardingBody extends StatelessWidget {
  final String version;
  final Function? onFinish;
  final Function? trailingFunction;
  final Function()? leadingFunction;
  const OnboardingBody({
    super.key,
    required this.version,
    this.onFinish,
    this.trailingFunction,
    this.leadingFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Themes.bg,
      child: OnBoardingSlider(
        controllerColor: Themes.primary,
        headerBackgroundColor: Themes.bg,
        pageBackgroundColor: Themes.bg,
        centerBackground: true,
        totalPage: 3,
        speed: 1.8,
        indicatorAbove: true,
        finishButtonText: "Get Started".tr,
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Themes.primary,
        ),
        onFinish: onFinish,
        skipTextButton: Text(
          "Skip".tr,
          style: Themes.text_base,
        ),
        leading: langBtn(),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Login".tr,
              style: Themes.text_base.copyWith(color: Themes.primary),
            ),
            Themes.spaceX8,
            FaIcon(
              FontAwesomeIcons.rightToBracket,
              size: 20,
              color: Themes.primary,
            ),
          ],
        ),
        trailingFunction: trailingFunction,
        middle: Text(
          "v$version",
          style: Themes.text_sm.copyWith(
            color: Themes.text.withOpacity(0.5),
            fontWeight: FontWeight.w800,
          ),
        ),
        background: [
          PageImage(
            imagePath: AppImg.onboarding_1,
          ),
          PageImage(
            imagePath: AppImg.onboarding_2,
          ),
          PageImage(
            imagePath: AppImg.onboarding_3,
          ),
        ],
        pageBodies: [
          PageBody(
            icon: "🦷",
            title: "Discover Top-Quality Dental Supplies".tr,
            description:
                "Welcome to Dentali Stasyon! Your one-stop shop for high-quality dental supplies."
                    .tr,
          ),
          PageBody(
            icon: "🛒",
            title: "Shop Easily from Trusted Suppliers".tr,
            description:
                "Browse and buy dental supplies directly from trusted stores and warehouses."
                    .tr,
          ),
          PageBody(
            icon: "🚚",
            title: "Fast & Secure Delivery to Your Door".tr,
            description:
                "Enjoy a seamless shopping experience with secure payments and fast delivery."
                    .tr,
          ),
        ],
      ),
    );
  }
}
