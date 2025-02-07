import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class FCMService {
  FCMService._();

  static FCMService fcmService = FCMService._();

  Future<String> getAccessToken() async {
    String jsonPath = "assets/json/fcm.json";

    String json = await rootBundle.loadString(jsonPath);

    var accountCredential = ServiceAccountCredentials.fromJson(json);

    List<String> scopes = [
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    var accessToken = await clientViaServiceAccount(accountCredential, scopes);

    return accessToken.credentials.accessToken.data;
  }

  Future<void> sendFCM({
    required String title,
    required String body,
    required String token,
  }) async {
    String accessToken = await getAccessToken();

    String api =
        "https://fcm.googleapis.com/v1/projects/my-chat-app-2e26a/messages:send";

    Map<String, dynamic> myBody = {
      'message': {
        'token': token,
        'notification': {
          'title': title,
          'body': body,
        },
        'data': {
          'age': '22',
          'school': 'PQR',
        }
      },
    };

    http.Response res = await http.post(
      Uri.parse(api),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(myBody),
    );

    log("Status Code : ${res.statusCode}");
    if (res.statusCode == 200) {
      log("-------------------------------");
      log("Notification Send Successfully.....");
      log("Data : ${res.body}.....");
      log("-------------------------------");
    } else {
      log("-------------------------------");
      log("Error : ${res.body}");
      log("-------------------------------");
    }
  }
}
