import 'package:dentalistasyon/config/app.config.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static const splash = '/splash';
  static const nointernet = '/nointernet';
  static const onboarding = '/onboarding';
  static const starter = '/starter';
  static const login = '/login';
  static const signup = '/signup';
  static const forgot = '/forgot';
  static const verify = '/verify';
  static const reset = '/reset';
  static const locales = '/locales';
  static const termAndPrivacy = '/term-and-privacy';
  static const home = '/home';
  static const product = '/product/show';
  static const categories = '/categories';
  static const showCategory = '/category/show';
  static const cart = '/cart';
  static const checkout = '/checkout';
  static const orders = '/orders';
  static const showOrder = '/order/show';
  static const addReview = '/review/add';
  static const account = '/account';
  static const profile = '/profile';
  static const points = '/points';
  static const address = '/address';
  static const addAddress = '/address/add';
  static const editAddress = '/address/edit';
  static const security = '/security';
  static const changePassword = '/password/change';
  static const notifications = '/notifications';
  static const chat = '/chat';
  static const favorites = '/favorites';
  static const events = '/events';
}

class AppImg {
  static String src = "assets/images";
  static String src_icons = "assets/icons";
  // * Global Icons
  static String logo = "$src/logo.png";
  static String logo_dark = "$src/dark-logo.png";
  static String nointernet = "$src/nointernet.png";
  static String placeholder = "$src/placeholder.png";
  static String search_icon = "$src_icons/search.png";
  // * Onboarding Icons
  static String onboarding = "$src/onboarding";
  static String onboarding_1 = "$onboarding/1.png";
  static String onboarding_2 = "$onboarding/2.png";
  static String onboarding_3 = "$onboarding/3.png";
  // * Language Icons
  static String language_icon = "$src_icons/language.png";
  static String verify_icon = "$src_icons/verify.png";
  static String unverify_icon = "$src_icons/unverify.png";
  static String en_icon = "$src_icons/en.png";
  static String tr_icon = "$src_icons/tr.png";
  // * Auth Icons
  static String apple_icon = "$src_icons/apple.png";
  static String google_icon = "$src_icons/google.png";
  static String facebook_icon = "$src_icons/facebook.png";
  static String email_icon = "$src_icons/email.png";
  static String lock_icon = "$src_icons/lock.png";
  // * Nav Icons
  static String home_icon = "$src_icons/home.png";
  static String categories_icon = "$src_icons/categories.png";
  static String cart_icon = "$src_icons/cart.png";
  static String orders_icon = "$src_icons/orders.png";
  static String user_icon = "$src_icons/user.png";
  // * Categories Icons
  static String categories = '$src/categories/';
  static String filter_icon = "$src_icons/filter.png";
  // * Products Icons
  static String share_icon = "$src_icons/share.png";
  static String star_icon = "$src_icons/star.png";
  // * Profile Icons
  static String calendar_icon = "$src_icons/calendar.png";
  static String fav_icon = "$src_icons/fav.png";
  static String arrow_right_icon = "$src_icons/arrow-right.png";
  static String points_icon = "$src_icons/points.png";
  static String address_icon = "$src_icons/address.png";
  static String security_icon = "$src_icons/security.png";
  static String payment_icon = "$src_icons/payment.png";
  static String trash_icon = "$src_icons/trash.png";
  static String bell_icon = "$src_icons/bell.png";
  static String term_icon = "$src_icons/term.png";
  static String faq_icon = "$src_icons/faq.png";
  static String contact_icon = "$src_icons/contact.png";
  static String logout_icon = "$src_icons/logout.png";
  static String edit_icon = "$src_icons/edit.png";
  static String select_arrow_icon = "$src_icons/select-arrow.png";

}

class AppColor {
  static const Color primary = Color(0xFF1eb3af); // (لون رئيسي)
  static const Color dentalCyan = Color(0xFF0077B6); // الأزرق الطبي
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
  static const Color iconGray = Color(0xff9DA4AE);
  static const Color whiteGray = Color(0xffF9FAFB);
  static Color shimmerBase = Colors.grey.shade50;
  static Color shimmerHighlighted = Colors.grey.shade200;
}

class Spacing {
  static const double rem = 16.0;
  static const double xs = 0.25 * rem;
  static const double sm = 0.5 * rem;
  static const double md = 1.0 * rem;
  static const double lg = 1.5 * rem;
  static const double xl = 2.0 * rem;
  static const double xxl = 3.0 * rem;
}

class FontSizes {
  static const double xs = 0.5 * Spacing.rem;
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
      desc: desc!.tr,
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
      desc: desc!.tr,
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
      desc: desc!.tr,
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

  static customQuestion(
      BuildContext context,
      String? title,
      String? desc,
      IconData? btnOkIcon,
      Color? btnOkColor,
      Color? btnCancelColor,
      IconData? btnCancelIcon,
      void Function()? btnCancelOnPress,
      void Function()? btnOkOnPress,
      String okText,
      String cancelText,) {
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
      btnOkText: okText.tr,
      btnCancelOnPress: btnCancelOnPress,
      btnCancelColor: btnCancelColor,
      btnCancelIcon: btnCancelIcon,
      btnCancelText: cancelText.tr,
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
      desc: desc!.tr,
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
