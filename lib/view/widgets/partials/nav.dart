import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/data/model/nav.model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          buildNavItem(FontAwesomeIcons.house, "Home", 0),
          buildNavItem(FontAwesomeIcons.table, "Categories", 1),
          buildNavItem(FontAwesomeIcons.cartShopping, "Cart", 2),
          buildNavItem(FontAwesomeIcons.box, "Orders", 3),
          buildNavItem(FontAwesomeIcons.user, "Profile", 4),
        ],
      ),
      Positioned(
        top: -23,
        left: MediaQuery.of(context).size.width / 5 * selectedIndex + 26,
        child: CustomPaint(
          painter: CurvePainter(),
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Themes.bg,
            foregroundColor: Themes.bg,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Themes.primary,
            ),
          ),
        ),
      ),
    ],
  );
}

BottomNavigationBarItem buildNavItem(IconData icon, String label, int index) {
  return BottomNavigationBarItem(
    icon: FaIcon(
      icon,
    ),
    label: label,
    tooltip: label,
  );
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Themes.bg
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvePainter oldDelegate) => false;
}
