import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:intl/intl.dart';
import '../controllers/ratting_controller.dart';
// import 'package:contacts_service/contacts_service.dart';

import '../helpers/app_config.dart' as config;
import '../repository/ratting_repository.dart' as repository;
import 'caller_review_screen.dart';

class HistoryWidget extends StatefulWidget {
  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends StateMVC<HistoryWidget> {
  RattingController _con;

  _HistoryWidgetState() : super(RattingController()) {
    _con = controller;
  }

  Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];

  // Iterable<Contact> _contacts = <Contact>[];

  // void getAllContacts() async {
  //   final Iterable<Contact> result = await ContactsService.getContacts();
  //   setState(() {
  //     _contacts = result;
  //   });
  // }

  void getCallLogEntry() async {
    final Iterable<CallLogEntry> result = await CallLog.query();
    setState(() {
      _callLogEntries = result;
    });
  }

  @override
  void initState() {
    super.initState();
    getCallLogEntry();
    // getAllContacts();
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
        itemCount: _callLogEntries.length,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
            child: Divider(
              color: Theme.of(context).hintColor,
            ),
          );
        },
        itemBuilder: (context, index) {
          return FutureBuilder(
              future: repository.searchReview(_callLogEntries
                  .elementAt(index)
                  .number
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
                      _callLogEntries.elementAt(index).name != null ? _callLogEntries.elementAt(index).name : _callLogEntries.elementAt(index).number,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).hintColor,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          _callLogEntries.elementAt(index).callType ==
                                  CallType.outgoing
                              ? Icons.phone_forwarded_outlined
                              : _callLogEntries.elementAt(index).callType ==
                                      CallType.incoming
                                  ? Icons.phone_callback_outlined
                                  : Icons.phone_missed_outlined,
                          color: Theme.of(context).hintColor,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            "${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(_callLogEntries.elementAt(index).timestamp))} \t"
                            "${_callLogEntries.elementAt(index).number}",
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
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${DateFormat('MM-dd-yyyy').format(DateTime.fromMillisecondsSinceEpoch(_callLogEntries.elementAt(index).timestamp))}",
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => CallerReviewScreen(
                            mobileNumber:
                                _callLogEntries.elementAt(index).number,
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
                      _callLogEntries.elementAt(index).name != null ? _callLogEntries.elementAt(index).name : _callLogEntries.elementAt(index).number,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).hintColor,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          _callLogEntries.elementAt(index).callType ==
                                  CallType.outgoing
                              ? Icons.phone_forwarded_outlined
                              : _callLogEntries.elementAt(index).callType ==
                                      CallType.incoming
                                  ? Icons.phone_callback_outlined
                                  : Icons.phone_missed_outlined,
                          color: Theme.of(context).hintColor,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            "${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(_callLogEntries.elementAt(index).timestamp))} \t"
                            "${_callLogEntries.elementAt(index).number}",
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
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${DateFormat('MM-dd-yyyy').format(DateTime.fromMillisecondsSinceEpoch(_callLogEntries.elementAt(index).timestamp))}",
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      if (snapshot.data['status'] == false) {
                        Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CallerReviewScreen(
                              mobileNumber:
                                  _callLogEntries.elementAt(index).number,
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
