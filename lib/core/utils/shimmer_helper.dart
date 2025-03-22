import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHelper {

  buildBasicShimmer(
      {double height = double.infinity, double width = double.infinity}) {
    return Shimmer.fromColors(
      baseColor: Themes.text.withOpacity(0.2),
      highlightColor: Themes.text.withOpacity(0.1),
      child: Container(
        height: height,
        width: width,
        color: Themes.bg,
      ),
    );
  }

  buildDefaultShimmer(Widget child) {
    return Shimmer.fromColors(
      baseColor: Themes.text.withOpacity(0.2),
      highlightColor: Themes.text.withOpacity(0.1),
      child: child,
    );
  }

}
