import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputField extends StatelessWidget {
  final TextInputType? type;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? autofocus;
  final String labelText;
  final String hintText;
  final Icon icon;
  final String? initialValue;
  final int? hintMaxLines;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  const InputField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    this.autofocus,
    this.controller,
    this.type,
    this.validator,
    this.obscureText,
    this.onChanged,
    this.initialValue,
    this.hintMaxLines,
    this.inputFormatters,
    this.maxLength,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText.tr,
          style: Themes.title_lg.copyWith(color: Themes.grayText),
        ),
        Themes.spaceY8,
        TextFormField(
          style: Themes.text_base,
          maxLines: maxLines,
          validator: validator,
          controller: controller,
          obscureText: obscureText != null ? true : false,
          obscuringCharacter: "•",
          keyboardType: type ?? TextInputType.text,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          autofocus: autofocus != null ? true : false,
          onChanged: onChanged,
          initialValue: initialValue,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Spacing.md,
              vertical: Spacing.sm,
            ),
            focusColor: Themes.text,
            hintText: hintText.tr,
            hintStyle: Themes.text_base.copyWith(color: Themes.grayText),
            prefixIcon: icon,
            hintMaxLines: hintMaxLines,
            border: inputBorder(Themes.stroke, 1),
            enabledBorder: inputBorder(Themes.stroke, 1),
            focusedBorder: inputBorder(Themes.primary, 2),
            errorBorder: inputBorder(Themes.error, 1),
            focusedErrorBorder: inputBorder(Themes.error, 2),
          ),
        ),
      ],
    );
  }
}

class PasswordInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final RxBool isObscured;
  final String? Function(String?)? validator;

  const PasswordInputField({
    super.key,
    this.controller,
    required this.labelText,
    required this.hintText,
    required this.isObscured,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelText.tr,
              style: Themes.title_lg.copyWith(color: Themes.grayText),
            ),
            Themes.spaceY8,
            TextFormField(
              controller: controller,
              obscureText: isObscured.value,
              validator: validator,
              obscuringCharacter: "•",
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Spacing.md,
                  vertical: Spacing.sm,
                ),
                hintText: hintText,
                hintStyle: Themes.text_base.copyWith(color: Themes.grayText),
                border: inputBorder(Themes.stroke, 1),
                enabledBorder: inputBorder(Themes.stroke, 1),
                focusedBorder: inputBorder(Themes.primary, 2),
                errorBorder: inputBorder(Themes.error, 1),
                focusedErrorBorder: inputBorder(Themes.error, 2),
                prefixIcon: Image.asset(
                  AppImg.lock_icon,
                  color: Themes.grayText,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    !isObscured.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Themes.grayText,
                  ),
                  onPressed: () {
                    isObscured.value = !isObscured.value;
                  },
                ),
              ),
            ),
          ],
        ));
  }
}

class SelectField extends StatelessWidget {
  final List<DropdownMenuItem<Object>>? items;
  final Object? value;
  final String label;
  final IconData? icon;
  final void Function(Object?)? onChanged;

  const SelectField({
    super.key,
    this.value,
    this.onChanged,
    required this.label,
    this.icon,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: Themes.text,
              ),
            Text(
              label.tr,
              style: Themes.title_lg.copyWith(color: Themes.grayText),
            ),
          ],
        ),
        Themes.spaceY8,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.md,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Themes.stroke,
            ),
            borderRadius: BorderRadius.circular(Spacing.sm),
          ),
          child: DropdownButton<Object>(
            isExpanded: true,
            underline: const SizedBox.shrink(),
            items: items ?? [],
            value: value,
            onChanged: onChanged,
            dropdownColor: Themes.bg,
          ),
        ),
      ],
    );
  }
}

InputBorder? inputBorder(Color color, double width) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      width: width,
      color: color,
    ),
    borderRadius: Themes.borderRadiusSm,
  );
}
