import 'dart:convert';
import 'package:dentalistasyon/config/app.config.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future gql(String req, {Map<String, dynamic>? variables}) async {
  try {
    final res = await http.post(
      AppConfig.BaseUrl,
      headers: AppConfig.headers,
      body: jsonEncode(
        {"query": req, "variables": variables ?? {}},
      ),
    );
    var data = await jsonDecode(res.body);
    print(data['data']);
    return data;
  } catch (e) {
    print(AppConfig.BaseUrl);
    print(e);
    var data = {
      "result": false,
      "message": ["Something went wrong. Please try again.".tr],
      "e": e,
    };
    return data;
  }
}
