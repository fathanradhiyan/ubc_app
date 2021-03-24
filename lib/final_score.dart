import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:ubc_app/final_score_appbar.dart';
import 'package:ubc_app/more_teams.dart';
import 'package:ubc_app/team_stats.dart';

void main(){
  runApp(
      new MaterialApp(
        title: "Final Score",
        home: new FinalScore(),
      )
  );
}

//https://www.youtube.com/watch?v=4mszklDhl_0

class FinalScore extends StatefulWidget {
  @override
  _FinalScoreState createState() => _FinalScoreState();
}

class _FinalScoreState extends State<FinalScore> with SingleTickerProviderStateMixin{
  final List<Tuple2> _pages = [
    Tuple2('', TeamStats()),
    Tuple2('', TeamStats()),
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
      // appBar: AppBar(
      //   title: Text(_pages[_tabController.index].item1),
      //   backgroundColor: Colors.indigo[900],
      //   bottom: TabBar(
      //     controller: _tabController,
      //     tabs: _pages.map<Tab>((Tuple2 page) => Tab(text: page.item1)).toList(),
      //     // tabs: <Widget>[
      //     //   Tab(
      //     //     text: 'Block A',
      //     //   ),
      //     //   Tab(
      //     //     text: 'Block B',
      //     //   )
      //     // ],
      //   ),
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            FinalScoreAppBar(_tabController,_pages[_tabController.index].item1),
          ];
        },
        body: TabBarView(
            controller: _tabController,
            children: _pages.map<Widget>((Tuple2 page) => page.item2).toList()),
      ),
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
