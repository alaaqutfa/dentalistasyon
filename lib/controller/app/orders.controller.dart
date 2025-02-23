import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersController extends GetxController {
  //* Variables :
  bool ready = false;

  //* Functions :
}

class OrdersControllerImp extends OrdersController {
  final BuildContext context;
  OrdersControllerImp({required this.context});
}
