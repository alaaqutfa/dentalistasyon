import 'dart:io';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {
  late SharedPreferences shared;
  late PackageInfo packageInfo;
  late bool wifiConn;

  Future<Services> init() async {
    shared = await SharedPreferences.getInstance();
    packageInfo = await PackageInfo.fromPlatform();
    try {
      var res = await InternetAddress.lookup("google.com");
      if (res.isNotEmpty && res[0].rawAddress.isNotEmpty) {
        wifiConn = true;
      } else {
        wifiConn = false;
      }
    } on SocketException catch (_) {
      wifiConn = false;
    }
    return this;
  }
}

initalServices() async {
  await Get.putAsync(() => Services().init());
}
