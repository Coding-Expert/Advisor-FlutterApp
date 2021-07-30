import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../helpers/app_config.dart' as config;
import '../repository/ratting_repository.dart' as repository;
import '../models/category.dart';
import '../controllers/ratting_controller.dart';

class SMSRattingScreen extends StatefulWidget {
  final String mobileNumber;

  const SMSRattingScreen({Key key, this.mobileNumber}) : super(key: key);
  @override
  _SMSRattingScreenState createState() => _SMSRattingScreenState();
}

class _SMSRattingScreenState extends StateMVC<SMSRattingScreen> {
  RattingController _con;

  _SMSRattingScreenState() : super(RattingController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  String _category = "Positive";
  String _categoryId;

  void _handleRadioValueChange1(String value) {
    setState(() {
      _category = value;
      _categoryId = null;
      print("categoryId: $_categoryId");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF232121),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).hintColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "SMS Rating",
          style: TextStyle(
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: config.App(context).appHeight(5),
                ),
                Text(
                  "Number:",
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: config.App(context).appHeight(2),
                ),
                Text(
                  widget.mobileNumber,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: config.App(context).appHeight(10),
                ),
              ],
            ),
          ),
          Container(
            width: config.App(context).appWidth(95),
            padding: EdgeInsets.symmetric(
              horizontal: config.App(context).appWidth(3),
              vertical: config.App(context).appHeight(3),
            ),
            color: Color(0xFF232121),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Rating:",
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: config.App(context).appHeight(2),
                ),
                Theme(
                  data: ThemeData.dark(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      new Radio(
                        value: "Positive",
                        groupValue: _category,
                        onChanged: _handleRadioValueChange1,
                        activeColor: Theme.of(context).primaryColor,
                      ),
                      new Text(
                        'Positive',
                        style: new TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      new Radio(
                        value: "Neutral",
                        groupValue: _category,
                        onChanged: _handleRadioValueChange1,
                        activeColor: Theme.of(context).primaryColor,
                      ),
                      new Text(
                        'Neutral',
                        style: new TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      new Radio(
                        value: "Negative",
                        groupValue: _category,
                        onChanged: _handleRadioValueChange1,
                        activeColor: Theme.of(context).primaryColor,
                      ),
                      new Text(
                        'Negative',
                        style: new TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: config.App(context).appHeight(2),
                ),
                FutureBuilder(
                  future: repository.getCategoryList(_category),
                  builder: (context, AsyncSnapshot<List<Category>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return DropdownButtonFormField(
                        dropdownColor: Color(0xFF232121),
                        iconEnabledColor: Colors.white,
                        isExpanded: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: config.App(context).appHeight(1),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        value: _categoryId,
                        items: snapshot.data
                            .map(
                              (label) => DropdownMenuItem(
                                child: Text(
                                  label.categoryName,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                value: label.categoryId,
                              ),
                            )
                            .toList(),
                        hint: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            "Select Category",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          print("value: $value");
                          setState(() {
                            _categoryId = value;
                          });
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center();
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: config.App(context).appHeight(5),
          ),
          FlatButton(
            padding: EdgeInsets.symmetric(
              vertical: config.App(context).appWidth(4),
              horizontal: config.App(context).appWidth(5),
            ),
            child: Text(
              "RATE THIS CALLER",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () {
              _con.addReview(
                  _category, _categoryId, widget.mobileNumber, _category, "");
            },
          ),
        ],
      ),
    );
  }
}
