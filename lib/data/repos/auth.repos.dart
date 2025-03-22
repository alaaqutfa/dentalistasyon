import 'package:dentalistasyon/core/utils/gql.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';

const String forgotPasswordMutation = """
  mutation ForgotPassword(\$input: String!) {
    forgotPassword(email: \$input)
  }
""";

const String changePasswordAfterOtpMutation = """
  mutation ChangePasswordAfterOtp(\$userId: String!, \$otp: String!, \$newPassword: String!) {
    changePasswordAfterOtp(userId: \$userId, otp: \$otp, newPassword: \$newPassword)
  }
""";

const String loginMutation = """
  mutation Login(\$input: LoginInput!) {
    login(input: \$input) {
      accessToken
      refreshToken
      expiresIn
    }
  }
""";

const String loginAsGuestMutation = """
  mutation GuestLogin(\$input: GuestLoginInput) {
    loginAsGuest(input: \$input)
  }
""";

const String resendOtpMutation = """
mutation ResendOtp(\$purpose: OtpPurpose!, \$userEmail: String!) {
  resendOtp(purpose: \$purpose, userEmail: \$userEmail)
}
""";

const String signupMutation = """
mutation Signup(\$input: SignupInput!) {
  signup(input: \$input) {
    success
    userId
  }
}
""";

const String verifyOtpMutation = """
  mutation VerifyOtp(\$input: VerifyOtpInput!) {
    verifyOtp(input: \$input)
  }
""";

const String refreshTokenMutation = """
  mutation RefreshToken(\$input: RefreshTokenInput!) {
    refreshToken(input: \$input) {
      accessToken
      refreshToken
      expiresIn
    }
  }
""";

const String logoutMutation = """
  mutation Logout(\$refreshToken: String!) {
    logout(refreshToken: \$refreshToken)
  }
""";

const String logoutAllMutation = """
  mutation LogoutAll {
    logoutAll
  }
""";

const String verifyPasswordResetOtpMutation = """
mutation VerifyPasswordResetOtp(\$userId: String!, \$otp: String!) {
  verifyPasswordResetOtp(userId: \$userId, otp: \$otp)
}
""";



class AuthRepos {
  static Future<dynamic> forgotPassword(String email) async {
    Map<String, dynamic> variables = {"input": email};
    var res = await gql(
      forgotPasswordMutation,
      variables: variables,
      skipAuth: true,
    );
    return handleData(res, "forgotPassword");
  }

  static Future<dynamic> changePasswordAfterOtp(
      String userId, String otp, String newPassword) async {
    Map<String, dynamic> variables = {
      "userId": userId,
      "otp": otp,
      "newPassword": newPassword
    };
    var res = await gql(
      changePasswordAfterOtpMutation,
      variables: variables,
      skipAuth: true,
    );
    return handleData(res, "changePasswordAfterOtp");
  }

  static Future<dynamic> login(
    String email,
    String password,
    bool rememberMe,
    String deviceId,
  ) async {
    Map<String, dynamic> variables = {
      "input": {
        "email": email,
        "password": password,
        "rememberMe": rememberMe,
        "deviceId": deviceId
      }
    };
    var res = await gql(
      loginMutation,
      variables: variables,
      skipAuth: true,
    );
    return handleData(res, "login");
  }

  static Future<dynamic> guestLogin(String deviceId) async {
    Map<String, dynamic> variables = {
      "input": {
        "deviceId": deviceId,
      }
    };
    var res = await gql(
      loginMutation,
      variables: variables,
      skipAuth: true,
    );
    return handleData(res, "guestLogin");
  }

  static Future<dynamic> resendOtp(String purpose, String userEmail) async {
    Map<String, dynamic> variables = {
      "purpose": purpose.toUpperCase(),
      "userEmail": userEmail
    };
    var res = await gql(
      resendOtpMutation,
      variables: variables,
      skipAuth: true,
    );
    return handleData(res, "resendOtp");
  }

  static Future<dynamic> signup(
    String email,
    String name,
    String password,
    String diploma_number,
    String language_preference,
  ) async {
    Map<String, dynamic> variables = {
      "input": {
        "email": email,
        "name": name,
        "password": password,
        "diploma_number": diploma_number,
        "language_preference": language_preference,
      }
    };
    var res = await gql(signupMutation, variables: variables, skipAuth: true);
    return handleData(res, "signup");
  }

  static Future<dynamic> verifyOtp(String userId, String otp) async {
    Map<String, dynamic> variables = {
      "input": {
        "userId": userId,
        "otp": otp,
      }
    };
    var res = await gql(
      verifyOtpMutation,
      variables: variables,
      skipAuth: true,
    );
    return handleData(res, "verifyOtp");
  }

  static Future<dynamic> refreshToken(
    String refreshToken,
    String deviceId,
  ) async {
    Map<String, dynamic> variables = {
      "input": {
        "refreshToken": refreshToken,
        "deviceId": deviceId,
      }
    };
    var res = await gql(
      refreshTokenMutation,
      variables: variables,
      skipAuth: true,
    );
    return handleData(res, "refreshToken");
  }

  static Future<dynamic> logout(String refreshToken) async {
    Map<String, dynamic> variables = {
      "input": {
        "refreshToken": refreshToken,
      }
    };
    var res = await gql(
      logoutMutation,
      variables: variables,
      skipAuth: true,
    );
    return handleData(res, "logout");
  }

  static Future<dynamic> logoutAll() async {
    var res = await gql(logoutAllMutation);
    return handleData(res, "logoutAll");
  }

  static Future<dynamic> verifyPasswordResetOtp(
      String userId, String otp) async {
    Map<String, dynamic> variables = {
      "userId": userId,
      "otp": otp,
    };
    var res = await gql(
      verifyPasswordResetOtpMutation,
      variables: variables,
      skipAuth: true,
    );
    return handleData(res, "verifyPasswordResetOtp");
  }
}
