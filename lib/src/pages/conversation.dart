import 'dart:async';

import 'package:advisor/src/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:bubble/bubble.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/app_config.dart' as config;
import '../models/chat.dart';
import '../controllers/chat_controller.dart';

class ConversationScreen extends StatefulWidget {
  final String senderId;
  final String receiverId;
  final String profile;
  final String mobile;
  final String name;
  final String device_token;

  const ConversationScreen(
      {Key key,
      this.senderId,
      this.receiverId,
      this.profile,
      this.mobile,
      this.device_token,
      this.name})
      : super(key: key);
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends StateMVC<ConversationScreen> {
  ChatController _con;
  Timer timer;
  int prev_ChatLength = 0;
  List<Chat> chat_list = [];
  SharedPreferences prefs;
  bool background_status = false;

  _ConversationScreenState() : super(ChatController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    // print("----senderid:${widget.senderId}");
    // print("----receiverId:${widget.receiverId}");
    setChatHistoryLength();
    const oneSec = const Duration(seconds: 5);

    timer = Timer.periodic(oneSec, (timer) {
      if(background_status == false){
        _con.getChatReviewList(widget.receiverId, widget.mobile);
        setState(() {
        });
      }
    });
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        setState(() {
          background_status = false;
        });
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        setState(() {
          background_status = true;
        });
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  Future<void> setChatHistoryLength() async {
    prefs =  await SharedPreferences.getInstance();
  }

  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        KeyboardDismisser(
          gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
          child: Scaffold(
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
              title: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: widget.profile.isEmpty
                        ? Icon(
                            Icons.person,
                            color: Theme.of(context).hintColor,
                            size: 35,
                          )
                        : Image.network(widget.profile),
                  ),
                  SizedBox(
                    width: config.App(context).appWidth(5),
                  ),
                  Text(
                    "${widget.name}",
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                FutureBuilder(
                  future: _con.getChatReviewList(
                    widget.receiverId,
                    widget.mobile,
                  ),
                  builder: (context, AsyncSnapshot<List<Chat>> snapshot) {
                    if (snapshot.hasData) {
                      int current_length = 0;
                      for(int i = 0; i < snapshot.data.length; i++){
                        if(widget.senderId == snapshot.data[i].receiverId){
                          current_length = current_length + 1;
                        }
                      }
                      if(prefs.containsKey('chat_length') != null && prefs.containsKey('chat_length')){
                        int chat_length = prefs.getInt("chat_length");
                        if(chat_length != current_length){
                          prefs.setInt("chat_length", current_length);
                          
                          // NotificationService.showNotification("new message arrived");
                        }
                      }
                      else{
                        prefs.setInt("chat_length", current_length);
                      }
                      
                      return buildList(snapshot);
                    } else if (snapshot.hasError) {
                      // return Text(snapshot.error.toString());
                      return Container();
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                Positioned(
                  left: 15.0,
                  bottom: MediaQuery.of(context).padding.bottom + 18,
                  right: 15.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Color.fromRGBO(224, 224, 224, 1),
                      ),
                      color: Color(0xFF232121),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: TextField(
                              autofocus: false,
                              maxLines: null,
                              textCapitalization: TextCapitalization.sentences,
                              onChanged: (value) {},
                              controller: messageController,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Send a message...',
                              ),
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(Icons.send),
                          iconSize: 29.0,
                          color: Colors.white,
                          onPressed: () async {
                            _con.sendMsg(
                              widget.receiverId, 
                              widget.mobile,
                              messageController.text,
                              widget.device_token,
                              widget.name
                            );
                            messageController.clear();
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildList(AsyncSnapshot<List<Chat>> snapshot) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 85.0,
        left: 10,
        right: 10,
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        reverse: true,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          int myIndex = snapshot.data.length - index - 1;
          return Container(
            child: snapshot.data[myIndex].senderId == widget.senderId
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Bubble(
                        margin: BubbleEdges.only(top: 4, right: 50, bottom: 8),
                        alignment: Alignment.topLeft,
                        elevation: 0.0,
                        color: Colors.white.withOpacity(0.1),
                        radius: Radius.circular(10),
                        nip: BubbleNip.leftTop,
                        child: Column(
                          children: [
                            Text(
                              snapshot.data[myIndex].message,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SFProDisplayMedium',
                                  fontSize: 16.5),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        snapshot.data[myIndex].sendDate,
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      SizedBox(
                        height: config.App(context).appHeight(2),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Bubble(
                        margin: BubbleEdges.only(top: 4, left: 50, bottom: 8),
                        alignment: Alignment.topRight,
                        nip: BubbleNip.rightTop,
                        color: Theme.of(context).primaryColor,
                        elevation: 0.0,
                        radius: Radius.circular(10),
                        child: Text(
                          snapshot.data[myIndex].message,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'SFProDisplayRegular',
                              fontSize: 16.5,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        snapshot.data[myIndex].sendDate,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      SizedBox(
                        height: config.App(context).appHeight(2),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
