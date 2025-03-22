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
  final Rx<List<Map<String, dynamic>>?> selectedCategories;

  const CategoriesBody(
      {super.key,
      required this.onRefresh,
      this.searchController,
      this.searchOnChanged,
      this.searchValidator,
      required this.selectedCategories});

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
            buildCategories(
              categories: [{"name":""}].obs,
              selectCategory: (index) {},
              selectedIndex: 0.obs,
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}

Widget mainCategory(Map<String, dynamic> category) {
  return SizedBox(
    width: 120,
    height: 120,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImg.categories + category["name"] + ".png",
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.image_not_supported, size: 60, color: Colors.grey),
        ),
        Themes.spaceY16,
        Text(
          category["name"],
          textAlign: TextAlign.center,
          style: Themes.title_lg.copyWith(fontSize: Spacing.lg),
        ),
      ],
    ),
  );
}

Widget buildCategories(
    {int? itemCount,
    required RxInt selectedIndex,
    required Function(int index) selectCategory,
    required RxList<Map<String, dynamic>> categories}) {
  return Row(
    children: [
      // العمود الأيسر: الفئات الرئيسية
      Expanded(
        flex: 2,
        child: Obx(() => ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex.value == index;
                return GestureDetector(
                  onTap: () {
                    selectCategory(index);
                  },
                  child: Container(
                    margin: Themes.edgeSm,
                    padding: Themes.edgeMd,
                    decoration: BoxDecoration(
                      color:
                          isSelected ? Themes.light : Themes.shimmerHighlighted,
                      borderRadius: Themes.borderRadiusSm,
                      border: Border.all(
                        color: isSelected ? Themes.primary : Themes.stroke,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          AppImg.categories +
                              categories[index]["name"] +
                              ".png",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.image_not_supported,
                              size: 60,
                              color: Colors.grey),
                        ),
                        Themes.spaceY8,
                        Text(
                          categories[index]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Themes.primary : Themes.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
      ),

      // العمود الأيمن: الفئات الفرعية
      Expanded(
        flex: 3,
        child: Obx(() {
          var selectedCategory = categories[selectedIndex.value];
          var subcategories = selectedCategory['children'] as List<dynamic>;

          return subcategories.isEmpty
              ? Center(child: Text("No Subcategories"))
              : ListView.builder(
                  itemCount: subcategories.length,
                  itemBuilder: (context, index) {
                    var subcategory = subcategories[index];
                    bool hasChildren = subcategory.containsKey('children');

                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(subcategory['name']),
                        trailing: hasChildren
                            ? Icon(Icons.add)
                            : Icon(Icons.arrow_forward),
                        onTap: () {
                          print("Clicked on ${subcategory['name']}");
                        },
                      ),
                    );
                  },
                );
        }),
      ),
    ],
  );
}
