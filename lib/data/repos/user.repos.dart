import 'dart:io';
import 'package:dentalistasyon/core/utils/gql.dart';
import 'package:dentalistasyon/core/utils/helpers.dart';

class UserRepos {
  static Future<dynamic> updateAvatar(
    File file,
    String userId,
  ) async {
    String updateAvatarMutation = """
      mutation UpdateAvatar(\$file: Upload!, \$userId: String!) {
        updateAvatar(file: \$file, userId: \$userId) { 
          id 
          avatar_url
        }
      }
    """;
    Map<String, dynamic> variables = {"userId": userId, "file": null};
    var res =
        await gqlFile(file, userId, updateAvatarMutation, variables: variables);
    return handleData(res, "getUserByEmail");
  }

  static Future<dynamic> getUser(String id) async {
    String getUserQuery = """
      query GetUser(\$id: String!) {
        user(id: \$id) {
          id
          name
          email
          is_verified
          language_preference
          phone_number
          notification_enabled
          birthday
          avatar_url
          created_at
          updated_at
        }
      }
    """;
    Map<String, dynamic> variables = {"id": id};
    var res = await gql(
      getUserQuery,
      variables: variables,
      skipAuth: true,
    );
    return handleData(res, "user");
  }

  static Future<dynamic> getUserByEmail(String email) async {
    String getUserByEmailQuery = """
      query GetUserByEmail(\$email: String!) {
        getUserByEmail(email: \$email) {
          id
          name
          email
          is_verified
          language_preference
          phone_number
          notification_enabled
          birthday
          avatar_url
          created_at
          updated_at
        }
      }
    """;
    Map<String, dynamic> variables = {"email": email};
    var res = await gql(
      getUserByEmailQuery,
      variables: variables,
      skipAuth: true,
    );
    return handleData(res, "getUserByEmail");
  }
}
