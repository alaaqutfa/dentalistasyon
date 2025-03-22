import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/screens/app/account/account.dart';
import 'package:dentalistasyon/view/screens/app/account/address/add.address.dart';
import 'package:dentalistasyon/view/screens/app/account/address/address.dart';
import 'package:dentalistasyon/view/screens/app/account/address/edit.address.dart';
import 'package:dentalistasyon/view/screens/app/account/loyalty.points/loyalty.points.dart';
import 'package:dentalistasyon/view/screens/app/account/security/change.password.dart';
import 'package:dentalistasyon/view/screens/app/account/security/security.dart';
import 'package:dentalistasyon/view/screens/app/cart/cart.dart';
import 'package:dentalistasyon/view/screens/app/cart/checkout.dart';
import 'package:dentalistasyon/view/screens/app/categories/categories.dart';
import 'package:dentalistasyon/view/screens/app/categories/show.category.dart';
import 'package:dentalistasyon/view/screens/app/chat.dart';
import 'package:dentalistasyon/view/screens/app/events.dart';
import 'package:dentalistasyon/view/screens/app/notifications.dart';
import 'package:dentalistasyon/view/screens/app/orders/add.review.dart';
import 'package:dentalistasyon/view/screens/app/orders/orders.dart';
import 'package:dentalistasyon/view/screens/app/account/profile.dart';
import 'package:dentalistasyon/view/screens/app/orders/show.orders.dart';
import 'package:dentalistasyon/view/screens/app/products/favorites.dart';
import 'package:dentalistasyon/view/screens/app/products/product.dart';
import 'package:dentalistasyon/view/screens/auth/forgot.dart';
import 'package:dentalistasyon/view/screens/auth/login.dart';
import 'package:dentalistasyon/view/screens/auth/reset.dart';
import 'package:dentalistasyon/view/screens/auth/signup.dart';
import 'package:dentalistasyon/view/screens/auth/starter.dart';
import 'package:dentalistasyon/view/screens/auth/verify.dart';
import 'package:dentalistasyon/view/screens/app/home.dart';
import 'package:dentalistasyon/view/screens/locales.dart';
import 'package:dentalistasyon/view/screens/nointernet.dart';
import 'package:dentalistasyon/view/screens/onboarding.dart';
import 'package:dentalistasyon/view/screens/splash.dart';
import 'package:dentalistasyon/view/screens/termAndPrivacy.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => Splash(),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.nointernet,
      page: () => const NoInternet(),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const Onboarding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.starter,
      page: () => const Starter(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const Login(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const Signup(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: AppRoutes.forgot,
      page: () => const Forgot(),
      transition: Transition.leftToRight,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.verify,
      page: () => const Verify(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: AppRoutes.reset,
      page: () => const Reset(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.locales,
      page: () => const Locales(),
      transition: Transition.size,
    ),
    GetPage(
      name: AppRoutes.termAndPrivacy,
      page: () => const TermAndPrivacy(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const Home(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.product,
      page: () => const Product(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.categories,
      page: () => const Categories(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.showCategory,
      page: () => const ShowCategory(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const Cart(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.checkout,
      page: () => const Checkout(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.orders,
      page: () => const Orders(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.showOrder,
      page: () => const ShowOrder(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.addReview,
      page: () => const AddReview(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.account,
      page: () => const Account(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const Profile(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.points,
      page: () => const LoyaltyPointss(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.address,
      page: () => const Address(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.addAddress,
      page: () => const AddAddress(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.editAddress,
      page: () => const EditAddress(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.security,
      page: () => const Security(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePassword(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const Notifications(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const Chat(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.favorites,
      page: () => const Favorites(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.events,
      page: () => const Events(),
      transition: Transition.fade,
    ),
  ];
}
