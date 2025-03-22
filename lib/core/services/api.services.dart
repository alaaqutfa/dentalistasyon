import 'package:dentalistasyon/config/app.config.dart';
import 'package:dentalistasyon/core/services/auth.services.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService extends GetxService {
  static Future<String?> getValidAccessToken() async {
    final expiryTime = await AuthService.getTokenExpiry();
    final now = DateTime.now().millisecondsSinceEpoch;

    if (expiryTime != null && now < expiryTime) {
      return await AuthService.getAccessToken();
    } else {
      return await refreshAccessToken();
    }
  }

  static Future<String?> refreshAccessToken() async {
    final refreshToken = await AuthService.getRefreshToken();
    if (refreshToken == null) return null;

    final response = await http.post(
      AppConfig.BaseUrl,
      headers: AppConfig.headers,
      body: jsonEncode({
        "query": """
          mutation RefreshToken(\$input: RefreshTokenInput!) {
            refreshToken(input: \$input) {
              accessToken
              refreshToken
              expiresIn
            }
          }
        """,
        "variables": {
          "input": {"refreshToken": refreshToken, "deviceId": "device-123"}
        }
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newAccessToken = data["data"]["refreshToken"]["accessToken"];
      final newRefreshToken = data["data"]["refreshToken"]["refreshToken"];
      final expiresIn = data["data"]["refreshToken"]["expiresIn"];

      await AuthService.saveTokens(newAccessToken, newRefreshToken, expiresIn);
      return newAccessToken;
    } else {
      await AuthService.clearTokens();
      Get.offAllNamed(AppRoutes.login); // توجيه المستخدم لصفحة تسجيل الدخول
      return null;
    }
  }

}
