import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:sms/contact.dart';
// import 'package:sms/sms.dart';

import '../helpers/app_config.dart' as config;
import '../repository/ratting_repository.dart' as repository;
import 'sms_review_screen.dart';

class SMSWidget extends StatefulWidget {
  @override
  _SMSWidgetState createState() => _SMSWidgetState();
}

class _SMSWidgetState extends StateMVC<SMSWidget> {
  List<SmsMessage> messages = [];
  SmsQuery query = new SmsQuery();
  List<Contact> contact_list = [];
  List<String> received_sms_list = [];
  List<String> address_list = [];


  @override
  void initState() {
    super.initState();
    getAllSmsMessage();
  }

  void getAllSmsMessage() async {
    List<SmsMessage> result = await query.querySms(kinds: [SmsQueryKind.Inbox]); //query.querySms(kinds: [SmsQueryKind.Inbox, SmsQueryKind.Sent]);
    setState(() {
      contact_list = [];
      messages = result;
      for(int i = 0; i < messages.length; i++){
        ContactQuery contacts = new ContactQuery();
        contacts.queryContact(messages[i].address).then((value){
          // contact_list.add(value);
          if(contact_list.length > 0){
            int repeat_address = 0;
            for(int j = 0; j < contact_list.length; j++){
              if(contact_list[j].address == messages[i].address){
                repeat_address = repeat_address + 1;
                break;
              }
            }
            if(repeat_address < 1){
              contact_list.add(value);
              received_sms_list.add(messages[i].body);
              address_list.add(messages[i].address);
            }
          }
          else{
            contact_list.add(value);
            received_sms_list.add(messages[i].body);
            address_list.add(messages[i].address);
          }
        });
      }
    });
    
    // await query.getAllSms.then((value){
    //   messages = value;
    //   print("-----sms_history:${messages[4].toMap}");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: config.App(context).appHeight(2),
      ),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        itemCount: contact_list.length,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 15,
            child: Divider(
              color: Theme.of(context).hintColor,
            ),
          );
        },
        itemBuilder: (context, index) {
          return FutureBuilder(
              future: repository.searchReview(messages
                  .elementAt(index)
                  .address
                  .replaceAll(new RegExp(r"\s+\b|\b\s"), "")),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data['status']) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: snapshot.data['reviews'][0]['Type'] ==
                              "Negative"
                          ? Theme.of(context).accentColor
                          : snapshot.data['reviews'][0]['Type'] == "Positive"
                              ? Theme.of(context).primaryColor
                              : Colors.orange,
                      child: GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              color: Theme.of(context).hintColor,
                              size: 35,
                            )),
                      ),
                    ),
                    title: Text(
                      contact_list.elementAt(index).fullName != null ? contact_list.elementAt(index).fullName : contact_list.elementAt(index).address,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).hintColor,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: Text(
                            // "${messages.elementAt(index).body}",
                            "${received_sms_list[index]}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 10,
                            ),
                          ),
                        )
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Theme.of(context).hintColor,
                          size: 18,
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => SMSReviewScreen(
                            // mobileNumber: messages.elementAt(index).address,
                            mobileNumber: address_list[index],
                            ratingCategory: snapshot.data['reviews'][0]
                                ['Ratting'],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Theme.of(context).hintColor,
                        size: 35,
                      ),
                    ),
                    title: Text(
                      contact_list.elementAt(index).fullName != null ? contact_list.elementAt(index).fullName : contact_list.elementAt(index).address,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).hintColor,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: Text(
                            // "${messages.elementAt(index).body}",
                            "${received_sms_list[index]}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 10,
                            ),
                          ),
                        )
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Theme.of(context).hintColor,
                          size: 18,
                        ),
                      ],
                    ),
                    onTap: () {
                      if (snapshot.data['status'] == false) {
                        Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) => SMSReviewScreen(
                              // mobileNumber: messages.elementAt(index).address,
                              mobileNumber: address_list[index],
                              ratingCategory: '',
                            ),
                          ),
                        );
                      }
                    },
                  );
                }
              });
        },
      ),
    );
  }
}
