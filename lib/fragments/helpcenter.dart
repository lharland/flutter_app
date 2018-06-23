import 'package:flutter/material.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(new HelpCenter());
}

class HelpCenter extends StatefulWidget {
  HelpCenter({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HelpCenterState createState() => new HelpCenterState();
}

// Widget topImageDisplay(String value, BuildContext context) {
//   final ThemeData themeData = Theme.of(context);
//   return new Container(
//     padding: const EdgeInsets.symmetric(vertical: 16.0),
//     decoration: new BoxDecoration(
//         border:
//             new Border(bottom: new BorderSide(color: themeData.dividerColor))),
//     child: new DefaultTextStyle(
//       style: Theme.of(context).textTheme.subhead,
//       child: new SafeArea(
//         top: false,
//         bottom: false,
//         child: new Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // new Container(
//             //     padding: const EdgeInsets.symmetric(vertical: 24.0),
//             //     width: 72.0,
//             //     child: new Icon(icon, color: themeData.primaryColor)),
//             // new Expanded(child: new Column(children: children))
//           ],
//         ),
//       ),
//     ),
//   );
// }

enum AppBarBehavior { normal, pinned, floating, snapping }

class HelpCenterState extends State<HelpCenter> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    const String img = "http://via.placeholder.com/350x150";
    return new Scaffold(
        // ...
        key: _scaffoldKey,
        body: new CustomScrollView(slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Column(children: <Widget>[
                new Text('xxx',
                    style: new TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20.0)),
                new Text('johndoe@example.com',
                    style: new TextStyle(
                        fontWeight: FontWeight.w200, fontSize: 16.0)),
              ]),
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new Container(
                    height: 300.0,
                    color: Colors.grey,
                    child: new Center(
                        child: new CircleAvatar(
                            backgroundImage: NetworkImage(img))),
                  ),
                  // This gradient ensures that the toolbar icons are distinct
                  // against the background image.
                  const DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.4),
                        colors: const <Color>[
                          const Color(0x60000000),
                          const Color(0x00000000)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
            new ListTile(
              title: new Text('Guide To Order',
                  style: new TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20.0)),
              trailing: new Icon(
                Icons.chevron_right,
                color: Colors.grey[500],
              ),
            ),
            new ListTile(
              title: new Text('Products and Services',
                  style: new TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20.0)),
              trailing: new Icon(
                Icons.chevron_right,
                color: Colors.grey[500],
              ),
            ),
            new ListTile(
              title: new Text('Tips and Fare',
                  style: new TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20.0)),
              trailing: new Icon(
                Icons.chevron_right,
                color: Colors.grey[500],
              ),
            ),

            new ListTile(
              title: new Text('Account and Payment',
                  style: new TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20.0)),
              trailing: new Icon(
                Icons.chevron_right,
                color: Colors.grey[500],
              ),
            ),

            new ListTile(
              title: new Text('Promo and Awards',
                  style: new TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20.0)),
              trailing: new Icon(
                Icons.chevron_right,
                color: Colors.grey[500],
              ),
            ),
            // ...
          ]))
        ]));
  }
}
