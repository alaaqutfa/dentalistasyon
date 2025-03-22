import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:flutter/material.dart';

class AppRefreshPage extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget? child;
  final ScrollController? controller;

  const AppRefreshPage({super.key, required this.onRefresh, this.child, this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: onRefresh,
        color: Themes.primary,
        backgroundColor: Themes.bg,
        child: CustomScrollView(
          controller: controller ?? ScrollController(),
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: child ?? SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
