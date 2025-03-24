import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/widgets/partials/progress.dart';
import 'package:flutter/material.dart';

Widget AppNetworkImg(String url, {double? width, double? height, BoxFit? fit,BoxFit? assetFit}) {
  return url != "" && url.isNotEmpty
      ? Image.network(
          url,
          width: width,
          height: height,
          fit: fit,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: AppProgress(),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Center(
              child: Image.asset(
                AppImg.placeholder,
                width: width,
                height: height,
                fit: assetFit,
              ),
            );
          },
        )
      : Image.asset(
          AppImg.placeholder,
          width: width,
          height: height,
          fit: assetFit,
        );
}
