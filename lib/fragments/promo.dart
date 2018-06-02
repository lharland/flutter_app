// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter_app/category.dart';

final _backgroundColor = Colors.grey[100];

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class PromoFragment extends StatelessWidget {
  const PromoFragment();


  
  // static const _baseColors = <Color>[
  //   Colors.teal,
  //   Colors.orange,
  //   Colors.pinkAccent,
  //   Colors.blueAccent,
  //   Colors.yellow,
  //   Colors.greenAccent,
  //   Colors.purpleAccent,
  //   Colors.red,
  // ];

  /// Makes the correct number of rows for the list view.
  ///
  /// For portrait, we construct a [ListView] from the list of category widgets.
  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

  
      categories.add(Category(
        name: '5% Off Ride Economy class',
        dateStart: '4/5/2018',
        dateEnd: '5/5/2017',
        iconLocation: Icons.cake,
      ));


      categories.add(Category(
        name: '214',
        dateStart: '4/5/2018',
        dateEnd: '5/5/2017',
        iconLocation: Icons.cake,
      ));
  

    final listView = Container(
      color: Colors.white10,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Unit Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
