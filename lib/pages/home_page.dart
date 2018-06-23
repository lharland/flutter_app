import 'package:flutter_app/fragments/booking.dart';
import 'package:flutter_app/fragments/notification.dart';
import 'package:flutter_app/fragments/payment.dart';
import 'package:flutter_app/fragments/promo.dart';
import 'package:flutter_app/fragments/helpcenter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/fragments/promo_category.dart';
import 'package:flutter_app/fragments/startrequest.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Booking", Icons.rss_feed),
    new DrawerItem("Notification", Icons.local_pizza),
    new DrawerItem("Payment", Icons.info),
    new DrawerItem("Coupon", Icons.info),
    new DrawerItem("Help Center", Icons.info),
    new DrawerItem("Settings", Icons.info),
    new DrawerItem("About", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos, BuildContext context) {
    switch (pos) {
      case 0:
        return new BookingScreen();
      case 1:
        return new NotificationFragment();
      case 2:
        return new PaymentFragment();
      case 3:
        return new PromoFragment1();
      case 4:
        return new HelpCenter();
      default:
        return new StartRequestScreen();
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("John Doe"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex, context),
    );
  }
}
