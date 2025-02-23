import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermAndPrivacyBody extends StatelessWidget {
  const TermAndPrivacyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Themes.bg,
        padding: Themes.edgeMd,
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            welcomeBox(),
            Themes.spaceY4,
            contentPage(),
          ],
        ),
      ),
    );
  }
}

Widget welcomeBox() {
  return Container(
    decoration: BoxDecoration(
      color: Themes.bg,
      border: Border.all(
        color: Themes.stroke,
      ),
      borderRadius: Themes.borderRadiusMd,
    ),
    padding: Themes.edgeMd,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello 👋".tr,
          style: Themes.title_lg.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        Themes.spaceY4,
        Text(
          "Before you creat an account, please read and accept our Term and Conditiomns"
              .tr,
          style: Themes.text_base.copyWith(
            color: Themes.grayText,
          ),
        ),
      ],
    ),
  );
}

Widget contentPage() {
  return Container(
    color: Themes.bg,
    padding: Themes.edgeMd,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Term and Privacy".tr,
          style: Themes.title_lg,
        ),
        Themes.spaceY4,
        Text(
          "Last update: 20/5/2025".tr,
          style: Themes.text_base.copyWith(
            color: Themes.grayText,
          ),
        ),
        Themes.spaceY8,
        Text(
          "Welcom to ...".tr,
          style: Themes.title_lg,
        ),
        Themes.spaceY4,
        Text(
          "Korem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus."
              .tr,
          style: Themes.text_base,
        ),
      ],
    ),
  );
}
