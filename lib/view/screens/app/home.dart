import 'package:dentalistasyon/controller/app/home.controller.dart';
import 'package:dentalistasyon/view/widgets/app/home/body.home.dart';
import 'package:dentalistasyon/view/widgets/partials/nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: defNav(context, 0),
      body: GetBuilder(
        init: HomeControllerImp(context: context),
        builder: (controller) => HomeBody(),
      ),
    );
  }
}
