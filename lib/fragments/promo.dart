// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/promo_data.dart';

final _backgroundColor = Colors.grey[100];

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class PromoFragment1 extends StatelessWidget {
  const PromoFragment1();


  
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
    
  

    final listView = Container(
      color: Colors.white10,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    final appBar = AppBar(
      elevation: 0.0,

      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      body: listView,
    );
  }
}
