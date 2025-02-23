import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AccountController extends GetxController {
  //* Variables :
  bool ready = false;

  //* Functions :
}

class AccountControllerImp extends AccountController {
  final BuildContext context;
  AccountControllerImp({required this.context});
}
