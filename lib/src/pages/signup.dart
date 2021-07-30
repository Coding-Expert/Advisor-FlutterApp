import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';

import '../controllers/user_controller.dart';
import '../helpers/app_config.dart' as config;

class SignUpScreenWidget extends StatefulWidget {
  @override
  _SignUpScreenWidgetState createState() => _SignUpScreenWidgetState();
}

class _SignUpScreenWidgetState extends StateMVC<SignUpScreenWidget> {
  UserController _con;

  File imageFile;

  TextEditingController _countryCodeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _SignUpScreenWidgetState() : super(UserController()) {
    _con = controller;
  }

  CountryPicker countryPicker;
  Country country = Country.fromJson(countryCodes[0]);
  var _agree = false;

  @override
  void initState() {
    super.initState();
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: config.App(context).appHeight(15),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Center(
                    child: Text(
                      "Sign Up",
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
                          keyboardType: TextInputType.text,
                          onSaved: (input) => _con.user.website = input,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Website/Advertisement URL/License no",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 1,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Theme.of(context).hintColor,
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
                                      hintText: "Enter your mobile number",
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
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: config.App(context).appHeight(2),
                        ),
                        Text(
                          "You will receive a confirmation code",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: config.App(context).appHeight(2),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Password:  ",
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
                          controller: _passwordController,
                          onSaved: (input) => _con.user.password = input,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ' * Required!!';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          obscureText: _con.hidePassword,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
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
                          height: config.App(context).appHeight(2),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Confirm Password:  ",
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return ' * Required!!';
                            } else if (_passwordController.text != value) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter your confirm password",
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
                          height: config.App(context).appHeight(2),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: _agree,
                              onChanged: (value) {
                                if (value == !_agree) {
                                  setState(() {
                                    _agree = value;
                                  });
                                }
                              },
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: config.App(context).appWidth(1),
                            ),
                            InkWell(
                              onTap: () {},
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "I agree to the ",
                                    ),
                                    TextSpan(
                                      text: "TOS & Privacy Policy",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: config.App(context).appHeight(5),
                        ),
                        Center(
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                              vertical: config.App(context).appWidth(5),
                              horizontal: config.App(context).appWidth(13),
                            ),
                            child: Text(
                              "Continue",
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
                              if (_agree == false) {
                                Fluttertoast.showToast(
                                  msg: "Please select terms & conditions",
                                  gravity: ToastGravity.BOTTOM,
                                );
                              } else {
                                setState(() {
                                  _con.user.deviceId = _con.device.identifier;
                                });
                                _con.sendOtp("sms");
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: config.App(context).appHeight(2),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/Login');
                            },
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Already  have an account? ",
                                  ),
                                  TextSpan(
                                    text: "SignIn",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
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
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: _con.getAvatar,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: _con.user.profile == null
                            ? Icon(
                                Icons.photo_camera,
                                color: Colors.white,
                                size: 50,
                              )
                            : Image(
                                image: FileImage(_con.img),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
