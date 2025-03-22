import 'package:dentalistasyon/core/utils/gql.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';

class ProfileRepos {
  Future<dynamic> getLoyaltyPoints(String userId) async {
    String getLoyaltyPointsQuery = """
      query GetLoyaltyPoints(\$userId: String) {
        getLoyaltyPoints(userId: \$userId)
      }
    """;
    Map<String, dynamic> variables = {
      "userId": userId,
    };
    var res = await gql(getLoyaltyPointsQuery, variables: variables);
    return handleData(res, "getLoyaltyPoints");
  }

  Future<dynamic> updateNotificationSettings(bool enabled) async {
    String updateNotificationSettingsMutation = """
      mutation UpdateNotificationSettings(\$input: UpdateNotificationSettingsInput!) {
        updateNotificationSettings(input: \$input)
      }
    """;
    Map<String, dynamic> variables = {
      "input": {"enabled": enabled}
    };
    var res =
        await gql(updateNotificationSettingsMutation, variables: variables);
    return handleData(res, "updateNotificationSettings");
  }

  Future<dynamic> updateLanguage(String language) async {
    String updateLanguageMutation = """
      mutation UpdateLanguage(\$input: UpdateLanguageInput!) {
        updateLanguage(input: \$input)
      }
    """;
    Map<String, dynamic> variables = {
      "input": {"language": language}
    };
    var res = await gql(updateLanguageMutation, variables: variables);
    return handleData(res, "updateLanguage");
  }

  Future<dynamic> updateUserName(String name) async {
    String updateUserNameMutation = """
      mutation UpdateUserName(\$input: UpdateUserNameInput!) {
        updateUserName(input: \$input) {
          id
          name
          name_updated_at
        }
      }
    """;
    Map<String, dynamic> variables = {
      "input": {"name": name}
    };
    var res = await gql(updateUserNameMutation, variables: variables);
    return handleData(res, "updateUserName");
  }

  Future<dynamic> updateUserBirthday(String name) async {
    String updateUserBirthdayMutation = """
      mutation UpdateUserBirthday(\$input: UpdateUserBirthdayInput!) {
        updateUserBirthday(input: \$input) {
          id
          birthday
          name
        }
      }
    """;
    Map<String, dynamic> variables = {
      "input": {"name": name}
    };
    var res = await gql(updateUserBirthdayMutation, variables: variables);
    return handleData(res, "updateUserBirthday");
  }

  Future<dynamic> initiateEmailChange(String email) async {
    String initiateEmailChangeMutation = """
      mutation InitiateEmailChange(\$newEmail: String!) {
        initiateEmailChange(newEmail: \$newEmail)
      }
    """;
    Map<String, dynamic> variables = {"newEmail": email};
    var res = await gql(initiateEmailChangeMutation, variables: variables);
    return handleData(res, "initiateEmailChange");
  }

  Future<dynamic> verifyEmailChangeOtp(String otp) async {
    String verifyEmailChangeOtpMutation = """
      mutation VerifyEmailChangeOtp(\$otp: String!) {
        verifyEmailChangeOtp(otp: \$otp)
      }
    """;
    Map<String, dynamic> variables = {"otp": otp};
    var res = await gql(verifyEmailChangeOtpMutation, variables: variables);
    return handleData(res, "verifyEmailChangeOtp");
  }

  Future<dynamic> createAddress(
    String title,
    String street,
    String house_number,
    String city,
    String zipcode,
    String country,
    String additional_details,
  ) async {
    String createAddressMutation = """
      mutation CreateAddress(\$input: CreateAddressInput!) {
        createAddress(input: \$input) {
          id
          title
          street
          house_number
          city
          zipcode
          country
          additional_details
          created_at
          updated_at
        }
      }
    """;
    Map<String, dynamic> variables = {
      "input": {
        "title": title,
        "street": street,
        "house_number": house_number,
        "city": city,
        "zipcode": zipcode,
        "country": country,
        "additional_details": additional_details,
      }
    };
    var res = await gql(createAddressMutation, variables: variables);
    return handleData(res, "createAddress");
  }

  Future<dynamic> updateAddress(
    String id,
    String title,
    String street,
    String house_number,
    String city,
    String zipcode,
    String country,
    String additional_details,
  ) async {
    String updateAddressMutation = """
      mutation UpdateAddress(\$input: UpdateAddressInput!) {
        updateAddress(input: \$input) {
          id
          title
          street
          house_number
          city
          zipcode
          country
          additional_details
        }
      }
    """;
    Map<String, dynamic> variables = {
      "input": {
        "id": id,
        "title": title,
        "street": street,
        "house_number": house_number,
        "city": city,
        "zipcode": zipcode,
        "country": country,
        "additional_details": additional_details,
      }
    };
    var res = await gql(updateAddressMutation, variables: variables);
    return handleData(res, "updateAddress");
  }

  Future<dynamic> deleteAddress(
    String id,
  ) async {
    String deleteAddressMutation = """
      mutation DeleteAddress(\$id: ID!) {
        deleteAddress(id: \$id)
      }
    """;
    Map<String, dynamic> variables = {
      "id": id,
    };
    var res = await gql(deleteAddressMutation, variables: variables);
    return handleData(res, "deleteAddress");
  }

  Future<dynamic> myAddresses() async {
    String myAddressesQuery = """
      query MyAddresses {
        myAddresses {
          id
          title
          street
          house_number
          city
          zipcode
          country
          additional_details
          created_at
          updated_at
        }
      }
    """;
    var res = await gql(myAddressesQuery);
    return handleData(res, "myAddresses");
  }

