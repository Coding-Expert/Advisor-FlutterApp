class Chat {
  String userId;
  String mobileNo;
  String comment;
  String id;
  String ratting;
  String type;
  String createdDate;
  String name;
  String senderId;
  String receiverId;
  String message;
  String profile;
  String chatNumber;
  String sendDate;
  String senderProfile;
  String receiverProfile;
  String device_token;

  Chat();

  Chat.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['ID'] != null ? jsonMap['ID'] : '';
      userId = jsonMap['UserID'] != null ? jsonMap['UserID'] : '';
      mobileNo = jsonMap['MobileNo'] != null ? jsonMap['MobileNo'] : '';
      comment = jsonMap['Comment'] != null ? jsonMap['Comment'] : '';
      ratting = jsonMap['Ratting'] != null ? jsonMap['Ratting'] : '';
      type = jsonMap['Type'] != null ? jsonMap['Type'] : '';
      createdDate =
          jsonMap['CreatedDate'] != null ? jsonMap['CreatedDate'] : '';
      name = jsonMap['name'] != null ? jsonMap['name'] : '';
      senderId = jsonMap['SenderID'] != null ? jsonMap['SenderID'] : '';
      receiverId = jsonMap['ReceiverID'] != null ? jsonMap['ReceiverID'] : '';
      message = jsonMap['Message'] != null ? jsonMap['Message'] : '';
      profile = jsonMap['profile'] != null ? jsonMap['profile'] : '';
      chatNumber = jsonMap['chat_number'] != null ? jsonMap['chat_number'] : '';
      sendDate = jsonMap['SendDate'] != null ? jsonMap['SendDate'] : '';
      receiverProfile = jsonMap['receiver_profile'] != null
          ? jsonMap['receiver_profile']
          : '';
      senderProfile =
          jsonMap['sender_profile'] != null ? jsonMap['sender_profile'] : '';
      device_token = jsonMap['device_token'] != null ? jsonMap['device_token'] : '';
    } catch (e) {
      print(e);
    }
  }
}
