import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../helpers/app_config.dart' as config;
import '../controllers/chat_controller.dart';
import '../repository/chat_repository.dart' as chatRepo;
import '../models/chat.dart';
import 'conversation.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends StateMVC<ChatListScreen> {
  ChatController _con;
  _ChatListScreenState() : super(ChatController()) {
    _con = controller;
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
          "Chat",
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
          ),
        ),
      ),
      body: FutureBuilder(
        future: chatRepo.getChatList(),
        builder: (context, AsyncSnapshot<List<Chat>> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: config.App(context).appWidth(5),
                vertical: config.App(context).appHeight(3),
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemCount: snapshot.data.length,
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
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: snapshot.data[index].profile.isEmpty
                        ? Icon(
                            Icons.person,
                            color: Theme.of(context).hintColor,
                            size: 35,
                          )
                        : Image.network(snapshot.data[index].profile),
                  ),
                  title: Text(
                    "${snapshot.data[index].name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Re: ${snapshot.data[index].chatNumber}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _con.deleteChat(snapshot.data[index].receiverId,
                          snapshot.data[index].chatNumber);
                    },
                  ),
                  onTap: () {
                    print("senderId: ${snapshot.data[index].senderId}");
                    print("receiverId: ${snapshot.data[index].receiverId}");
                    print("profile: ${snapshot.data[index].profile}");
                    print("mobile: ${snapshot.data[index].chatNumber}");
                    print("name: ${snapshot.data[index].name}");
                    print("device: ${snapshot.data[index].device_token}");
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => ConversationScreen(
                          senderId: snapshot.data[index].senderId,
                          receiverId: snapshot.data[index].receiverId,
                          profile: snapshot.data[index].profile,
                          mobile: snapshot.data[index].chatNumber,
                          name: snapshot.data[index].name,
                          device_token: snapshot.data[index].device_token,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            // return Text(snapshot.error.toString());
            return SizedBox();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
