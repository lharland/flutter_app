import 'package:flutter/material.dart';
import 'package:flutter_app/models/trip_model.dart';

class TripListItem extends StatelessWidget {
  final TripInfo _trip;

  TripListItem(this._trip);

  @override
  Widget build(BuildContext context) {
    return new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      new Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        new Expanded(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  decoration: new BoxDecoration(
                    color: Colors.black45,
                  ),
                  child: new Text(
                    _trip.completed,
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ]),
        ),
        new Text(
          _trip.date,
          style: new TextStyle(color: Colors.grey, fontSize: 14.0),
        ),
      ]),
      new Container(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: new Column(children: <Widget>[
            new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Icon(Icons.send),
                  new Expanded(
                      child: new Row(children: <Widget>[
                    new Text(
                      _trip.pickupLocation,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])),
                ]),
            new Row(children: <Widget>[
              new Icon(Icons.send),
              new Text(
                _trip.destLocation,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ])
          ])),
      new Row(children: <Widget>[
        new Expanded(
            child: new Container(
                child: new Row(children: <Widget>[
          new Icon(
            Icons.timer,
            color: Colors.grey,
          ),
          new Text(_trip.time,
              style: new TextStyle(color: Colors.grey, fontSize: 14.0)),
          new Icon(Icons.local_car_wash, color: Colors.grey),
          new Text(_trip.className,
              style: new TextStyle(color: Colors.grey, fontSize: 14.0)),
        ]))),
        new Icon(Icons.credit_card, color: Colors.grey),
        new Text(_trip.payBy,
            style: new TextStyle(color: Colors.grey, fontSize: 14.0)),
      ])
    ]);
  }
}
