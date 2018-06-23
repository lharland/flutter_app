// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/dialogitem.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class StartRequestScreen extends StatefulWidget {
  static const String routeName = '/material/persistent-bottom-sheet';

  @override
  StartRequestState createState() => new StartRequestState();
}

class StartRequestState extends State<StartRequestScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  VoidCallback _showBottomSheetCallback;

  Map<String, double> _startLocation;
  Map<String, double> _currentLocation;

  StreamSubscription<Map<String, double>> _locationSubscription;

  Location _location = new Location();
  String error;

  bool currentWidget = true;

  Image image1;

  @override
  void initState() {
    super.initState();

    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged.listen((Map<String, double> result) {
      setState(() {
        _currentLocation = result;
      });
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      location = await _location.getLocation;

      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
      _startLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets;

    if (_currentLocation == null) {
      widgets = new List();
    } else {
      widgets = [
        new Expanded(
            child: new Column(
              children: <Widget>[
Image.network(
          "https://maps.googleapis.com/maps/api/staticmap?center=${_currentLocation["latitude"]},${_currentLocation["longitude"]}&zoom=18&size=640x400&key=AIzaSyDT8-ttxGcKLv7LyC62JcSgT2TBYnXvfFw",
          fit: BoxFit.fill),
              ],
            ) 
        )

      ];
    }

    // widgets.add(new Center(
    //     child: new Text(_startLocation != null
    //         ? 'Start location: $_startLocation\n'
    //         : 'Error: $error\n')));

    // widgets.add(new Center(
    //     child: new Text(_currentLocation != null
    //         ? 'Continuous location: $_currentLocation\n'
    //         : 'Error: $error\n')));
    widgets.add(DriverSheet());
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Example 1 Page"),
        ),
        body: new Padding(
            padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            child: new Container(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: widgets))));
  }

  void _showMessage() {
    final ThemeData theme = Theme.of(context);
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
            title: const Text('Set backup account'),
            children: <Widget>[
              new DialogItem(
                  icon: Icons.account_circle,
                  color: theme.primaryColor,
                  text: 'Economy',
                  onPressed: () {
                    Navigator.pop(context, 'username@gmail.com');
                  }),
              new DialogItem(
                  icon: Icons.account_circle,
                  color: theme.primaryColor,
                  text: 'Large',
                  onPressed: () {
                    Navigator.pop(context, 'user02@gmail.com');
                  }),
              new DialogItem(
                  icon: Icons.add_circle,
                  text: 'Premium',
                  color: theme.disabledColor)
            ]);
      },
    );
  }
}

String _defaultClass = 'Economy';
List<String> className = ['Economy', 'Large', 'Premium'];

class DriverSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return new Container(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Icon(Icons.traffic),
                //buildDropdownButton()
              ],
            )
          ],
        ));
  }

  Widget buildDropdownButton() {
    String dropdown1Value = 'Free';
    return new Padding(
      padding: const EdgeInsets.all(24.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new ListTile(
            title: const Text('Simple dropdown:'),
            trailing: new DropdownButton<String>(
              value: dropdown1Value,
              onChanged: (String newValue) {
                //setState(() { dropdown1Value = newValue; });
              },
              items: <String>['One', 'Two', 'Free', 'Four'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
