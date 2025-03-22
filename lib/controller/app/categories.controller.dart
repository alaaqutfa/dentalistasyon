import 'package:dentalistasyon/core/services/services.dart';
import 'package:dentalistasyon/data/model/categories.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CategoriesController extends GetxController {
  //* Variables :
  Services services = Get.find();
  late String lang;
  bool ready = false;
  Rx<List<Map<String, dynamic>>?> selectedCategories = categories["tr"].obs;
  RxInt selectedIndex = 0.obs;

  //* Functions :
  void selectCategory(int index);
}

class CategoriesControllerImp extends CategoriesController {
  final BuildContext context;
  CategoriesControllerImp({required this.context});

  @override
  void onInit() {
    super.onInit();
    lang = services.shared.getString("lang") ?? "tr";
    selectedCategories = categories[lang].obs;
    update();
  }

  @override
  void selectCategory(int index) {
    selectedIndex.value = index;
  }
}
