import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressController extends GetxController {}

class AddressControllerImp extends AddressController {
  final BuildContext context;
  AddressControllerImp({required this.context});
}
