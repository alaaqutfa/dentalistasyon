import 'package:dentalistasyon/controller/app/address.controller.dart';
import 'package:dentalistasyon/view/widgets/app/account/address/body.address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: AddressControllerImp(context: context),
        builder: (controller) => AddressBody(),
      ),
    );
  }
}
