import 'package:dentalistasyon/controller/app/categories.controller.dart';
import 'package:dentalistasyon/view/widgets/app/categories/body.show.category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowCategory extends StatelessWidget {
  const ShowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: CategoriesControllerImp(context: context),
        builder: (controller) => ShowCategoryBody(),
      ),
    );
  }
}
