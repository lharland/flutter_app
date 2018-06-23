import 'package:flutter/material.dart';
import 'package:flutter_app/TripListItem.tab.dart';
import 'package:flutter_app/models/trip_model.dart';
import 'package:flutter_app/page.dart';
import 'package:flutter_app/trip_data.dart';
final Map<Page, List<TripInfo>> _allPages = <Page, List<TripInfo>>{
  new Page(label: 'ACTIVE'): dummyTrips.where((i) => i.completed == "On Going").toList()
  ,
  new Page(label: 'HISTORY'): dummyTrips.where((i) => i.completed == "Cancelled" || i.completed == "Finished").toList()
};


class BookingScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: _allPages.length,
      child: new Scaffold(
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: new SliverAppBar(
                  //title: const Text(''),
    
                  pinned: true,
                  expandedHeight: 100.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: new TabBar(
                    tabs: _allPages.keys.map(
                      (Page page) => new Tab(text: page.label),
                    ).toList(),
                  ),
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: _allPages.keys.map((Page page) {
              return new SafeArea(
                top: false,
                bottom: false,
                child: new Builder(
                  builder: (BuildContext context) {
                    return new CustomScrollView(
                      key: new PageStorageKey<Page>(page),
                      slivers: <Widget>[
                        new SliverOverlapInjector(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        new SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          sliver: new SliverFixedExtentList(                       
                            itemExtent: TripListTabItem.height,
                            delegate: new SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                final TripInfo data = _allPages[page].elementAt(index);
                                return new Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: new TripListTabItem(
                                    page: page,
                                    
                                    data: data,
                                  ),
                                );
                              },
                              childCount: _allPages[page].length,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}