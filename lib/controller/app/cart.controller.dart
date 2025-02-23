import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  //* Variables :
  bool ready = false;

  //* Functions :
}

class CartControllerImp extends CartController {
  final BuildContext context;
  CartControllerImp({required this.context});
}
