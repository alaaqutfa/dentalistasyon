import 'package:dentalistasyon/core/utils/helpers.dart';
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
    wifiConn = await checkInternetConnection();
    return this;
  }
}

initalServices() async {
  await Get.putAsync(() => Services().init());
}
