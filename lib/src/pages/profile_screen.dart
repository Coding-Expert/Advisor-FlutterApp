import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';
import 'package:badges/badges.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../helpers/app_config.dart' as config;
import '../controllers/user_controller.dart';

import '../repository/user_repository.dart' as userRepo;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends StateMVC<ProfileScreen> {
  UserController _con;

  _ProfileScreenState() : super(UserController()) {
    _con = controller;
  }

  CountryPicker countryPicker;
  Country country = Country.fromJson(countryCodes[0]);

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _countryCodeController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  TextEditingController _oldpasswordController = TextEditingController();
  TextEditingController _newpasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // _usernameController.text = userRepo.currentUser.value.username;
    // _emailController.text = userRepo.currentUser.value.email;
    // _websiteController.text = userRepo.currentUser.value.website;
    // _countryCodeController.text = userRepo.currentUser.value.countryCode;
    // _mobileController.text = userRepo.currentUser.value.mobile;

    countryPicker = CountryPicker(onCountrySelected: (Country country) {
      print(country);

      _countryCodeController.text = "+" + country.dialCode.toString();

      setState(() {
        this.country = country;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: userRepo.getUserDetail(userRepo.currentUser.value.userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Snapshot: ${snapshot.data['detail']}");

            _usernameController.text = snapshot.data['detail']['username'];
            _emailController.text = snapshot.data['detail']['email'];
            _websiteController.text = snapshot.data['detail']['website'];
            _countryCodeController.text =
                snapshot.data['detail']['CountryCode'];
            _mobileController.text = snapshot.data['detail']['mobile'];

            return SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: config.App(context).appHeight(15),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Center(
                          child: Text(
                            "My Profile",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: config.App(context).appWidth(5),
                        ),
                        color: Colors.white,
                        width: config.App(context).appWidth(100),
                        child: Form(
                          key: _con.loginFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: config.App(context).appHeight(15),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    // fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Name/Nickname  ",
                                    ),
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: config.App(context).appHeight(2),
                              ),
                              TextFormField(
                                controller: _usernameController,
                                onSaved: (input) => _con.user.username = input,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return ' * Required!!';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Enter your Name/Nickname",
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 1,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: config.App(context).appHeight(3),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    // fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Email  ",
                                    ),
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: config.App(context).appHeight(2),
                              ),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (input) => _con.user.email = input,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return ' * Required!!';
                                  } else if (!value.contains('@')) {
                                    return 'Should be a valid email';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Enter your email",
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 1,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: config.App(context).appHeight(3),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    // fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Website  ",
                                    ),
                                    // TextSpan(
                                    //   text: "*",
                                    //   style: TextStyle(
                                    //     color: Theme.of(context).accentColor,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: config.App(context).appHeight(2),
                              ),
                              TextFormField(
                                controller: _websiteController,
                                keyboardType: TextInputType.text,
                                onSaved: (input) => _con.user.website = input,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  hintText:
                                      "Website/Advertisement URL/License no",
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 1,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: config.App(context).appHeight(3),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    // fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Mobile Number:  ",
                                    ),
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: config.App(context).appHeight(2),
                              ),
                              Container(
                                width: config.App(context).appHeight(90),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: config.App(context).appWidth(20),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());
                                          countryPicker.launch(context);
                                        },
                                        child: AbsorbPointer(
                                          child: TextFormField(
                                            controller: _countryCodeController,
                                            onSaved: (input) =>
                                                _con.user.countryCode = input,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return '';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: "+00",
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 15,
                                                vertical: 1,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: config.App(context).appWidth(2),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: config.App(context).appWidth(63),
                                        child: TextFormField(
                                          controller: _mobileController,
                                          keyboardType: TextInputType.phone,
                                          onSaved: (input) =>
                                              _con.user.mobile = input,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return ' * Required!!';
                                            }
                                            return null;
                                          },
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            hintText:
                                                "Enter your mobile number",
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 1,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color:
                                                    Theme.of(context).hintColor,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color:
                                                    Theme.of(context).hintColor,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color:
                                                    Theme.of(context).hintColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: config.App(context).appHeight(5),
                              ),
                              Center(
                                child: FlatButton(
                                  padding: EdgeInsets.symmetric(
                                    vertical: config.App(context).appWidth(5),
                                    horizontal:
                                        config.App(context).appWidth(13),
                                  ),
                                  child: Text(
                                    "Update Profile",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      _con.user.userId =
                                          userRepo.currentUser.value.userId;
                                      _con.user.deviceId =
                                          _con.device.identifier;
                                    });
                                    _con.updateProfile(_con.img);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: config.App(context).appHeight(2),
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Alert(
                                        context: context,
                                        title: "Change Password",
                                        content: Form(
                                          key: _con.formKey,
                                          child: Column(
                                            children: <Widget>[
                                              TextFormField(
                                                obscureText: _con.hidePassword,
                                                controller:
                                                    _oldpasswordController,
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return ' * Required!!';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  hintText: "Old Password",
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 1,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: config.App(context)
                                                    .appHeight(2),
                                              ),
                                              TextFormField(
                                                obscureText: _con.hidePassword,
                                                controller:
                                                    _newpasswordController,
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return ' * Required!!';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  hintText: "New Password",
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 1,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: config.App(context)
                                                    .appHeight(2),
                                              ),
                                              TextFormField(
                                                obscureText: _con.hidePassword,
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return ' * Required!!';
                                                  } else if (_newpasswordController
                                                          .text !=
                                                      value) {
                                                    return 'Password does not match';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  hintText: "Confirm Password",
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 1,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        buttons: [
                                          DialogButton(
                                            color:
                                                Theme.of(context).primaryColor,
                                            onPressed: () {
                                              _con.changePassword(
                                                  userRepo
                                                      .currentUser.value.userId,
                                                  _oldpasswordController.text,
                                                  _newpasswordController.text);
                                            },
                                            child: Text(
                                              "Channge Password",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Muli",
                                                  fontSize: 20),
                                            ),
                                          )
                                        ]).show();
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "Change Password",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: config.App(context).appHeight(2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: config.App(context).appHeight(11),
                    left: 0,
                    child: Container(
                      width: config.App(context).appWidth(100),
                      child: Center(
                        child: Badge(
                          badgeColor: Theme.of(context).primaryColor,
                          position: BadgePosition.topEnd(top: -5, end: -10),
                          badgeContent: Icon(
                            Icons.upload_rounded,
                            color: Colors.white,
                          ),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.white,
                            child: GestureDetector(
                              onTap: _con.getAvatar,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: _con.img == null
                                    ? snapshot.data['detail']
                                                ['profile_image'] ==
                                            null
                                        ? Icon(
                                            Icons.photo_camera,
                                            color: Colors.white,
                                            size: 50,
                                          )
                                        : Image.network(snapshot.data['detail']
                                            ['profile_image'])
                                    : Image(
                                        image: FileImage(_con.img),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
