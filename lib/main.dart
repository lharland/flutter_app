import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:map_view/map_view.dart';

void main() {
   MapView.setApiKey("AIzaSyDT8-ttxGcKLv7LyC62JcSgT2TBYnXvfFw");
     runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: new HomePage(),
    );
  }

     var _mapView = new MapView();

    
    //Add a method to call to show the map.
    void showMap() {
        _mapView.show(new MapOptions(showUserLocation: true));
    }
}
