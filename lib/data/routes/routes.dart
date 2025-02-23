import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/screens/app/account.dart';
import 'package:dentalistasyon/view/screens/app/cart.dart';
import 'package:dentalistasyon/view/screens/app/categories.dart';
import 'package:dentalistasyon/view/screens/app/orders.dart';
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
import 'package:dentalistasyon/view/screens/termAndPrivacy.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.nointernet: (context) => const NoInternet(),
  AppRoutes.onboarding: (context) => const Onboarding(),
  AppRoutes.starter: (context) => const Starter(),
  AppRoutes.login: (context) => const Login(),
  AppRoutes.signup: (context) => const Signup(),
  AppRoutes.forgot: (context) => const Forgot(),
  AppRoutes.verify: (context) => const Verify(),
  AppRoutes.reset: (context) => const Reset(),
  AppRoutes.locales: (context) => const Locales(),
  AppRoutes.termAndPrivacy: (context) => const TermAndPrivacy(),
  AppRoutes.home: (context) => const Home(),
  AppRoutes.categories: (context) => const Categories(),
  AppRoutes.cart: (context) => const Cart(),
  AppRoutes.orders: (context) => const Orders(),
  AppRoutes.account: (context) => const Account(),
};
