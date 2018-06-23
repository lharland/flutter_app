import 'package:flutter/material.dart';
import 'package:flutter_app/models/category.dart';

final categories = <Category>[

  
       Category(
        name: '5% Off Ride Economy class',
        dateStart: '4/5/2018',
        dateEnd: '5/5/2017',
        isActive: true,
        promoCode: "124",
        iconLocation: Icons.code,
       ),


      Category(
        name: '214',
        dateStart: '4/5/2018',
        dateEnd: '5/5/2017',
        promoCode: "asfaf",
        isActive: false,
        iconLocation: Icons.code,
      )

];