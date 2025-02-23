import 'package:dentalistasyon/core/localization/setlocale.dart';
import 'package:dentalistasyon/core/localization/translation.dart';
import 'package:dentalistasyon/core/services/services.dart';
import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/data/routes/routes.dart';
import 'package:dentalistasyon/view/screens/splash.dart';
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
      theme: ThemeData(
        fontFamily: "Poppins",
        primaryColor: Themes.primary,
        scaffoldBackgroundColor: Themes.bg,
        badgeTheme: BadgeThemeData(
          backgroundColor: Themes.bg,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Themes.bg,
        ),
      ),
      home: SafeArea(
        child: const Splash(),
      ),
      routes: routes,
    );
  }
}
