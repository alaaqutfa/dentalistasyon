import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';
import 'package:dentalistasyon/data/model/user.model.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> profileFields = [
  {
    'label': 'Name',
    'hint': 'Enter your full name',
    'icon': AppImg.user_icon,
    'keyboardType': TextInputType.text,
    'isObscured': false,
    'validator': (value) => nameValidator(value),
    'initialValue': User.name,
  },
  {
    'label': 'Email',
    'hint': 'abc@gmail.com',
    'icon': AppImg.email_icon,
    'keyboardType': TextInputType.emailAddress,
    'isObscured': false,
    'validator': (value) => emailValidator(value),
    'initialValue': User.email,
  },
  {
    'label': 'Phone Number',
    'hint': '+970 590 000 000',
    'icon': AppImg.contact_icon,
    'keyboardType': TextInputType.phone,
    'isObscured': false,
    'validator': (value) => phoneValidator(value),
    'initialValue': User.phone_number,
  },
  {
    'label': 'Birthday',
    'hint': '01/01/2025',
    'icon': AppImg.calendar_icon,
    'keyboardType': TextInputType.datetime,
    'isObscured': false,
    'validator': (value) => dateValidator(value),
    'initialValue': User.birthday,
  },
];
