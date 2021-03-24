import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:ubc_app/more_teams.dart';

void main(){
  runApp(
      new MaterialApp(
        title: "page_standing",
        home: new PageStanding(),
      )
  );
}

class PageStanding extends StatefulWidget {
  @override
  _PageStandingState createState() => _PageStandingState();
}

class _PageStandingState extends State<PageStanding> with SingleTickerProviderStateMixin{
  final List<Tuple2> _pages = [
    Tuple2('Block A', MoreTeams()),
    Tuple2('Block B', MoreTeams()),
  ];

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: _pages.length, vsync:this);
    _tabController.addListener(() => setState((){}));
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_tabController.index].item1),
          backgroundColor: Colors.indigo[900],
          bottom: TabBar(
            controller: _tabController,
            tabs: _pages.map<Tab>((Tuple2 page) => Tab(text: page.item1)).toList(),
            // tabs: <Widget>[

            // ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _pages.map<Widget>((Tuple2 page) => page.item2).toList()),
        );
  }
}




//class PageStanding extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: new Text("Standing"),
//      ),
//      body: new Container(
//        padding: EdgeInsets.all(20.0),
//        child: new Center(
//          child: new Text("Halaman Tiga"),
//        ),
//      ),
//    );
//  }
//}
