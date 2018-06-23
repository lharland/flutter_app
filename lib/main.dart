import 'package:flutter/material.dart';
import 'package:flutter_app/fragments/booking.dart';
import 'package:flutter_app/fragments/startrequest.dart';
import 'package:flutter_app/pages/home_page.dart';

void main() {
   //MapView.setApiKey("AIzaSyDT8-ttxGcKLv7LyC62JcSgT2TBYnXvfFw");
     runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Taxi App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: new StartRequestScreen(),
         routes: <String, WidgetBuilder> {
      '/booking': (BuildContext context) => new BookingScreen(),
    },
    );
  }

}
