import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetBody extends StatelessWidget {
  final Function()? onTap;
  const NoInternetBody({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Container(
        color: Themes.light,
        padding: Themes.edgeMd,
        alignment: Alignment.center,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            // صورة "No Internet"
            SizedBox(
              width: MediaQuery.of(context).size.width - 200,
              child: Image.asset(
                AppImg.nointernet,
                width: MediaQuery.of(context).size.width - 200,
                fit: BoxFit.contain,
              ),
            ),
            Themes.spaceY32,
            // نص العنوان
            Container(
              alignment: Alignment.center,
              child: Text(
                "No Internet Connection".tr,
                style: Themes.title_2xl,
                textAlign: TextAlign.center,
              ),
            ),
            Themes.spaceY16,
            // زر المحاولة مرة أخرى
            Center(
              child: InkWell(
                onTap: onTap,
                borderRadius: Themes.borderRadiusSm,
                splashColor: Themes.light.withOpacity(0.3),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2, // العرض المحدد
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Themes.primary,
                    borderRadius: Themes.borderRadiusSm,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    "Try again!".tr,
                    style: TextStyle(
                      color: Themes.light,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
