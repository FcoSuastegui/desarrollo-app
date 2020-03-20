import 'package:flutter/material.dart';
import 'dart:async';

import 'package:midesarrollo/src/stream/stream_notification.dart';
 
class NotificationsTemplate extends StatefulWidget {
  @override
  _NotificationsTemplateState createState() => _NotificationsTemplateState();
}

class _NotificationsTemplateState extends State<NotificationsTemplate> {
  final _streamNoti = new StreamNotification();
  StreamSubscription streamSubscription;

  int _counter = 0;

  void initState() {
    streamSubscription = _streamNoti.notificationUpdate.listen((value) => setState(() {
       _counter = value;
    }));

    super.initState();
  }

  @override
  void dispose() {
      streamSubscription?.cancel();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
        new IconButton(icon: Icon(Icons.notifications), onPressed: () {
          setState(() {
            //_streamNoti.notificationCounter(0);
          });
        }),
        _counter != 0 ? new Positioned(
          right: 11,
          top: 11,
          child: new Container(
            padding: EdgeInsets.all(2),
            decoration: new BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Text(
              '$_counter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ) : new Container()
      ],
    );
  }
}