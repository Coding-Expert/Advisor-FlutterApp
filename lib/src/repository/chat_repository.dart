import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_configuration/global_configuration.dart';

import 'package:http/http.dart' as http;

import '../repository/user_repository.dart' as userRepo;
import '../models/chat.dart';

Future<List<Chat>> getChatList() async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}chat_user_list.php';

  final client = new http.Client();
  final response = await client
      .post(url, body: {"sender_id": userRepo.currentUser.value.userId});

  var res = json.decode(response.body);
  if (res['status'] == false) {
    Fluttertoast.showToast(msg: res["message"], gravity: ToastGravity.TOP);
  }

  // print(res);

  return (res["reviews"] as List).map((p) => Chat.fromJSON(p)).toList();
}

Future<dynamic> deleteChat(String receiverId, String mobileNumber) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}delete_chat.php';

  final client = new http.Client();
  final response = await client.post(url, body: {
    "sender_id": userRepo.currentUser.value.userId,
    "receiver_id": receiverId,
    "mobile": mobileNumber,
  });

  print("Response: ${json.decode(response.body)}");

  return json.decode(response.body);
}

Future<dynamic> getChatReviewList(
    String receiverId, String mobileNumber) async {
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}chat_list.php';
  final client = new http.Client();
  final response = await client.post(
    url,
    body: {
      "sender_id": userRepo.currentUser.value.userId,
      "receiver_id": receiverId,
      "chat_number": mobileNumber
    },
  );
  print("----senderId:${userRepo.currentUser.value.userId}");
  // print("Response: ${json.decode(response.body)}");
  // var res = json.decode(response.body);
  return json.decode(response.body);
  // return (res["reviews"] as List).map((p) => Chat.fromJSON(p)).toList();
}

Future<String> sendMsg(String receiverId, String mobileNumber, String message) async {
  String result = "";
  final String url ='${GlobalConfiguration().getValue('api_base_url')}send_message.php';
  final client = new http.Client();
  final response = await client.post(url, body: {
    "sender_id": userRepo.currentUser.value.userId,
    "receiver_id": receiverId,
    "message": message,
    "mobile": mobileNumber
  });
  if(response.statusCode == 200){
    result = "success";
  }
  return result;
}
