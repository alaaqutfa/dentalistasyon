import 'package:dentalistasyon/core/services/services.dart';
import 'package:get/get.dart';
// import 'package:themed/themed.dart';

class ThemeController extends GetxController {
  Services service = Get.find();
  bool isDarkMode = false;
  String family = "Poppins";

  @override
  void onInit() {
    super.onInit();
    isDarkMode = service.shared.getBool("dark") ?? false;
    if (isDarkMode) {
      // Themed.currentTheme = darkTheme;
    } else {
      // Themed.currentTheme = lightTheme;
    }
  }

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      // Themed.currentTheme = darkTheme;
    } else {
      // Themed.currentTheme = lightTheme;
    }
    // service.shared.setBool("dark", isDarkMode);
    update();
  }
}
