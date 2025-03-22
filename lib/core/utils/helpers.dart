import 'package:dentalistasyon/config/app.config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:intl/intl.dart';

Future<void> showPage(String path,
    [LaunchMode mode = LaunchMode.externalApplication]) async {
  Uri url = Uri.parse(path);

  if (path.startsWith("tel:") || path.startsWith("mailto:")) {
    await launchUrlString(path);
  } else if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: mode);
  } else {
    throw Exception('Could not launch ${url.toString()}');
  }
}

bool checkFormState(GlobalKey<FormState> formKey) {
  return formKey.currentState?.validate() ?? false;
}

void insertControllers(Map<String, TextEditingController> controllers,
    List<Map<String, dynamic>> fields) {
  for (var field in fields) {
    final controller = TextEditingController();
    controllers[field['label']] = controller;
    field['controller'] = controller;
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

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required'.tr;
  }
  String pattern =
      r'^(?:\+?(\d{1,3}))?[-. (]?(\d{3})[-. )]?(\d{3})[-. ]?(\d{4,6})$';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Enter a valid phone number'.tr;
  }

  return null;
}

String? dateValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Date is required'.tr;
  }

  // التحقق من التنسيق الصحيح للتاريخ (YYYY-MM-DD)
  String pattern = r'^\d{4}-\d{2}-\d{2}$';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Enter a valid date (YYYY-MM-DD)'.tr;
  }

  try {
    DateTime parsedDate = DateTime.parse(value);
    if (parsedDate.isAfter(DateTime.now())) {
      return 'Date cannot be in the future'.tr;
    }
  } catch (e) {
    return 'Invalid date format'.tr;
  }

  return null;
}

Future<bool> checkInternetConnection() async {
  try {
    var res = await InternetAddress.lookup("google.com");
    if (res.isNotEmpty && res[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

Future<String?> getDeviceId() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.id; // Unique ID for Android
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.identifierForVendor; // Unique ID for iOS
  }
  return null;
}

dynamic handleData(var res, String key) {
  try {
    if (!res.containsKey("errors") &&
        res.containsKey("data") &&
        res["data"][key] != null) {
      if (AppConfig.debugMode) {
        print("==============================");
        print("✅ Success from handleData: $key");
        print(res["data"][key]);
        print("==============================");
      }
      return res["data"][key];
    } else {
      if (AppConfig.debugMode) {
        print("==============================");
        print("❌ Error in handleData: $key");
        print(res['data']['errors']);
        print("==============================");
      }
      return res;
    }
  } catch (e) {
    if (AppConfig.debugMode) {
      print("==============================");
      print("⚠️ Exception in handleData: $e");
      print(res);
      print("==============================");
    }
    return {
      "result": false,
      "message": ["Something went wrong"],
      "error": e.toString(),
    };
  }
}

List<Map<String, dynamic>> getHotDealsData(List<dynamic> deals) {
  return deals.map((item) {
    var product = item["storeProduct"]["product"];

    return {
      "id": product["id"],
      "name": product["name"] ?? "",
      "imgUrl": (product["productImages"] as List).firstWhere(
              (img) => img["is_main"] == true,
              orElse: () => {"image_url": ""})["image_url"] ??
          "",
      "newPrice": (item["newPrice"] as num?)?.toStringAsFixed(2) ?? "0.00",
      "discounted_price":
          (item["discounted_price"] as num?)?.toStringAsFixed(2) ?? "0.00",
      "discountPercentage":
          (item["discountPercentage"] as num?)?.toStringAsFixed(2) ?? "0.00",
      "rate": item["averageRating"]?.toString() ?? "0",
      "sold": item["storeProduct"]["sold_quantity"]?.toString() ?? "0",
    };
  }).toList();
}

List<Map<String, dynamic>> getBrandsData(List<dynamic> brands) {
  return brands.map((item) {
    return {
      "id": item["id"],
      "name": item["name"] ?? "",
      "img": item["logo"],
    };
  }).toList();
}

List<Map<String, dynamic>> getDataFromProducts(List<dynamic> products) {
  return products.map(
    (item) {
      return {
        "id": item["id"],
        "name": item["name"] ?? "",
        "img": item["imageUrl"],
        "price": (item["price"] as num?)?.toStringAsFixed(2) ?? "0.00",
        "discountedPrice":
            (item["discountedPrice"] as num?)?.toStringAsFixed(2) ?? "0.00",
        "rate": (item["averageRating"] as num?)?.toStringAsFixed(2) ?? "0.00",
        "sold": item["sold_quantity"]?.toString() ?? "0",
        "isInWishlist": item["isInWishlist"] ?? false,
      };
    },
  ).toList();
}

Map<String, dynamic> getDataFromStoreProduct(Map<String, dynamic> product) {
  return {
    "id": product["id"],
    "name": product["name"],
    "price": (product["price"] as num?)?.toStringAsFixed(2) ?? "0.00",
    "discountedPrice":
        (product["discountedPrice"] as num?)?.toStringAsFixed(2) ?? "0.00",
    "averageRating":
        (product["averageRating"] as num?)?.toStringAsFixed(2) ?? "0.00",
    "isInWishlist": product["isInWishlist"],
    "isBuyMoreSaveMore": product["isBuyMoreSaveMore"],
    "img": (product["productImages"] as List).firstWhere(
            (img) => img["is_main"] == true,
            orElse: () => {"image_url": ""})["image_url"] ??
        "",
    "productImages": product["productImages"],
  };
}

List<dynamic> getDataReviewsFromProduct(
  List<dynamic> reviews,
) {
  return reviews.map(
    (item) {
      return {
        "id": item["id"],
        "comment": item["comment"],
        "ratingProduct": item["ratingProduct"],
        "ratingShipping": item["ratingShipping"],
        "ratingShop": item["ratingShop"],
        "createdAt": formatDate(item["createdAt"]),
        "userId": item["user"]["id"],
        "userName": item["user"]["name"],
        "userImg": item["user"]["avatar_url"],
      };
    },
  ).toList();
}

List<dynamic> getDataRelatedProductsFromProduct(
  List<dynamic> product,
) {
  return product.map(
    (item) {
      return {
        "id": item["id"],
        "name": item["name"] ?? "",
        "img": item["imageUrl"],
        "price": (item["price"] as num?)?.toStringAsFixed(2) ?? "0.00",
        "discountedPrice":
            (item["discountedPrice"] as num?)?.toStringAsFixed(2) ?? "0.00",
        "rate": (item["averageRating"] as num?)?.toStringAsFixed(2) ?? "0.00",
        "sold": item["sold_quantity"]?.toString() ?? "0",
        "isInWishlist": item["isInWishlist"] ?? false,
      };
    },
  ).toList();
}

String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}