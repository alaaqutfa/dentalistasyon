import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/data/model/nav.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget? defNav(BuildContext context, int selectedIndex) {
  return Stack(
    alignment: AlignmentDirectional.topCenter,
    clipBehavior: Clip.none,
    children: [
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          Get.offNamed(navPages[index]);
        },
        backgroundColor: Themes.bg,
        selectedItemColor: Themes.primary,
        unselectedItemColor: Themes.grayText,
        selectedLabelStyle: Themes.text_base,
        unselectedLabelStyle: Themes.text_sm,
        showUnselectedLabels: true,
        iconSize: Spacing.lg,
        items: [
          bottomNavigationBarItem(0, selectedIndex, AppImg.home_icon, "Home"),
          bottomNavigationBarItem(
              1, selectedIndex, AppImg.categories_icon, "Categories"),
          bottomNavigationBarItem(2, selectedIndex, AppImg.cart_icon, "Cart"),
          bottomNavigationBarItem(
              3, selectedIndex, AppImg.orders_icon, "Orders"),
          bottomNavigationBarItem(
              4, selectedIndex, AppImg.user_icon, "Profile"),
        ],
      ),
      Positioned(
        top: -8,
        left: MediaQuery.of(context).size.width / 5 * selectedIndex + 31,
        child: CustomPaint(
          painter: CurvePainter(),
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Themes.primary,
          ),
        ),
      ),
    ],
  );
}

BottomNavigationBarItem bottomNavigationBarItem(
    int index, int currentIndex, String icon, String label) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      child: Image.asset(
        icon,
        color: index == currentIndex ? Themes.primary : Themes.grayText,
        height: Spacing.rem * 1.25,
      ),
    ),
    label: label.tr,
  );
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Themes.bg.withOpacity(0)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvePainter oldDelegate) => false;
}
