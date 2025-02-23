import 'package:dentalistasyon/controller/app/categories.controller.dart';
import 'package:dentalistasyon/view/widgets/app/categories/body.categories.dart';
import 'package:dentalistasyon/view/widgets/partials/nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: defNav(context, 1),
      body: GetBuilder(
        init: CategoriesControllerImp(context: context),
        builder: (controller) => CategoriesBody(),
      ),
    );
  }
}
