import 'dart:convert';
import 'dart:io';
import 'package:dentalistasyon/core/services/api.services.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:path/path.dart';
import 'package:dentalistasyon/config/app.config.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

/// تنفيذ طلب GraphQL باستخدام `POST`
///
/// [req] يمثل استعلام GraphQL (Query أو Mutation).
/// [variables] يمثل المتغيرات المرتبطة بالاستعلام (اختياري).
///
/// يعيد `Map<String, dynamic>` يحتوي على البيانات المسترجعة أو رسالة الخطأ.
Future<Map<String, dynamic>> gql(
  String req, {
  Map<String, dynamic>? variables,
  bool skipAuth = false,
}) async {
  try {
    String? accessToken;

    // ✅ التحقق من التوكن فقط إذا لم يتم تحديد `skipAuth = true`
    if (!skipAuth) {
      accessToken = await ApiService.getValidAccessToken();
      if (accessToken == null) {
        Get.offAllNamed(AppRoutes.login);
        return {
          "result": false,
          "errors": ["Authentication required".tr],
        };
      }
    }

    // إعداد رؤوس الطلب (Headers)
    final headers = {
      ...AppConfig.headers,
      if (accessToken != null) "Authorization": "Bearer $accessToken",
    };

    // إرسال طلب HTTP POST إلى خادم GraphQL
    final res = await http.post(
      AppConfig.BaseUrl, // BaseUrl
      headers: headers, // تعيين رؤوس الطلب (Headers)
      body: jsonEncode({
        "query": req, // إدراج الاستعلام
        "variables": variables ?? {}, // إدراج المتغيرات
      }),
    );

    // تحويل الاستجابة إلى JSON
    var data = jsonDecode(res.body);

    // التحقق من نجاح الطلب بناءً على رمز الحالة `200` ووجود البيانات
    if (res.statusCode == 200 && data.containsKey("data")) {
      if (AppConfig.debugMode) {
        // مسح شاشة وحدة التحكم (Console) لطباعة الرد الجديد فقط
        print("\x1B[2J\x1B[0;0H");
        print("✅ GraphQL Response: ${data['data']}");
      }

      return data; // إرجاع البيانات المسترجعة
    } else {
      if (AppConfig.debugMode) {
        // مسح وحدة التحكم
        print("\x1B[2J\x1B[0;0H");
        print("❌ GraphQL Error: ${data['errors'] ?? 'Unknown error'}");
      }

      // إرجاع رسالة الخطأ
      return {"result": false, "errors": data['errors']};
    }
  } catch (e) {
    if (AppConfig.debugMode) {
      // مسح وحدة التحكم وطباعة الخطأ
      print("\x1B[2J\x1B[0;0H");
      print("⚠️ Exception: $e");
    }

    // إرجاع رسالة خطأ في حالة حدوث استثناء أثناء تنفيذ الطلب
    return {
      "result": false,
      "errors": [e.toString()], // تضمين تفاصيل الخطأ في الاستجابة
    };
  }
}

/// تنفيذ طلب رفع ملف عبر GraphQL باستخدام `MultipartRequest`
///
/// [file] الملف المراد رفعه.
/// [userId] معرّف المستخدم الذي سيتم رفع الملف له.
/// [req] الاستعلام (Mutation) الخاص بـ GraphQL.
/// [variables] المتغيرات الإضافية (اختياري).
///
/// يعيد `Map<String, dynamic>` يحتوي على البيانات المسترجعة أو رسالة الخطأ.
Future<Map<String, dynamic>> gqlFile(File file, String userId, String req,
    {Map<String, dynamic>? variables}) async {
  // إنشاء طلب متعدد الأجزاء (Multipart)
  var request = http.MultipartRequest("POST", AppConfig.BaseUrl);

  // ضبط المتغيرات بحيث تشمل الملف
  Map<String, dynamic> finalVariables = variables ?? {};
  finalVariables["file"] = null; // إضافة المفتاح لضمان وجوده في JSON

  // تكوين الحقول بنفس طريقة Postman
  request.fields['operations'] = jsonEncode({
    "query": req, // إدراج الاستعلام (Mutation)
    "variables": finalVariables, // تمرير المتغيرات
  });

  request.fields['map'] = jsonEncode({
    "0": ["variables.file"] // تعيين المفتاح المناسب للملف
  });

  // إضافة الملف إلى الطلب
  request.files.add(await http.MultipartFile.fromPath(
    '0', // يجب أن يكون مطابقًا للمفتاح في `map`
    file.path,
    filename: basename(file.path), // استخدام اسم الملف
  ));

  // إضافة Headers المطلوبة
  request.headers.addAll(AppConfig.headers);

  try {
    // إرسال الطلب واستقبال الرد
    var res = await request.send();

    // قراءة البيانات القادمة من السيرفر وتحويلها إلى JSON
    var resData = await res.stream.bytesToString();
    var data = jsonDecode(resData);

    // التحقق من نجاح العملية
    if (res.statusCode == 200 && data.containsKey("data")) {
      if (AppConfig.debugMode) {
        // مسح شاشة وحدة التحكم (Console) لطباعة الرد الجديد فقط
        print("\x1B[2J\x1B[0;0H");
        print("✅ GraphQL Response: ${data['data']}");
      }
      return data; // إرجاع البيانات المسترجعة
    } else {
      if (AppConfig.debugMode) {
        // مسح وحدة التحكم وطباعة الخطأ
        print("\x1B[2J\x1B[0;0H");
        print("❌ GraphQL Error: ${data['errors'] ?? 'Unknown error'}");
      }
      return {"result": false, "errors": data['errors']};
    }
  } catch (e) {
    if (AppConfig.debugMode) {
      // طباعة الخطأ في حال حدوث استثناء
      // مسح وحدة التحكم وطباعة الخطأ
      print("\x1B[2J\x1B[0;0H");
      print("⚠️ Exception: $e");
    }
    return {
      "result": false,
      "errors": ["Exception: $e"]
    };
  }
}
