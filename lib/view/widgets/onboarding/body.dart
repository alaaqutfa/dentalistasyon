import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/widgets/onboarding/pagebody.dart';
import 'package:dentalistasyon/view/widgets/onboarding/pageimage.dart';
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
        leading: InkWell(
          onTap: leadingFunction,
          child: SizedBox(
            width: Spacing.lg,
            height: Spacing.lg,
            child: Image.asset(
              AppImg.language_icon,
              color: Themes.primary,
              fit: BoxFit.contain,
            ),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Login".tr,
              style: Themes.text_base,
            ),
            Themes.spaceX8,
            FaIcon(
              FontAwesomeIcons.rightToBracket,
              size: 20,
              color: Themes.text,
            ),
          ],
        ),
        trailingFunction: trailingFunction,
        middle: Text(
          "v$version",
          style: Themes.text_sm.copyWith(
            color: Themes.text.withOpacity(0.5),
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
            title: "Fast and Secure Supply".tr,
            description:
                "Easily connect medical supply warehouses with hospitals and doctors."
                    .tr,
          ),
          PageBody(
            title: "Easy Order Management".tr,
            description:
                "Quickly find and order the medical products you need.".tr,
          ),
          PageBody(
            title: "Reliable and Efficient Service".tr,
            description:
                "We provide seamless supply solutions for the healthcare sector."
                    .tr,
          ),
        ],
      ),
    );
  }
}
