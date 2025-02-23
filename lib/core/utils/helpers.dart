import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future showPage(String path, LaunchMode? mode) async {
  final Uri url = Uri.parse(path);

  if (!await launchUrl(url, mode: mode ?? LaunchMode.platformDefault)) {
    return Exception('Could not launch'.tr + url.toString());
  }
}

bool checkFormState(GlobalKey<FormState> formKey) {
  return formKey.currentState?.validate() ?? false;
}

void insertControllers(Map<String, TextEditingController> controllers,
    List<Map<String, dynamic>> fields) {
  for (var field in fields) {
    if (field['field-type'] == null || field['field-type'] == 'input') {
      final controller = TextEditingController();
      controllers[field['label']] = controller;
      field['controller'] = controller;
    }
  }
}

String? emailValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Email is required'.tr;
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'Enter a valid email address'.tr;
  }
  return null;
}

String? passValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Password is required'.tr;
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long'.tr;
  }
  return null;
}

String? textValidator(String? value, {int minLength = 1, int? maxLength}) {
  if (value == null || value.isEmpty) {
    return 'This field is required'.tr;
  }
  if (value.length < minLength) {
    return 'Text must be at least '.tr +
        minLength.toString() +
        ' characters long'.tr;
  }
  if (maxLength != null && value.length > maxLength) {
    return 'Text must not exceed '.tr + maxLength.toString() + ' characters'.tr;
  }
  return null;
}

String? addressValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Address is required'.tr;
  }
  if (value.length < 10) {
    return 'Address must be at least 10 characters long'.tr;
  }
  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required'.tr;
  }
  if (value.length < 3) {
    return 'Name must be at least 3 characters long'.tr;
  }
  return null;
}

String? confirmPasswordValidator(
    String? value, Map<String, TextEditingController> controllers) {
  if (value == null || value.isEmpty) {
    return 'Confirmation password is required'.tr;
  }
  if (!controllers.containsKey('Password')) {
    return 'Password field is missing'.tr;
  }
  if (value != controllers['Password']!.text) {
    return 'Passwords do not match'.tr;
  }
  return null;
}
