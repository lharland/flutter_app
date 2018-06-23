// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';
// @required is defined in the meta.dart package
import 'package:meta/meta.dart';

// We use an underscore to indicate that these variables are private.
// See https://www.dartlang.org/guides/language/effective-dart/design#libraries
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  final String name;
  final String dateStart;
  final String dateEnd;
  final String promoCode;
  final bool isActive;
  final IconData iconLocation;

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // While the @required checks for whether a named parameter is passed in,
  // it doesn't check whether the object passed in is null. We check that
  // in the assert statement.
  const Category({
    Key key,
    @required this.name,
    this.dateStart,
    this.dateEnd,
    @required this.isActive,
    @required this.promoCode,
    @required this.iconLocation,
  })  : assert(name != null),
        assert(promoCode != null),
        assert(isActive != null),
        assert(iconLocation != null),
        super(key: key);

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
            height: _rowHeight,
            child: InkWell(
                borderRadius: _borderRadius,
                // highlightColor: color,
                // splashColor: color,
                // We can use either the () => function() or the () { function(); }
                // syntax.
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: new Row(
          
                        children: <Widget>[
                          Icon(
                            iconLocation,
                            size: 70.0,
                          ),
                          Expanded(
                            
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                name,
                                style: new TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                
                                dateStart + "-" + dateEnd,
                                               textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.subhead,
                              ),
                              new Container(
                                decoration: new BoxDecoration(
                                  color: isActive == true
                                      ? Colors.green[300]
                                      : Colors.grey,
                                ),
                                child: new Text(
                                  promoCode,
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ))
                        ])))));
  }
}
