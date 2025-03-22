import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/view/widgets/partials/appBtn.dart';
import 'package:dentalistasyon/view/widgets/partials/fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget authForm(
  Key? key,
  List<Map<String, dynamic>> fields,
  RxBool isObscured,
  var isChecked,
  bool isloginpage,
  Function()? onTapPrimaryBtn,
  Function()? onTapGuestBtn,
  Map<String, TextEditingController> controllers,
) {
  return Form(
    key: key, // Define this in your state
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...fields.map(
          (field) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.sm,
              ),
              child: Column(
                children: [
                  Themes.spaceY16,
                  !field['isObscured']
                      ? InputField(
                          labelText: field['label'],
                          hasLabel: true,
                          hintText: field['hint'],
                          icon: field['icon'],
                          type: field['keyboardType'],
                          validator: field['validator'],
                          controller: field['controller'],
                        )
                      : field['label'] == "Confirm password"
                          ? PasswordInputField(
                              labelText: field['label'],
                              hintText: field['hint'],
                              controller: field['controller'],
                              isObscured: isObscured,
                              validator: (value) =>
                                  confirmPasswordValidator(value, controllers),
                            )
                          : PasswordInputField(
                              labelText: field['label'],
                              hintText: field['hint'],
                              controller: field['controller'],
                              isObscured: isObscured,
                              validator: field['validator'],
                            ),
                ],
              ),
            );
          },
        ),
        Themes.spaceY16,
        isloginpage
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckboxField(isChecked, "Remember me"),
                  defLink(() {
                    Get.toNamed(AppRoutes.forgot);
                  }, "Forgot Password ?"),
                ],
              )
            : CheckboxField(isChecked, "I agree to the terms and privacy"),
        Themes.spaceY32,
        defBtn(
          double.infinity,
          Themes.primary,
          onTapPrimaryBtn,
          isloginpage ? "Login" : "Create Account",
          true,
        ),
        Themes.spaceY16,
        guestBtn(
          double.infinity,
          Themes.bg,
          onTapGuestBtn,
          "Login as guest",
        ),
      ],
    ),
  );
}

Widget authJustFieldForm(
  Key? key,
  List<Map<String, dynamic>> fields,
  Map<String, TextEditingController> controllers,
  RxBool isObscured,
) {
  return Form(
    key: key,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: fields.map(
        (field) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.sm),
            child: Column(
              children: [
                Themes.spaceY16,
                !field['isObscured']
                    ? InputField(
                        labelText: field['label'],
                        hasLabel: true,
                        hintText: field['hint'],
                        icon: field['icon'],
                        type: field['keyboardType'],
                        validator: field['validator'],
                        controller: field['controller'],
                      )
                    : field['label'] == "Confirm password"
                        ? PasswordInputField(
                            labelText: field['label'],
                            hintText: field['hint'],
                            controller: field['controller'],
                            isObscured: isObscured,
                            validator: (value) =>
                                confirmPasswordValidator(value, controllers),
                          )
                        : PasswordInputField(
                            labelText: field['label'],
                            hintText: field['hint'],
                            controller: field['controller'],
                            isObscured: isObscured,
                            validator: field['validator'],
                          ),
              ],
            ),
          );
        },
      ).toList(),
    ),
  );
}

Widget CheckboxField(RxBool isChecked, String text) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Obx(
        () => Checkbox(
          value: isChecked.value,
          onChanged: (value) {
            isChecked.value = value!;
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          activeColor: Themes.primary,
          checkColor: Themes.bg,
        ),
      ),
      Text(
        text.tr,
        style: Themes.text_sm.copyWith(
          color: Themes.grayText,
        ),
      ),
    ],
  );
}
