class AppConfig {
  static bool isHttps = true;
  // static String liveBaseUrl = "api.dentalistasyon.com";
  static String testBaseUrl = "test.dentalistasyon.com";
  static String prefix = "graphql";
  static String defUrl =
      isHttps ? "https://$testBaseUrl" : "http://$testBaseUrl";
  static Uri BaseUrl = Uri.parse("$defUrl/$prefix");
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=utf-8",
    "Accept": "application/json",
    "x-api-key":
        "bdfae89ae927c92c9025967aa1217d495265a1ff8c2c3873154ad103efc8a1a0",
  };
}
