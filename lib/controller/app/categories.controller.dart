import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CategoriesController extends GetxController {
  //* Variables :
  bool ready = false;

  //* Functions :
}

class CategoriesControllerImp extends CategoriesController {
  final BuildContext context;
  CategoriesControllerImp({required this.context});
}
