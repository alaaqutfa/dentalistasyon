import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:flutter/material.dart';

class AppProgress extends StatelessWidget {
  const AppProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        color: Themes.primary,
      ),
    );
  }
}
