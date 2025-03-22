import 'package:dentalistasyon/controller/app/account.controller.dart';
import 'package:dentalistasyon/data/model/user.model.dart';
import 'package:dentalistasyon/view/widgets/app/account/body.account.dart';
import 'package:dentalistasyon/view/widgets/partials/nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: defNav(context, 4),
      body: GetBuilder(
        init: AccountControllerImp(context: context),
        builder: (controller) => AccountBody(
          avatar: User.avatar_url ?? "",
          name: User.name,
          email: User.email,
          isSwitched: controller.notificationsSwitch,
          point: "22",
          langName: controller.services.shared.getString("lang")!.toUpperCase(),
          onTapLogout: () {},
        ),
      ),
    );
  }
}
