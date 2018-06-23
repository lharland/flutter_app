import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({ Key key, this.icon, this.children }) : super(key: key);

  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return new Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: new BoxDecoration(
        border: new Border(bottom: new BorderSide(color: themeData.dividerColor))
      ),
      child: new DefaultTextStyle(
        style: Theme.of(context).textTheme.subhead,
        child: new SafeArea(
          top: false,
          bottom: false,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                width: 72.0,
                child: new Icon(icon, color: themeData.primaryColor)
              ),
              new Expanded(child: new Column(children: children))
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem({ Key key, this.icon, this.lines, this.tooltip, this.onPressed })
    : assert(lines.length > 1),
      super(key: key);

  final IconData icon;
  final List<String> lines;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<Widget> columnChildren = lines.sublist(0, lines.length - 1).map((String line) => new Text(line)).toList();
    columnChildren.add(new Text(lines.last, style: themeData.textTheme.caption));
  
    final List<Widget> rowChildren = <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: columnChildren
        )
      )
    ];
    if (icon != null) {
      rowChildren.add(new SizedBox(
        width: 72.0,
        child: new IconButton(
          icon: new Icon(icon),
          color: themeData.primaryColor,
          onPressed: onPressed
        )
      ));
    }
    return new MergeSemantics(
      child: new Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowChildren
        )
      ),
    );
  }
}

class PromoFragment extends StatefulWidget {
  static const String routeName = '/promo';

  @override
  PromoState createState() => new PromoState();
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class PromoState extends State<PromoFragment> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;


  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        platform: Theme.of(context).platform,
      ),
      child: new Scaffold(
        key: _scaffoldKey,
        body: new CustomScrollView(
          slivers: <Widget>[
            new AppBar(
              actions: <Widget>[
                new IconButton(
                  icon: const Icon(Icons.create),
                  tooltip: 'Edit',
                  onPressed: () {
                    _scaffoldKey.currentState.showSnackBar(const SnackBar(
                      content: const Text("Editing isn't supported in this screen.")
                    ));
                  },
                ),
            
              ],
             
            ),
            new ListView(
              children: <Widget>[
                new ListCategory(
                  icon: Icons.call,
                  children: <Widget>[
                    new ListItem(
                      icon: Icons.message,
                      tooltip: 'Send message',
                      onPressed: () {
                        _scaffoldKey.currentState.showSnackBar(const SnackBar(
                          content: const Text('Pretend that this opened your SMS application.')
                        ));
                      },
                      lines: const <String>[
                        '(650) 555-1234',
                        'Mobile',
                      ],
                    ),
                   
         
                  ]
                )]
            )
                
             
        
      
          ])
      )
      );
  }
}
