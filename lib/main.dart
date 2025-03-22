import 'package:dentalistasyon/core/localization/setlocale.dart';
import 'package:dentalistasyon/core/localization/translation.dart';
import 'package:dentalistasyon/core/services/services.dart';
import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/data/routes/routes.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  Get.put<Services>(Services());
  Get.put<SetlocaleController>(SetlocaleController());
  runApp(const Dentalistasyon());
}

class Dentalistasyon extends StatelessWidget {
  const Dentalistasyon({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dentalistasyon',
      translations: Languages(),
      locale: Get.find<SetlocaleController>().language,
      color: Themes.primary,
      theme: ThemeData(
        fontFamily: "Poppins",
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return Themes.stroke;
            }
            return Themes.primary;
          }),
          thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
            return Themes.light;
          }),
          trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
          trackOutlineWidth:
              MaterialStateProperty.resolveWith<double>((states) {
            return 0;
          }),
        ),
        primaryColor: Themes.primary,
        scaffoldBackgroundColor: Themes.bg,
        badgeTheme: BadgeThemeData(
          backgroundColor: Themes.bg,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Themes.bg,
        ),
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
    );
  }
}
