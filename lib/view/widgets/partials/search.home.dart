import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/widgets/partials/fields.dart';
import 'package:flutter/material.dart';

Widget searchBox(
  {TextEditingController? searchController,
  Function(String)? searchOnChanged,
  String? Function(String?)? searchValidator}
) {
  return InputField(
    hasLabel: false,
    hintText: "Search",
    controller: searchController,
    onChanged: searchOnChanged,
    validator: searchValidator,
    type: TextInputType.webSearch,
    icon: AppImg.search_icon,
  );
}
