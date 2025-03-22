import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/view/widgets/partials/appBtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget successDialogMsg(String msg) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: Themes.borderRadiusSm,
    ),
    title: Text(
      msg.tr,
      style: Themes.text_base.copyWith(
        color: Themes.success,
      ),
    ),
  );
}

Widget defAlertDialogWorkingDays(
    void Function()? onPressed, Map<String, RxBool> workingDays) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: Themes.borderRadiusSm,
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Working days".tr,
          style: Themes.text_base.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: onPressed,
        ),
      ],
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: workingDays.keys.map((day) {
        return Obx(
          () => CheckboxListTile(
            title: Text(
              day.tr,
              style: Themes.text_base.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            value: workingDays[day]!.value,
            onChanged: (bool? value) {
              workingDays[day]!.value = value!;
            },
            activeColor: Themes.primary,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        );
      }).toList(),
    ),
    actions: [
      defBtn(double.infinity, Themes.primary, onPressed, "Continue", true),
    ],
  );
}
