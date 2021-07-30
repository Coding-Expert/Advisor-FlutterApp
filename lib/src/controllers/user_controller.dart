import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:device_info/device_info.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user.dart';
import '../models/device.dart';
import '../helpers/helper.dart';
import '../pages/verify_otp.dart';

import '../repository/user_repository.dart' as repository;

class UserController extends ControllerMVC {
  User user = new User();

  Device device = new Device();
  bool loading = false;
  bool hidePassword = true;

  GlobalKey<FormState> loginFormKey;
  GlobalKey<FormState> formKey;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;

  File img;

  UserController() {
    loader = Helper.overlayLoader(context);
    loginFormKey = new GlobalKey<FormState>();
    formKey = new GlobalKey<FormState>();
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    getDeviceDetails();
  }

  void login() async {
    FocusScope.of(context).unfocus();
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      Overlay.of(context).insert(loader);
      repository.login(user).then((res) {
        print("Response: ${res.toString()}");
        if (res['status'] == false) {
          Fluttertoast.showToast(msg: res["message"]);
        } else {
          Fluttertoast.showToast(msg: res["message"]);
          Navigator.pushNamed(context, '/Home');
        }
      }).catchError((e) {
        loader.remove();
      }).whenComplete(() {
        Helper.hideLoader(loader);
      });
    }
  }

  void register(
      String username,
      String email,
      String website,
      String mobile,
      String password,
      String deviceId,
      String countryCode,
      File profile,
      BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      // Overlay.of(context).insert(loader);
      repository
          .register(username, email, website, mobile, password, deviceId,
              countryCode, profile, context)
          .then((res) {
        res.stream.transform(utf8.decoder).listen((value) {
          Map mapRes = json.decode(value);
          Fluttertoast.showToast(msg: mapRes['message']);
          Navigator.of(context).pop();
          print(mapRes['message']);
        });
      });
    }
  }

  void updateProfile(File imgFile) async {
    FocusScope.of(context).unfocus();
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      Overlay.of(context).insert(loader);
      repository.updateProfile(user, imgFile).then((res) {
        if (imgFile == null) {
          if (res['status'] == true) {}
          Fluttertoast.showToast(msg: res['message']);
        } else {
          res.stream.transform(utf8.decoder).listen((value) {
            Map mapRes = json.decode(value);

            if (mapRes['status'] == true) {
              repository.updateCurrentUser(
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
              repository.currentUser.value = User.fromJSON(
                {
                  "user": {
                    "id": user.userId,
                    "username": user.username,
                    "email": user.email,
                    "mobile": user.mobile,
                  }
                },
              );

              repository.currentUser.value.countryCode = user.countryCode;
            }
            Fluttertoast.showToast(msg: mapRes['message']);
            // Navigator.of(context).pop();
            print(mapRes['message']);
          });
        }
      }).catchError((e) {
        loader.remove();
      }).whenComplete(() {
        Helper.hideLoader(loader);
      });
    }
  }

  void changePassword(
      String userId, String oldPassword, String newPassword) async {
    FocusScope.of(context).unfocus();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Overlay.of(context).insert(loader);
      repository.changePassword(userId, oldPassword, newPassword).then((res) {
        print("Response: ${res.toString()}");

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
  }

  void sentForgotPassword(String email) async {
    FocusScope.of(context).unfocus();
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      Overlay.of(context).insert(loader);

      repository.sendForgotPassword(email).then((res) {
        print("Response: ${res.toString()}");

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
  }

  Future<void> getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        device.deviceName = build.model;
        device.deviceVersion = build.version.toString();
        device.identifier = build.androidId;
        //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        device.deviceName = data.name;
        device.deviceVersion = data.systemVersion;
        device.identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }

  void getAvatar() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        img = image;
        user.profile = img.toString();

        print(user.profile);
      } else {
        print("No image selected.");
      }
    });
  }

  void sendOtp(String type) async {
    FocusScope.of(context).unfocus();
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      Overlay.of(context).insert(loader);
      repository.sendOtp(user.mobile, user.countryCode, type).then((res) {
        print("Response: ${res.toString()}");
        if (res['status'] == false) {
          Fluttertoast.showToast(msg: res["message"]);
        } else {
          Fluttertoast.showToast(msg: res["message"]);
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context) => VerifyOtpScreen(
                userName: user.username,
                email: user.email,
                website: user.website,
                profileImage: user.profile,
                mobile: user.mobile,
                password: user.password,
                otp: res['otp'].toString(),
                countryCode: user.countryCode,
                tag: "Reg",
                userId: "",
                imageFile: img,
              ),
            ),
          );
        }
      }).catchError((e) {
        loader.remove();
      }).whenComplete(() {
        Helper.hideLoader(loader);
      });
    }
  }

  void verifyOtp(
    String username,
    String email,
    String website,
    String mobile,
    String password,
    String deviceId,
    String countryCode,
    String profile,
    String otp,
    String tag,
    File imageFile,
  ) async {
    FocusScope.of(context).unfocus();
    Overlay.of(context).insert(loader);
    repository.verifyOtp(mobile, countryCode, otp).then((res) {
      if (res['status'] == false) {
        Fluttertoast.showToast(msg: res["message"]);
      } else {
        Fluttertoast.showToast(msg: res["message"]);
        if (tag == "Reg") {
          register(username, email, website, mobile, password, deviceId,
              countryCode, imageFile, context);
        } else {}
      }
    }).catchError((e) {
      loader.remove();
    }).whenComplete(() {
      Helper.hideLoader(loader);
    });
  }

  void sendRepot(String name, String email, String description) async {
    FocusScope.of(context).unfocus();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Overlay.of(context).insert(loader);
      repository.sendReport(name, email, description).then((res) {
        print("Response: ${res.toString()}");
        if (res['status'] == false) {
          Fluttertoast.showToast(msg: res["message"]);
        } else {
          Fluttertoast.showToast(msg: res["message"]);
          Navigator.of(context).pop();
        }
      }).catchError((e) {
        loader.remove();
      }).whenComplete(() {
        Helper.hideLoader(loader);
      });
    }
  }
}
