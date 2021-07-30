import 'dart:convert';

import 'package:advisor/src/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../helpers/helper.dart';
import '../repository/chat_repository.dart' as chatRepo;
import '../models/chat.dart';
import 'package:http/http.dart' as http;
import '../repository/user_repository.dart' as userRepo;

class ChatController extends ControllerMVC {
  OverlayEntry loader;

  ChatController() {
    loader = Helper.overlayLoader(context);
  }

  void deleteChat(String receiverId, String mobileNumber) async {
    FocusScope.of(context).unfocus();
    Overlay.of(context).insert(loader);
    chatRepo.deleteChat(receiverId, mobileNumber).then((res) {
      if (res['status'] == false) {
        Fluttertoast.showToast(msg: res["message"]);
      } else {
        Fluttertoast.showToast(msg: res["message"]);
        Navigator.pop(context);
      }
    }).catchError((e) {
      loader.remove();
    }).whenComplete(() {
      Helper.hideLoader(loader);
    });
  }

  Future<List<Chat>> getChatReviewList(
      String receiverId, String mobileNumber) async {
    List<Chat> chat_list = [];
    return chatRepo.getChatReviewList(receiverId, mobileNumber).then((res) {
      return (res["reviews"] as List).map((p) => Chat.fromJSON(p)).toList();
    });
  }

  void sendMsg(String receiverId, String mobileNumber, String message, String device_token, String name) async {
    return chatRepo.sendMsg(receiverId, mobileNumber, message).then((res) {
      if(res == "success"){
        print("---user_number:${userRepo.currentUser.value.mobile}");
        sendNotificationData(userRepo.currentUser.value.mobile, userRepo.currentUser.value.username, device_token);
        getChatReviewList(receiverId, mobileNumber);
        
      }
    });
  }

  sendNotificationData(String number, String name, String token) async {
    // var data ='{"notification": {"body": "this is a body", "title": "this is a title"}, "priority": "high", "data": {"click_action": "FLUTTER_NOTIFICATION_CLICK", "id": "1", "status": "done"}, "to": "ccbTAyu9GTM: APA91bFb58HWa3d73BjS9oBk6pWkR1XpYiJiFXwBf-OGgu3QItVyPR-sZ1_WRhE2WaGW_IRMHw_0yIXeEJFq-3WdnhxE1GkGRvlev56faOAQKfEjGe_D8H_9FvNGyPHUrb"}';
    // https://fcm.googleapis.com/fcm/send -H "Content-Type:application/json" -X POST -d "$DATA" -H "Authorization: key=AAAARx2WWw4: APA91bFRCwWXKNSTSTdYznuIflRijbS03V8qzj8RvDN7vv22Xw8Km3dCIfEYliBXhb9b8yF_5mlnBS7jHJkKfyxfmERaTttzI9lZyIxED3Psi_d14v_XELvZO5yBUTB2U-W"
    final data = {
      "notification": {
        "body": number, 
        "title": name,
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
      },
      "priority": "high",
      "data": {
        "id": "1",
        "status": "done",
      },
      "to": token
    };
    
    http.post("https://fcm.googleapis.com/fcm/send",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "key=AAAAowahv94:APA91bG5pHHs0Y-hfPfX8Ko6jXOlrAqgfar5CYgHknJqdeNGmcMAa6e013J98c2NwKP4-cbLobEAiVWRnBxgt4V_88Mo514CitWCXikyJP9_AYDr0bSBT8ueI6d8KNNLHWZfxiR4yUX-"
      },
      body: jsonEncode(data),
    );
  }
}
