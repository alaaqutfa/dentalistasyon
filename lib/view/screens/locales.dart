import 'package:dentalistasyon/core/localization/setlocale.dart';
import 'package:dentalistasyon/view/widgets/locales/body.dart';
import 'package:dentalistasyon/view/widgets/partials/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Locales extends StatelessWidget {
  const Locales({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defAppBar("Languages", false),
        body: SafeArea(
          child: GetBuilder(
            init: SetlocaleController(),
            builder: (controller) => LocalesBody(
              currentLocale: controller.currentLocale!,
              onTapEn: () {
                controller.setLocale("en");
              },
              onTapTr: () {
                controller.setLocale("tr");
              },
            ),
          ),
        ));
  }
}
