import 'package:dentalistasyon/data/repos/user.repos.dart';

class User {
  static String id = "";
  static String name = "";
  static String email = "";
  static bool? is_verified = false;
  static String language_preference = "";
  static String? phone_number = "";
  static bool? notification_enabled = false;
  static String? birthday = "";
  static String? avatar_url = "";

  static Future<bool> init(String id) async {
    Map<String, dynamic> data = await UserRepos.getUser(id);
    if (data.containsKey("data") && data['data']['user'] == null) {
      return false;
    }
    if (data.containsKey("errors")) {
      return false;
    }
    save(data);
    return true;
  }

  static save(Map<String, dynamic> data) {
    id = data["id"];
    name = data["name"];
    email = data["email"];
    is_verified = data["is_verified"];
    language_preference = data["language_preference"];
    phone_number = data["phone_number"];
    notification_enabled = data["notification_enabled"];
    birthday = data["birthday"];
    avatar_url = data["avatar_url"];
  }

  static clear() {
    id = "---";
    name = "---";
    email = "---";
    is_verified = false;
    language_preference = "---";
    phone_number = "---";
    notification_enabled = false;
    birthday = "---";
    avatar_url = "---";
  }
}
