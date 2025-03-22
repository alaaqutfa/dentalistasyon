import 'package:dentalistasyon/core/services/services.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/profile.model.dart';
import 'package:dentalistasyon/view/widgets/partials/appDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AccountController extends GetxController {
  //* Variables :
  Services services = Get.find();
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {};
  bool ready = false;
  RxBool notificationsSwitch = false.obs;
  Map<String, RxBool> workingDays = {
    "Saturday": false.obs,
    "Sunday": false.obs,
    "Monday": false.obs,
    "Tuesday": false.obs,
    "Wednesday": false.obs,
    "Thursday": false.obs,
    "Friday": false.obs,
  };
  bool notSelectedDays = true;
  //* Functions :
  Future create();
  Future updateProfile();
  bool checkWorkingDays();
  showWorkingDaysDialog();
}

class AccountControllerImp extends AccountController {
  final BuildContext context;
  AccountControllerImp({required this.context});

  @override
  void onInit() async {
    super.onInit();
    await create();
  }

  // ✅ دالة لعرض النافذة المنبثقة باستخدام Get.dialog
  @override
  void showWorkingDaysDialog() {
    Get.dialog(defAlertDialogWorkingDays(
      () {
        notSelectedDays = checkWorkingDays();
        update();
        Get.back();
      },
      workingDays,
    ));
  }

  @override
  bool checkWorkingDays() {
    for (var day in workingDays.keys) {
      if (workingDays[day]!.value == true) {
        return false;
      }
    }
    return true;
  }

  @override
  Future create() async {
    insertControllers(controllers, profileFields);
    for (var field in profileFields) {
      controllers[field["label"]]!.text = field["initialValue"];
    }
    notSelectedDays = checkWorkingDays();
    ready = true;
    update();
  }

  @override
  Future updateProfile() async {}
}
