import 'package:dentalistasyon/config/app.config.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String nointernet = "nointernet/";
  static String onboarding = "onboarding/";
  static String starter = "auth/starter/";
  static String locales = "locales/";
  static String login = "login/";
  static String signup = "signup/";
  static String forgot = "forgot/";
  static String verify = "verify/";
  static String reset = "reset/";
  static String home = "home/";
  static String categories = "categories/";
  static String cart = "cart/";
  static String orders = "orders/";
  static String account = "account/";
  static String termAndPrivacy = "termAndPrivacy/";
}

class AppImg {
  static String src = "assets/images";
  static String src_icons = "assets/icons";
  static String appicon = "$src/app_icon.png";
  static String nointernet = "$src/nointernet.png";
  static String placeholder = "$src/placeholder.png";
  static String onboarding = "$src/onboarding";
  static String onboarding_1 = "$onboarding/1.png";
  static String onboarding_2 = "$onboarding/2.png";
  static String onboarding_3 = "$onboarding/3.png";
  static String car_icon = "$src_icons/car.png";
  static String products_icon = "$src_icons/products.png";
  static String rating_icon = "$src_icons/rating.png";
  static String orders_icon = "$src_icons/orders.png";
  static String sales_icon = "$src_icons/sales.png";
  static String verify_icon = "$src_icons/verify.png";
  static String unverify_icon = "$src_icons/unverify.png";
  static String shop_setting_icon = "$src_icons/shop_setting.png";
  static String payment_setting_icon = "$src_icons/payment_setting.png";
  static String dashboard_icon = "$src_icons/dashboard.png";
  static String account_icon = "$src_icons/account.png";
  static String language_icon = "$src_icons/language.png";
  static String en_icon = "$src_icons/en.png";
  static String tr_icon = "$src_icons/tr.png";
  static String apple_icon = "$src_icons/apple.png";
  static String google_icon = "$src_icons/google.png";
  static String facebook_icon = "$src_icons/facebook.png";
  static String email_icon = "$src_icons/email.png";
  static String lock_icon = "$src_icons/lock.png";
}

class AppColor {
  static const Color primary = Color(0xFF0077B6); // الأزرق الطبي (لون رئيسي)
  static const Color backgroundWhite =
      Color(0xFFF8F9FA); // الأبيض النقي (لون الخلفية)
  static const Color accentCyan =
      Color(0xFF48CAE4); // السماوي الهادئ (لون ثانوي)
  static const Color healthGreen = Color(0xFF38B000); // الأخضر الصحي (لون مميز)
  static const Color lightGray =
      Color(0xFFE9ECEF); // الرمادي الفاتح (لون محايد)
  static const Color darkBlue =
      Color(0xFF023E8A); // الأزرق الداكن (لون للنصوص أو الأزرار)
  static const Color textDark = Color(0xff222222);
  static const Color dark = Color(0xff4D4D4D);
  static const Color light = Color(0xffFFFFFF);
  static const Color success = Color(0xFF38B000);
  static const Color error = Colors.red;
  static const Color link = Color(0xff106ebe);
  static const Color stroke = Color(0xffE5E7EB);
  static const Color grayText = Color(0xff6C737F);
  static Color shimmerBase = Colors.grey.shade50;
  static Color shimmerHighlighted = Colors.grey.shade200;
}

class Spacing {
  static const double rem = 16.0;
  static const double sm = 0.5 * rem;
  static const double md = 1.0 * rem;
  static const double lg = 1.5 * rem;
  static const double xl = 2.0 * rem;
  static const double xxl = 3.0 * rem;
}

class FontSizes {
  static const double sm = 0.875 * Spacing.rem;
  static const double base = 1.0 * Spacing.rem;
  static const double lg = 1.125 * Spacing.rem;
  static const double xl = 1.25 * Spacing.rem;
  static const double xxl = 1.5 * Spacing.rem;
}

class AppDialog {
  static error(
      BuildContext context, String? desc, void Function()? btnOkOnPress) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      headerAnimationLoop: false,
      title: "Error".tr,
      desc: desc,
      btnOkOnPress: btnOkOnPress,
      btnOkIcon: Icons.cancel,
      btnOkColor: Colors.red,
      btnOkText: "Ok".tr,
      dismissOnTouchOutside: false,
    ).show();
  }

  static success(
      BuildContext context, String? desc, void Function()? btnOkOnPress) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      headerAnimationLoop: false,
      title: "Success".tr,
      desc: desc,
      btnOkOnPress: btnOkOnPress,
      btnOkIcon: Icons.cancel,
      btnOkColor: AppColor.success,
      btnOkText: "Ok".tr,
      dismissOnTouchOutside: false,
    ).show();
  }

  static warning(BuildContext context, String? desc,
      void Function()? btnCancelOnPress, void Function()? btnOkOnPress) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      closeIcon: const Icon(Icons.close_fullscreen_outlined),
      title: 'Warning'.tr,
      desc: desc,
      btnCancelOnPress: btnCancelOnPress,
      onDismissCallback: (type) {},
      dismissOnTouchOutside: false,
      btnOkOnPress: btnOkOnPress,
    ).show();
  }

  static question(
      BuildContext context,
      String? title,
      String? desc,
      IconData? btnOkIcon,
      Color? btnOkColor,
      Color? btnCancelColor,
      IconData? btnCancelIcon,
      void Function()? btnCancelOnPress,
      void Function()? btnOkOnPress) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.rightSlide,
      headerAnimationLoop: true,
      title: title!.tr,
      desc: desc!.tr,
      btnOkOnPress: btnOkOnPress,
      btnOkColor: btnOkColor,
      btnOkIcon: btnOkIcon,
      btnOkText: "Ok".tr,
      btnCancelOnPress: btnCancelOnPress,
      btnCancelColor: btnCancelColor,
      btnCancelIcon: btnCancelIcon,
      btnCancelText: "Cancel".tr,
      dismissOnTouchOutside: false,
    ).show();
  }

  static info(
    BuildContext context,
    String? title,
    String? desc,
    void Function()? btnCancelOnPress,
    void Function()? btnOkOnPress,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      borderSide: const BorderSide(
        color: AppColor.primary,
        width: 2,
      ),
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      animType: AnimType.bottomSlide,
      title: title,
      desc: desc,
      btnCancelOnPress: btnCancelOnPress,
      btnOkOnPress: btnOkOnPress,
    ).show();
  }
}

class AppLink {
  static String terms = "${AppConfig.defUrl}/terms";
  static String sellerpolicy = "${AppConfig.defUrl}/seller-policy";
  static String returnpolicy = "${AppConfig.defUrl}/return-policy";
  static String supportpolicy = "${AppConfig.defUrl}/support-policy";
  static String privacypolicy = "${AppConfig.defUrl}/privacy-policy";
}
