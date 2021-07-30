class User {
  String userId;
  String username;
  String email;
  String website;
  String mobile;
  String password;
  String deviceId;
  String countryCode;
  String profile;
  String activated;
  String deviceToken;

  bool auth;

  User();

  User.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      userId = jsonMap['user']['id'] != null ? jsonMap['user']['id'] : '';
      username = jsonMap['user']['username'] != null
          ? jsonMap['user']['username']
          : '';
      email = jsonMap['user']['email'] != null ? jsonMap['user']['email'] : '';
      mobile =
          jsonMap['user']['mobile'] != null ? jsonMap['user']['mobile'] : '';
      countryCode = jsonMap['user']['CountryCode'] != null
          ? jsonMap['user']['CountryCode']
          : '';
      activated = jsonMap['user']['activated'];
      deviceToken = jsonMap['user']['device_token'];
    } catch (e) {
      print(e);
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['username'] = username;
    map['email'] = email;
    map['website'] = website;
    map['mobile'] = mobile;
    map['password'] = password;
    map['device_id'] = deviceId;
    map['country_code'] = countryCode;
    map['profile'] = profile;
    map['deviceToken'] = deviceToken;

    return map;
  }
}
