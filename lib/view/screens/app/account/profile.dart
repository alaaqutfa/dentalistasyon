import 'package:dentalistasyon/controller/app/account.controller.dart';
import 'package:dentalistasyon/data/model/user.model.dart';
import 'package:dentalistasyon/view/widgets/app/account/body.profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: AccountControllerImp(context: context),
        builder: (controller) => ProfileBody(
          avatar: User.avatar_url ?? "",
          profileKey: controller.profileFormKey,
          workingDays: controller.workingDays,
          notSelectedDays: controller.notSelectedDays,
          onTapWorkingDays: () {
            controller.showWorkingDaysDialog();
          },
        ),
      ),
    );
  }
}
