
import 'package:http/http.dart' as http;
import 'package:global_configuration/global_configuration.dart';
import 'package:advisor/src/repository/user_repository.dart' as userRepo;

class MessageStatus {

  static Future<int> getMessageStatus() async {
    int result = 0;
    final String url =
      '${GlobalConfiguration().getValue('api_base_url')}send_msg_status.php';

    final client = new http.Client();
    final response = await client.post(url, body: {
      "sender_id": userRepo.currentUser.value.userId,
    });
    if(response.statusCode == 200){
      result = 200;
    }
    return result;
  }
}