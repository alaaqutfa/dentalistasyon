import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Map<String, dynamic>> signupFields = [
  {
    'label': 'Name',
    'hint': 'Enter your full name',
    'icon': FontAwesomeIcons.user,
    'keyboardType': TextInputType.text,
    'isObscured': false,
    'validator': (value) => nameValidator(value),
  },
  {
    'label': 'Email',
    'hint': 'abc@gmail.com',
    'icon': FontAwesomeIcons.envelope,
    'keyboardType': TextInputType.emailAddress,
    'isObscured': false,
    'validator': (value) => emailValidator(value),
  },
  {
    'label': 'Password',
    'hint': '••••••••',
    'icon': FontAwesomeIcons.lock,
    'keyboardType': TextInputType.text,
    'isObscured': true, // For password fields
    'validator': (value) => passValidator(value),
  },
  {
    'label': 'Confirm password',
    'hint': '••••••••',
    'icon': FontAwesomeIcons.lock,
    'keyboardType': TextInputType.text,
    'isObscured': true,
    'validator': (value) => passValidator(value),
  },
  {
    'label': 'Diploma NO.',
    'hint':  'Enter your Diploma NO.',
    'icon': Icons.confirmation_num,
    'keyboardType': TextInputType.text,
    'isObscured': false,
    'validator': (value) => textValidator(value),
  },
];

final List<Map<String, dynamic>> loginFields = [
  {
    'label': 'Email',
    'hint': 'abc@gmail.com',
    'icon': FontAwesomeIcons.envelope,
    'keyboardType': TextInputType.emailAddress,
    'isObscured': false,
    'validator': (value) => emailValidator(value),
  },
  {
    'label': 'Password',
    'hint': '••••••••',
    'icon': FontAwesomeIcons.lock,
    'keyboardType': TextInputType.text,
    'isObscured': true, // For password fields
    'validator': (value) => passValidator(value),
  },
];

final List<Map<String, dynamic>> forgotFields = [
  {
    'label': 'Email',
    'hint': 'abc@gmail.com',
    'icon': FontAwesomeIcons.envelope,
    'keyboardType': TextInputType.emailAddress,
    'isObscured': false,
    'validator': (value) => emailValidator(value),
  },
];

final List<Map<String, dynamic>> resetFields = [
  {
    'label': 'Password',
    'hint': '••••••••',
    'icon': FontAwesomeIcons.lock,
    'keyboardType': TextInputType.text,
    'isObscured': true, // For password fields
    'validator': (value) => passValidator(value),
  },
  {
    'label': 'Confirm password',
    'hint': '••••••••',
    'icon': FontAwesomeIcons.lock,
    'keyboardType': TextInputType.text,
    'isObscured': true,
    'validator': (value) => passValidator(value),
  },
];
