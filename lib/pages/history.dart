import 'package:flutter/material.dart';
import 'package:flutter_app/TripList.dart';
import 'package:flutter_app/trip_data.dart';

class HistoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("History"),
        ),
        body: new TripList(dummyTrips)
      );
  }

}