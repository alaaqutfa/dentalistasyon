import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  //* Variables :
  bool ready = false;
  var data = Get.arguments;

  //* Functions :
}

class HomeControllerImp extends HomeController {
  final BuildContext context;
  HomeControllerImp({required this.context});

  @override
  void onInit() async {
    super.onInit();
    // clear console
    print("\x1B[2J\x1B[0;0H");
    print(data);
  }
}
