import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controllers/ratting_controller.dart';
import '../helpers/app_config.dart' as config;
import 'conversation.dart';
import '../repository/user_repository.dart' as userRepo;

class PubCommentScreen extends StatefulWidget {
  final String mobileNumber;

  const PubCommentScreen({Key key, this.mobileNumber}) : super(key: key);
  @override
  _PubCommentScreenState createState() => _PubCommentScreenState();
}

class _PubCommentScreenState extends StateMVC<PubCommentScreen> {
  RattingController _con;

  _PubCommentScreenState() : super(RattingController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
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
          "Public Comments",
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
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
            height: config.App(context).appHeight(3),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: config.App(context).appWidth(3),
                vertical: config.App(context).appHeight(5),
              ),
              child: FutureBuilder(
                future: _con.searchReview(widget.mobileNumber),
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
                            itemCount: snapshot.data.reviewLists.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20,
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
                                              .data.reviewLists[index].type ==
                                          "Negative"
                                      ? Theme.of(context).accentColor
                                      : snapshot.data.reviewLists[index].type ==
                                              "Positive"
                                          ? Theme.of(context).primaryColor
                                          : Colors.orange,
                                  child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.white,
                                    child: snapshot.data.reviewLists[index]
                                            .profile.isEmpty
                                        ? Icon(
                                            Icons.person,
                                            color: Theme.of(context).hintColor,
                                            size: 35,
                                          )
                                        : Image.network(snapshot
                                            .data.reviewLists[index].profile),
                                  ),
                                ),
                                title: Text(
                                  "${snapshot.data.reviewLists[index].username}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Category:",
                                          style: TextStyle(
                                            color: Theme.of(context).hintColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${snapshot.data.reviewLists[index].categoryName}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Type:",
                                          style: TextStyle(
                                            color: Theme.of(context).hintColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${snapshot.data.reviewLists[index].ratting}",
                                          style: TextStyle(
                                            color: snapshot
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
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  "${snapshot.data.reviewLists[index].createdDate}",
                                  style: TextStyle(
                                      color: Theme.of(context).hintColor),
                                ),
                                onTap: () {
                                  if (userRepo.currentUser.value.userId ==
                                      snapshot.data.reviewLists[index].userId) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "You cannot sent message to yourself!");
                                  } else {
                                    Navigator.of(context).push(
                                      new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ConversationScreen(
                                          senderId:
                                              userRepo.currentUser.value.userId,
                                          receiverId: snapshot
                                              .data.reviewLists[index].userId,
                                          profile: snapshot
                                              .data.reviewLists[index].profile,
                                          mobile: widget.mobileNumber,
                                          name: snapshot
                                              .data.reviewLists[index].username,
                                        ),
                                      ),
                                    );
                                  }
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
