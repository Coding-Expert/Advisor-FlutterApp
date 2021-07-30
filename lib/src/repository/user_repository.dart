import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:async/async.dart';

import 'package:path/path.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

ValueNotifier<User> currentUser = new ValueNotifier(User());

Future<dynamic> login(User user) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}login.php';

  final client = new http.Client();
  final response = await client.post(
    url,
    body: {
      "username": user.username,
      "password": user.password,
      "device_id": user.deviceId,
      "device_token": user.deviceToken
    },
  );

  if (response.statusCode == 200) {
    setCurrentUser(response.body);
    currentUser.value = User.fromJSON(json.decode(response.body)['data']);
  } else {
    throw new Exception(response.body);
  }

  return json.decode(response.body);
}

Future<dynamic> register(
    String username,
    String email,
    String website,
    String mobile,
    String password,
    String deviceId,
    String countryCode,
    File profile,
    BuildContext context) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}app_register.php';

  var uri = Uri.parse(url);

  var request = new http.MultipartRequest("POST", uri);

  var stream = new http.ByteStream(DelegatingStream.typed(profile.openRead()));

  var length = await profile.length();

  var multipartFile = new http.MultipartFile('profile', stream, length,
      filename: basename(profile.path));

  request.files.add(multipartFile);

  request.fields['username'] = username;
  request.fields['email'] = email;
  request.fields['website '] = website;
  request.fields['mobile'] = mobile;
  request.fields['password'] = password;
  request.fields['device_id'] = deviceId;
  request.fields['country_code'] = countryCode;

  var response = await request.send();
  return response;
}

Future<dynamic> updateProfile(User user, File imgFile) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}update_profile.php';

  if (imgFile == null) {
    final client = new http.Client();
    final response = await client.post(
      url,
      body: {
        "user_id": user.userId,
        "username": user.username,
        "email": user.email,
        "website": user.website,
        "mobile": user.mobile,
        "device_id": user.deviceId,
        "country_code": user.countryCode,
      },
    );

    print("Update Response: ${response.body}");

    if (json.decode(response.body)['status'] == true) {
      updateCurrentUser(
        {
          "user": {
            "id": user.userId,
            "username": user.username,
            "email": user.email,
            "mobile": user.mobile,
            "CountryCode:": user.countryCode,
          }
        },
      );

      currentUser.value = User.fromJSON(
        {
          "user": {
            "id": user.userId,
            "username": user.username,
            "email": user.email,
            "mobile": user.mobile,
          }
        },
      );

      currentUser.value.countryCode = user.countryCode;
    }
    return json.decode(response.body);
  } else {
    var uri = Uri.parse(url);

    var request = new http.MultipartRequest("POST", uri);

    var stream =
        new http.ByteStream(DelegatingStream.typed(imgFile.openRead()));

    var length = await imgFile.length();

    var multipartFile = new http.MultipartFile('profile', stream, length,
        filename: basename(imgFile.path));

    request.files.add(multipartFile);

    request.fields['user_id'] = user.userId;
    request.fields['username'] = user.username;
    request.fields['email'] = user.email;
    request.fields['website '] = user.website;
    request.fields['mobile'] = user.mobile;
    request.fields['device_id'] = user.deviceId;
    request.fields['country_code'] = user.countryCode;

    var response = await request.send();

    return response;
  }
}

Future<dynamic> sendOtp(String mobile, String countryCode, String type) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}sendsms.php';
  final client = new http.Client();
  final response = await client.post(
    url,
    body: {
      "mobile": mobile,
      "country_code": countryCode,
      "type": type,
    },
  );
  return json.decode(response.body);
}

Future<dynamic> verifyOtp(String mobile, String countryCode, String otp) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}verifyotp.php';
  final client = new http.Client();
  final response = await client.post(
    url,
    body: {
      "mobile": countryCode + mobile,
      "otp": otp,
    },
  );

  return json.decode(response.body);
}

Future<dynamic> sendForgotPassword(String email) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}forgot_password.php';

  final client = new http.Client();
  final response = await client.post(
    url,
    body: {
      "email": email,
    },
  );

  return json.decode(response.body);
}

void setCurrentUser(jsonString) async {
  if (json.decode(jsonString)['data'] != null) {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
        'current_user', json.encode(json.decode(jsonString)['data']));
  }
}

void updateCurrentUser(jsonString) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('current_user', json.encode(jsonString));
}

Future<User> getCurrentUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (currentUser.value.auth == null && prefs.containsKey('current_user')) {
    currentUser.value =
        User.fromJSON(json.decode(await prefs.get('current_user')));
    currentUser.value.auth = true;
  } else {
    currentUser.value.auth = false;
  }

  currentUser.notifyListeners();
  return currentUser.value;
}

Future<dynamic> getUserDetail(String userId) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}user_detail.php';

  final client = new http.Client();
  final response = await client.post(
    url,
    body: {
      "user_id": userId,
    },
  );

  return json.decode(response.body);
}

Future<dynamic> changePassword(
    String userId, String oldPassword, String newPassword) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}change_password.php';

  final client = new http.Client();
  final response = await client.post(
    url,
    body: {
      "user_id": userId,
      "old_password": oldPassword,
      "new_password": newPassword,
    },
  );

  return json.decode(response.body);
}

Future<dynamic> sendReport(
    String name, String email, String description) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}report_issue.php';

  final client = new http.Client();
  final response = await client.post(
    url,
    body: {
      "user_id": currentUser.value.userId,
      "name": name,
      "email": email,
      "description": description,
    },
  );

  return json.decode(response.body);
}



Future<void> logout() async {
  currentUser.value = new User();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('current_user');
}