  Future<dynamic> createWorkingHour(
    String dayOfWeek,
    String startTime,
    String endTime,
  ) async {
    String createWorkingHourMutation = """
      mutation CreateWorkingHour(\$input: CreateWorkingHourInput!) {
        createWorkingHour(input: \$input) {
          id
          day_of_week
          start_time
          end_time
          userId
        }
      }
    """;
    Map<String, dynamic> variables = {
      "input": {
        "dayOfWeek": dayOfWeek,
        "startTime": startTime,
        "endTime": endTime
      }
    };
    var res = await gql(createWorkingHourMutation, variables: variables);
    return handleData(res, "createWorkingHour");
  }

  Future<dynamic> updateWorkingHour(
    String id,
    String dayOfWeek,
    String startTime,
    String endTime,
  ) async {
    String updateWorkingHourMutation = """
      mutation UpdateWorkingHour(\$input: UpdateWorkingHourInput!) {
        updateWorkingHour(input: \$input) {
          id
          day_of_week
          start_time
          end_time
        }
      }
    """;
    Map<String, dynamic> variables = {
      "input": {
        "id": id,
        "dayOfWeek": dayOfWeek,
        "startTime": startTime,
        "endTime": endTime,
      }
    };
    var res = await gql(updateWorkingHourMutation, variables: variables);
    return handleData(res, "createWorkingHour");
  }

  Future<dynamic> updateWorkingHours(
    List<Map<String, String>> workingHours,
  ) async {
    String updateWorkingHoursMutation = """
      mutation UpdateWorkingHours(\$input: UpdateWorkingHoursInput!) {
        updateWorkingHours(input: \$input) {
          id
          day_of_week
          start_time
          end_time
        }
      }
    """;
    Map<String, dynamic> variables = {
      "input": {
        "workingHours": workingHours,
      }
    };
    var res = await gql(updateWorkingHoursMutation, variables: variables);
    return handleData(res, "createWorkingHour");
  }

  Future<dynamic> deleteWorkingHour(
    String id,
  ) async {
    String deleteWorkingHourMutation = """
      mutation DeleteWorkingHour(\$id: String!) {
        deleteWorkingHour(id: \$id)
      }
    """;
    Map<String, dynamic> variables = {
      "id": id,
    };
    var res = await gql(deleteWorkingHourMutation, variables: variables);
    return handleData(res, "deleteWorkingHour");
  }

  Future<dynamic> deleteOwnAccount() async {
    String deleteOwnAccountMutation = """
      mutation DeleteOwnAccount {
        deleteOwnAccount
      }
    """;
    var res = await gql(deleteOwnAccountMutation);
    return handleData(res, "deleteOwnAccount");
  }

  Future<dynamic> reactivateAccount(
    String email,
    String password,
  ) async {
    String reactivateAccountMutation = """
      mutation ReactivateAccount(\$email: String!, \$password: String!) {
        reactivateAccount(email: \$email, password: \$password) {
          accessToken
          refreshToken
          expiresIn
        }
      }
    """;
    Map<String, dynamic> variables = {
      "email": email,
      "password": password,
    };
    var res = await gql(reactivateAccountMutation, variables: variables);
    return handleData(res, "reactivateAccount");
  }

  Future<dynamic> getBiometricStatus() async {
    String getBiometricStatusQuery = """
      query GetBiometricStatus {
        getBiometricStatus {
          faceIdEnabled
          fingerprintEnabled
        }
      }
    """;
    var res = await gql(getBiometricStatusQuery);
    return handleData(res, "getBiometricStatus");
  }

  Future<dynamic> enableBiometric(
    String biometricToken,
    String deviceId,
    String type,
  ) async {
    String enableBiometricMutation = """
      mutation EnableBiometric(\$input: BiometricEnableInput!) {
        enableBiometric(input: \$input)
      }
    """;
    Map<String, dynamic> variables = {
      "input": {
        "biometricToken": biometricToken,
        "deviceId": deviceId,
        "type": type,
      }
    };
    var res = await gql(enableBiometricMutation, variables: variables);
    return handleData(res, "enableBiometric");
  }

  Future<dynamic> disableBiometric(
    String type,
  ) async {
    String disableBiometricMutation = """
      mutation DisableBiometric(\$type: BiometricType!) {
        disableBiometric(type:\$type)
      }
    """;
    Map<String, dynamic> variables = {"type": type};
    var res = await gql(disableBiometricMutation, variables: variables);
    return handleData(res, "disableBiometric");
  }

  Future<dynamic> biometricLogin(
    String biometricToken,
    String deviceId,
    String type,
    String userId,
  ) async {
    String biometricLoginMutation = """
      mutation BiometricLogin(\$input: BiometricLoginInput!) {
        biometricLogin(input: \$input) {
          accessToken
          refreshToken
          expiresIn
          userId
          deactivatedAccount
        }
      }
    """;
    Map<String, dynamic> variables = {
      "input": {
        "biometricToken": biometricToken,
        "deviceId": deviceId,
        "type": type,
        "userId": userId,
      }
    };
    var res = await gql(biometricLoginMutation, variables: variables);
    return handleData(res, "biometricLogin");
  }

  Future<dynamic> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    String changePasswordMutation = """
      mutation ChangePassword(\$input: ChangePasswordInput!) {
        changePassword(input: \$input)
      }
    """;
    Map<String, dynamic> variables = {
      "input": {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      }
    };
    var res = await gql(changePasswordMutation, variables: variables);
    return handleData(res, "changePassword");
  }
}
