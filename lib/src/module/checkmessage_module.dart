import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../repository/user_repository.dart' as userRepo;

class CheckMessageModule {

  static Future<int> checkAllMessageStatus() async {

    int new_message_count = 0;
    final String url =
      '${GlobalConfiguration().getValue('api_base_url')}checkAllMessage.php';
    final client = new http.Client();
    final response = await client.post(
      url,
      body: {
        "sender_id": userRepo.currentUser.value.userId,
      },
    );
    if(response.statusCode == 200) {
      Map data = json.decode(response.body);
      if(data["status"] == true){
        new_message_count = data["new_message"];
        // print("----message_count:${new_message_count}");
      }
    }
    return new_message_count;
  }

}