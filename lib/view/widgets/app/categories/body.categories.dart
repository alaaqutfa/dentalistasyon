import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/widgets/partials/refreshpage.dart';
import 'package:dentalistasyon/view/widgets/partials/search.home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesBody extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final TextEditingController? searchController;
  final dynamic Function(String)? searchOnChanged;
  final String? Function(String?)? searchValidator;

  const CategoriesBody({
    super.key,
    required this.onRefresh,
    this.searchController,
    this.searchOnChanged,
    this.searchValidator,
  });

  @override
  Widget build(BuildContext context) {
    return AppRefreshPage(
      onRefresh: onRefresh,
      controller: ScrollController(),
      child: Container(
        color: Themes.bg,
        padding: Themes.edgeMd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Themes.spaceY16,
            Text(
              "Categories".tr,
              style: Themes.title_xl,
            ),
            Themes.spaceY16,
            Row(
              children: [
                Expanded(
                  // Wrap searchBox in Expanded
                  child: searchBox(
                    searchController: searchController,
                    searchOnChanged: searchOnChanged,
                    searchValidator: searchValidator,
                  ),
                ),
                Themes.spaceX8,
                InkWell(
                  child: Container(
                    width: Spacing.xxl,
                    height: Spacing.xxl,
                    decoration: BoxDecoration(
                      color: Themes.light,
                      borderRadius: Themes.borderRadiusSm,
                    ),
                    child: Image.asset(
                      AppImg.filter_icon,
                      color: Themes.primary,
                    ),
                  ),
                ),
              ],
            ),
            Themes.spaceY16,
          ],
        ),
      ),
    );
  }
}
