import 'package:advisor/src/repository/ratting_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../helpers/app_config.dart' as config;
import '../controllers/ratting_controller.dart';
import '../models/review.dart';
import '../models/mobile_review.dart';
import '../models/private_review.dart';
import '../pages/public_comments_screen.dart';
import '../pages/caller_rating_screen.dart';

import 'caller_review_screen.dart';

class RatingWidget extends StatefulWidget {
  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends StateMVC<RatingWidget> {
  RattingController _con;

  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _commentController = new TextEditingController();
  _RatingWidgetState() : super(RattingController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    _commentController.text = "";
  }

  bool _isPrivate = false;
  bool _isSearch = false;
  int private_note_count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: config.App(context).appWidth(4),
        vertical: config.App(context).appHeight(5),
      ),
      child: Column(
        children: [
          Form(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: config.App(context).appWidth(65),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _isSearch = false;
                          });
                        },
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter mobile number",
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
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
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(
                          vertical: config.App(context).appWidth(4),
                          horizontal: config.App(context).appWidth(5),
                        ),
                        child: Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_phoneController.text.isEmpty == false) {
                            setState(() {
                              _isSearch = true;
                            });
                          } else {}
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: config.App(context).appHeight(3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton(
                padding: EdgeInsets.symmetric(
                  vertical: config.App(context).appWidth(2),
                  horizontal: config.App(context).appWidth(5),
                ),
                child: Text(
                  "Public Comments",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                color: _isPrivate == true
                    ? Color(0xFF2C2C2C)
                    : Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _isPrivate = false;
                  });
                },
              ),
              Column(
                children: [
                  FlatButton(
                    padding: EdgeInsets.symmetric(
                      vertical: config.App(context).appWidth(2),
                      horizontal: config.App(context).appWidth(5),
                    ),
                    child: Container(
                      width: 100,
                      child: Text(
                        "Private Notes",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: _isPrivate == false
                        ? Color(0xFF2C2C2C)
                        : Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        _isPrivate = true;
                      });
                    },
                  ),
                  _isPrivate == true ?
                    GestureDetector(
                      child: Text(
                        'Delete All', 
                        style: TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                          fontSize: 18
                        ),
                      ),
                      onTap: () {
                        if(private_note_count > 0){
                          showDialog(
                            context: context, 
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Private Notes"),
                                content: Text("Are you sure you would like to delete all of your private notes?"),
                                actions: [
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    }, 
                                    child: Text('Cancel')
                                  ),
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                      _con.deleteAllPrivateNote().then((status){
                                        if(status){
                                          setState(() {
                                            private_note_count = 0;
                                          });
                                        }
                                      });

                                    }, 
                                    child: Text('Ok')
                                  )
                                ],
                              );
                            }
                          );
                        }
                        else{
                          Fluttertoast.showToast(msg: "no private note");
                        }
                      },
                    ): Container(),
                ],
              )
              
            ],
          ),
          SizedBox(
            height: config.App(context).appHeight(3),
          ),
          _isSearch == true
              ? Expanded(
                  child: _isPrivate == false                                    //public comments
                      ? FutureBuilder<MobileReviewModel>(
                          future: _con.searchReview(_phoneController.text
                              .replaceAll(new RegExp(r"\s+\b|\b\s"), "")),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.status == false) {
                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            config.App(context).appHeight(10),
                                      ),
                                      Text(
                                        "${_phoneController.text}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            config.App(context).appHeight(5),
                                      ),
                                      Text(
                                        "There are no private notes for \nthis number",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            config.App(context).appHeight(4),
                                      ),
                                      Container( 
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        child: FlatButton(
                                          padding: EdgeInsets.symmetric(
                                            vertical:
                                                config.App(context).appWidth(4),
                                            horizontal:
                                                config.App(context).appWidth(5),
                                          ),
                                          child: Text(
                                            "Add a private note",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          color: Theme.of(context).primaryColor,
                                          textColor: Colors.white,
                                          onPressed: () {
                                            // Navigator.of(context).push(
                                            //   new MaterialPageRoute(
                                            //     builder:
                                            //         (BuildContext context) =>
                                            //             CallerRatingScreen(
                                            //       mobileNumber:
                                            //           _phoneController.text,
                                            //     ),
                                            //   ),
                                            // );
                                            addNewPrivateNote(context, _phoneController.text);
                                          },
                                        )
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      snapshot.data.reviewLists.length != 0
                                          ? Divider(
                                              color:
                                                  Theme.of(context).hintColor,
                                            )
                                          : SizedBox(),
                                      ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount:
                                            snapshot.data.reviewLists.length,
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: 10,
                                            child: Divider(
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          );
                                        },
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            leading: CircleAvatar(
                                              radius: 30,
                                              backgroundColor: snapshot
                                                          .data
                                                          .reviewLists[index]
                                                          .type ==
                                                      "Negative"
                                                  ? Theme.of(context)
                                                      .accentColor
                                                  : snapshot
                                                              .data
                                                              .reviewLists[
                                                                  index]
                                                              .type ==
                                                          "Positive"
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Colors.orange,
                                              child: CircleAvatar(
                                                radius: 22,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.person,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  size: 35,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              "${snapshot.data.reviewLists[index].mobileNo}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14,
                                              ),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Icon(
                                                  Icons.chat_outlined,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "1 comments",
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                            trailing: IconButton(
                                              icon: Icon(
                                                Icons.remove_red_eye,
                                                color:
                                                    Theme.of(context).hintColor,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  new MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        PubCommentScreen(
                                                      mobileNumber: snapshot
                                                          .data
                                                          .reviewLists[index]
                                                          .mobileNo,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            onTap: () {
                                              Navigator.of(context).push(
                                                new MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          CallerReviewScreen(
                                                    mobileNumber: snapshot
                                                        .data
                                                        .reviewLists[index]
                                                        .mobileNo,
                                                    ratingCategory: snapshot
                                                        .data
                                                        .reviewLists[index]
                                                        .ratting,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      snapshot.data.reviewLists.length != 0
                                          ? Divider(
                                              color:
                                                  Theme.of(context).hintColor,
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                );
                              }
                            } else if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            }

                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        )
                      : FutureBuilder<PrivateReviewModel>(                    //private search note
                          future: _con.getSearchPrivateReviewList(_phoneController.text
                              .replaceAll(new RegExp(r"\s+\b|\b\s"), "")),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              private_note_count = private_note_count + snapshot.data.privateLists.length;
                              if(snapshot.data.privateLists.length > 0){
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    snapshot.data.privateLists.length != 0
                                        ? Divider(
                                            color: Theme.of(context).hintColor,
                                          )
                                        : SizedBox(),
                                    ListView.separated(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount:
                                          snapshot.data.privateLists.length,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 10,
                                          child: Divider(
                                            color: Theme.of(context).hintColor,
                                          ),
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                          ),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              radius: 22,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.person,
                                                color:
                                                    Theme.of(context).hintColor,
                                                size: 35,
                                              ),
                                            ),
                                            title: Text(
                                              "${snapshot.data.privateLists[index].mobileNo.replaceAll(new RegExp(r"\s+\b|\b\s"), "")}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14,
                                              ),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Icon(
                                                  Icons.chat_outlined,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  width: 150,
                                                  child:Text(
                                                    "${snapshot.data.privateLists[index].comment}",
                                                    style: TextStyle(color: Theme.of(context).hintColor,fontSize: 12,),
                                                    maxLines: 20,
                                                  )
                                                )
                                              ],
                                            ),
                                            trailing: Wrap(
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.edit,
                                                    size: 20,
                                                    color:
                                                        Theme.of(context).hintColor,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _commentController.text =
                                                          snapshot
                                                              .data
                                                              .privateLists[index]
                                                              .comment;
                                                    });
                                                    showDialog(
                                                        builder: (BuildContext context){
                                                          return new Dialog(
                                                            child: ConstrainedBox(
                                                              constraints:
                                                                  BoxConstraints(
                                                                      maxHeight:
                                                                          300.0),
                                                              child: new Column(
                                                                children: <Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            30.0,
                                                                        vertical:
                                                                            20.0),
                                                                    child: Text(
                                                                      'Private Note',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontFamily:
                                                                            "Muli",
                                                                        fontSize: 20,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .symmetric(
                                                                      horizontal:
                                                                          20.0,
                                                                      vertical: 20,
                                                                    ),
                                                                    child: Divider(
                                                                      height: 10,
                                                                      indent: 5,
                                                                      endIndent: 5,
                                                                      color:
                                                                          Colors.grey,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .symmetric(
                                                                      horizontal: 20,
                                                                    ),
                                                                    child: Align(
                                                                      alignment: Alignment
                                                                          .centerLeft,
                                                                      child: RichText(
                                                                        text:
                                                                            TextSpan(
                                                                          style:
                                                                              TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .w400,
                                                                          ),
                                                                          children: <
                                                                              TextSpan>[
                                                                            TextSpan(
                                                                              text:
                                                                                  "Note ",
                                                                              style:
                                                                                  TextStyle(
                                                                                fontWeight:
                                                                                    FontWeight.bold,
                                                                                fontSize:
                                                                                    20,
                                                                              ),
                                                                            ),
                                                                            TextSpan(
                                                                              text:
                                                                                  "*",
                                                                              style:
                                                                                  TextStyle(
                                                                                color:
                                                                                    Theme.of(context).accentColor,
                                                                                fontSize:
                                                                                    20,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                                .only(
                                                                            left: 20,
                                                                            bottom:
                                                                                10,
                                                                            right:
                                                                                20),
                                                                    child:
                                                                        new TextField(
                                                                      controller:
                                                                          _commentController,
                                                                      autofocus:
                                                                          false,
                                                                      decoration:
                                                                          new InputDecoration(
                                                                              hintText:
                                                                                  "Enter your private note"),
                                                                      // controller: pnorecc,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                                .only(
                                                                            top:
                                                                                20.0),
                                                                    child:
                                                                        ButtonTheme(
                                                                      minWidth: config
                                                                              .App(
                                                                                  context)
                                                                          .appWidth(
                                                                              50),
                                                                      height: 50.0,
                                                                      child:
                                                                          RaisedButton(
                                                                        textColor:
                                                                            Colors
                                                                                .white,
                                                                        color: Colors
                                                                            .green,
                                                                        onPressed:
                                                                            () {
                                                                          _con.updatePrivateNote(
                                                                            snapshot
                                                                                .data
                                                                                .privateLists[
                                                                                    index]
                                                                                .mobileNo
                                                                                .replaceAll(
                                                                                    new RegExp(r"\s+\b|\b\s"),
                                                                                    ""),
                                                                            _commentController
                                                                                .text,
                                                                            snapshot
                                                                                .data
                                                                                .privateLists[
                                                                                    index]
                                                                                .privateCommentId,
                                                                          );
                                                                        },
                                                                        child:
                                                                            new Text(
                                                                          "SUBMIT",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                "Muli",
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        
                                                        context: context);
                                                  },
                                                ),
                                                IconButton(                             //delete private notes
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context, 
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: Text("Private Notes"),
                                                          content: Text("Are you sure you would like to delete this note?"),
                                                          actions: [
                                                            FlatButton(
                                                              onPressed: (){
                                                                Navigator.pop(context);
                                                              }, 
                                                              child: Text('Cancel')
                                                            ),
                                                            FlatButton(
                                                              onPressed: (){
                                                                Navigator.pop(context);
                                                                _con.deletePrivateNote(snapshot.data.privateLists[index].privateCommentId).then((status){
                                                                  if(status){
                                                                    setState(() {
                                                                      private_note_count = 0;
                                                                    });
                                                                  }
                                                                });

                                                              }, 
                                                              child: Text('Ok')
                                                            )
                                                          ],
                                                        );
                                                      }
                                                    );
                                                  },
                                                ),
                                              ]
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    snapshot.data.privateLists.length != 0
                                        ? Divider(
                                            color: Theme.of(context).hintColor,
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              );
                              }
                              else{
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Text('There are no private notes for \nthis number', textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ),),
                                      SizedBox(height: 10,),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        height: 50,
                                        child: FlatButton(
                                          onPressed: (){
                                            // Navigator.pop(context);
                                            addNewPrivateNote(context, _phoneController.text.replaceAll(new RegExp(r"\s+\b|\b\s"), ""));
                                          }, 
                                          child: Text('Add Private Notes',style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          color: Colors.white,
                                        )
                                      ),
                                    ],
                                  )
                                );                                 
                              }
                            } else if(snapshot.hasError){
                              
                              return Text(snapshot.error.toString());
                            }

                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                )
              : Expanded(
                  child: _isPrivate == false
                      ? FutureBuilder<ReviewModel>(
                          future: _con.getReviewModel(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    snapshot.data.reviewLists.length != 0
                                        ? Divider(
                                            color: Theme.of(context).hintColor,
                                          )
                                        : SizedBox(),
                                    ListView.separated(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount:
                                          snapshot.data.reviewLists.length,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 10,
                                          child: Divider(
                                            color: Theme.of(context).hintColor,
                                          ),
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: CircleAvatar(
                                            radius: 30,
                                            backgroundColor: snapshot
                                                        .data
                                                        .reviewLists[index]
                                                        .type ==
                                                    "Negative"
                                                ? Theme.of(context).accentColor
                                                : snapshot
                                                            .data
                                                            .reviewLists[index]
                                                            .type ==
                                                        "Positive"
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : Colors.orange,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: CircleAvatar(
                                                  radius: 22,
                                                  backgroundColor: Colors.white,
                                                  child: Icon(
                                                    Icons.person,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                    size: 35,
                                                  )),
                                            ),
                                          ),
                                          title: Text(
                                            "${snapshot.data.reviewLists[index].mobileNo.replaceAll(new RegExp(r"\s+\b|\b\s"), "")}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                            ),
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Icon(
                                                Icons.chat_outlined,
                                                color:
                                                    Theme.of(context).hintColor,
                                                size: 14,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "${snapshot.data.reviewLists[index].totalReview} comments",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  fontSize: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(
                                              Icons.remove_red_eye,
                                              size: 20,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                new MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          PubCommentScreen(
                                                    mobileNumber: snapshot
                                                        .data
                                                        .reviewLists[index]
                                                        .mobileNo,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          onTap: () {
                                            Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        CallerReviewScreen(
                                                  mobileNumber: snapshot
                                                      .data
                                                      .reviewLists[index]
                                                      .mobileNo
                                                      .replaceAll(
                                                          new RegExp(
                                                              r"\s+\b|\b\s"),
                                                          ""),
                                                  ratingCategory: snapshot
                                                      .data
                                                      .reviewLists[index]
                                                      .ratting,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    snapshot.data.reviewLists.length != 0
                                        ? Divider(
                                            color: Theme.of(context).hintColor,
                                          )
                                        : SizedBox(),
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
                        )
                      : FutureBuilder<PrivateReviewModel>(                      //private notes
                          future: _con.getPrivateReviewList(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              private_note_count = private_note_count + snapshot.data.privateLists.length;
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    snapshot.data.privateLists.length != 0
                                        ? Divider(
                                            color: Theme.of(context).hintColor,
                                          )
                                        : SizedBox(),
                                    ListView.separated(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount:
                                          snapshot.data.privateLists.length,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 10,
                                          child: Divider(
                                            color: Theme.of(context).hintColor,
                                          ),
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                          ),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              radius: 22,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.person,
                                                color:
                                                    Theme.of(context).hintColor,
                                                size: 35,
                                              ),
                                            ),
                                            title: Text(
                                              "${snapshot.data.privateLists[index].mobileNo.replaceAll(new RegExp(r"\s+\b|\b\s"), "")}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14,
                                              ),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Icon(
                                                  Icons.chat_outlined,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  width: 150,
                                                  child: Text(
                                                    "${snapshot.data.privateLists[index].comment}",
                                                    style: TextStyle(color: Theme.of(context).hintColor,fontSize: 12,),
                                                    maxLines: 10,
                                                  )
                                                )
                                              ],
                                            ),
                                            trailing: Wrap(
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.edit,
                                                    size: 20,
                                                    color:
                                                        Theme.of(context).hintColor,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _commentController.text =
                                                          snapshot
                                                              .data
                                                              .privateLists[index]
                                                              .comment;
                                                    });
                                                    showDialog(
                                                        builder: (BuildContext context){
                                                          return new Dialog(
                                                            child: ConstrainedBox(
                                                              constraints:
                                                                  BoxConstraints(
                                                                      maxHeight:
                                                                          300.0),
                                                              child: new Column(
                                                                children: <Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            30.0,
                                                                        vertical:
                                                                            20.0),
                                                                    child: Text(
                                                                      'Private Note',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontFamily:
                                                                            "Muli",
                                                                        fontSize: 20,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .symmetric(
                                                                      horizontal:
                                                                          20.0,
                                                                      vertical: 20,
                                                                    ),
                                                                    child: Divider(
                                                                      height: 10,
                                                                      indent: 5,
                                                                      endIndent: 5,
                                                                      color:
                                                                          Colors.grey,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .symmetric(
                                                                      horizontal: 20,
                                                                    ),
                                                                    child: Align(
                                                                      alignment: Alignment
                                                                          .centerLeft,
                                                                      child: RichText(
                                                                        text:
                                                                            TextSpan(
                                                                          style:
                                                                              TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .w400,
                                                                          ),
                                                                          children: <
                                                                              TextSpan>[
                                                                            TextSpan(
                                                                              text:
                                                                                  "Note ",
                                                                              style:
                                                                                  TextStyle(
                                                                                fontWeight:
                                                                                    FontWeight.bold,
                                                                                fontSize:
                                                                                    20,
                                                                              ),
                                                                            ),
                                                                            TextSpan(
                                                                              text:
                                                                                  "*",
                                                                              style:
                                                                                  TextStyle(
                                                                                color:
                                                                                    Theme.of(context).accentColor,
                                                                                fontSize:
                                                                                    20,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                                .only(
                                                                            left: 20,
                                                                            bottom:
                                                                                10,
                                                                            right:
                                                                                20),
                                                                    child:
                                                                        new TextField(
                                                                      controller:
                                                                          _commentController,
                                                                      autofocus:
                                                                          false,
                                                                      decoration:
                                                                          new InputDecoration(
                                                                              hintText:
                                                                                  "Enter your private note"),
                                                                      // controller: pnorecc,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                                .only(
                                                                            top:
                                                                                20.0),
                                                                    child:
                                                                        ButtonTheme(
                                                                      minWidth: config
                                                                              .App(
                                                                                  context)
                                                                          .appWidth(
                                                                              50),
                                                                      height: 50.0,
                                                                      child:
                                                                          RaisedButton(
                                                                        textColor:
                                                                            Colors
                                                                                .white,
                                                                        color: Colors
                                                                            .green,
                                                                        onPressed:
                                                                            () {
                                                                          _con.updatePrivateNote(
                                                                            snapshot
                                                                                .data
                                                                                .privateLists[
                                                                                    index]
                                                                                .mobileNo
                                                                                .replaceAll(
                                                                                    new RegExp(r"\s+\b|\b\s"),
                                                                                    ""),
                                                                            _commentController
                                                                                .text,
                                                                            snapshot
                                                                                .data
                                                                                .privateLists[
                                                                                    index]
                                                                                .privateCommentId,
                                                                          );
                                                                        },
                                                                        child:
                                                                            new Text(
                                                                          "SUBMIT",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                "Muli",
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        
                                                        context: context);
                                                  },
                                                ),
                                                IconButton(                             //delete private notes
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context, 
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: Text("Private Notes"),
                                                          content: Text("Are you sure you would like to delete this note?"),
                                                          actions: [
                                                            FlatButton(
                                                              onPressed: (){
                                                                Navigator.pop(context);
                                                              }, 
                                                              child: Text('Cancel')
                                                            ),
                                                            FlatButton(
                                                              onPressed: (){
                                                                Navigator.pop(context);
                                                                _con.deletePrivateNote(snapshot.data.privateLists[index].privateCommentId).then((status){
                                                                  if(status){
                                                                    setState(() {
                                                                      private_note_count = 0;
                                                                    });
                                                                  }
                                                                });

                                                              }, 
                                                              child: Text('Ok')
                                                            )
                                                          ],
                                                        );
                                                      }
                                                    );
                                                  },
                                                ),
                                              ]
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    snapshot.data.privateLists.length != 0
                                        ? Divider(
                                            color: Theme.of(context).hintColor,
                                          )
                                        : SizedBox(),
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
                ),
        ],
      ),
    );
  }

  void addNewPrivateNote(BuildContext context, String mobileNo){
    showDialog(
      builder: (BuildContext context){
        return Dialog(
          child: Container(
            height: 400,
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20.0),
                  child: Text(
                    'Private Note',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Muli",
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20,
                  ),
                  child: Divider(
                    height: 10,
                    indent: 5,
                    endIndent: 5,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Note ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, bottom: 10, right: 20),
                  child: new TextField(
                    controller: _commentController,
                    autofocus: true,
                     maxLines: 4,
                    decoration: new InputDecoration(
                        hintText: "Enter your private note"),
                    // controller: pnorecc,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ButtonTheme(
                    minWidth: config.App(context).appWidth(50),
                    height: 50.0,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      onPressed: () {
                        _con.addPrivateNote(mobileNo,
                            _commentController.text);
                      },
                      child: new Text(
                        "SUBMIT",
                        style: TextStyle(
                          fontFamily: "Muli",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      
      context: context);
  }
}
