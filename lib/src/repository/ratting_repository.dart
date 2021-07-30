// import 'dart:io';
import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:async/async.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

import '../repository/user_repository.dart' as userRepo;
import '../models/category.dart';

Future<dynamic> getReviewLists() async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}review_list.php';

  final client = new http.Client();
  final response = await client.post(url, body: {
    "user_id": userRepo.currentUser.value.userId,
  });

  return json.decode(response.body);
}

Future<dynamic> searchReview(String mobile) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}mobile_review_list.php';

  final client = new http.Client();
  final response = await client.post(url, body: {"mobile": mobile, "user_id": userRepo.currentUser.value.userId});

  print("Review: ${json.decode(response.body)}");
  return json.decode(response.body);
}

Future<dynamic> getPrivateList() async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}private_comment_list.php';

  final client = new http.Client();
  final response = await client.post(url, body: {
    "user_id": userRepo.currentUser.value.userId,
  });

  print("Response: ${json.decode(response.body)}");
  return json.decode(response.body);
}

Future<dynamic> getSearchPrivateList(String mobile) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}private_search_comment_list.php';

  final client = new http.Client();
  final response = await client.post(url, body: {
    "user_id": userRepo.currentUser.value.userId,
    "mobile": mobile
  });

  print("Response: ${json.decode(response.body)}");
  return json.decode(response.body);
}

Future<List<Category>> getCategoryList(String category) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}sub_category_list.php';

  final client = new http.Client();
  final response = await client.post(url, body: {"cat_name": category});

  var res = json.decode(response.body);
  if (res['status'] == false) {
    Fluttertoast.showToast(msg: res["message"], gravity: ToastGravity.TOP);
  }

  print(res);

  return (res["sub_category"] as List)
      .map((p) => Category.fromJSON(p))
      .toList();
}

Future<dynamic> addReview(String ratting, String categoryId, String mobile,
    String type, String comment) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}add_review.php';

  final client = new http.Client();
  final response = await client.post(url, body: {
    "ratting": ratting,
    "category_id": categoryId,
    "user_id": userRepo.currentUser.value.userId,
    "mobile": mobile,
    "type": type,
    "comment": comment,
  });

  print("response : ${json.decode(response.body)}");

  return json.decode(response.body);
}

Future<dynamic> addPrivateNote(String mobile, String comment) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}add_private_comm.php';

  final client = new http.Client();
  final response = await client.post(url, body: {
    "user_id": userRepo.currentUser.value.userId,
    "mobile": mobile,
    "comment": comment,
  });

  print("response : ${json.decode(response.body)}");

  return json.decode(response.body);
}

Future<dynamic> updatePrivateNote(
    String mobile, String comment, String id) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}update_comm.php';

  final client = new http.Client();
  final response = await client.post(url, body: {
    "user_id": userRepo.currentUser.value.userId,
    "mobile": mobile,
    "comment": comment,
    "id": id,
  });

  print("response : ${json.decode(response.body)}");

  return json.decode(response.body);
}

Future<dynamic> deletePrivateNote(String id) async {
  final String url = '${GlobalConfiguration().getValue('api_base_url')}delete_comm.php';
  final client = new http.Client();
  final response = await client.post(url, body: {
    "id": id,
  });
  return json.decode(response.body);
}

Future<dynamic> deleteAllPrivateNote() async {
  final String url = '${GlobalConfiguration().getValue('api_base_url')}deleteAll_comm.php';
  final client = new http.Client();
  final response = await client.post(url, body: {
    "user_id": userRepo.currentUser.value.userId,
  });
  return json.decode(response.body);
}
