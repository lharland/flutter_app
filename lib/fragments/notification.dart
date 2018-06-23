import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationFragment extends StatefulWidget {
  @override
  NotificationState createState() {
    return new NotificationState();
  }
}

class NotificationState extends State<NotificationFragment> {
  ShapeBorder _shape;
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.all(8.0),
        height: 300.0,
        child: new Card(
          shape: _shape,
          child: new Align(
            alignment: Alignment.topCenter,
            child: 
              // photo and title
              new ListView.builder(
                  itemCount: dummyData.length,
                  itemBuilder: (context, i) => new Column(children: <Widget>[
                        new Divider(
                          height: 10.0,
                        ),
                        new ListTile(
                          leading: new CircleAvatar(
                            foregroundColor: Theme.of(context).primaryColor,
                            backgroundColor: Colors.grey,
                            backgroundImage:
                                new NetworkImage(dummyData[i].icon),
                          ),
                          title: new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  dummyData[i].title,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                          subtitle: new Container(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: new Text(
                              dummyData[i].title,
                              style: new TextStyle(
                                  color: Colors.grey, fontSize: 15.0),
                            ),
                          ),
                        )
                      ]))
            
          ),
          
        )
        );
  }
}
