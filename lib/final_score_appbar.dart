import 'package:flutter/material.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "final_score_appbar",
//     home: new FinalScoreAppBar(),
//   ));
// }

class FinalScoreAppBar extends StatelessWidget {
  final String _title;
  final TabController _tabController;

  const FinalScoreAppBar(
      this._tabController,
      this._title, {
        Key key,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.indigo[900],
      expandedHeight: 250,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          _title,
          style: TextStyle(color: Colors.white),
        ),
        background:
        new Scaffold(
          appBar: AppBar(
            title: Text('Final Score'),
            backgroundColor: Colors.indigo[900],
          ),
          body: Container(
            color: Colors.indigo[900],
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 200,
            width: double.maxFinite,
            child: FittedBox(
              child: Padding(
                padding: EdgeInsets.all(7),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    //Team A Logo
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.account_box,
                                          color: Colors.lightBlueAccent,
                                          size: 80,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    //keterangan
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'FINAL',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),

                                    //final score
                                    Row(
                                      children: <Widget>[
                                        //score team A
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                          child: Text(
                                            '23',
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30.0,
                                                color: Colors.white
                                            ),
                                          ),
                                        ),
                                        //strip
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            '-',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        //score team B
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                          child: Text(
                                            '24',
                                            style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30.0,
                                              color: Colors.white
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    //Team B Logo
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15.0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.account_box,
                                          color: Colors.redAccent,
                                          size: 80,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //),
            ),
          ),
        ),
      ),
      bottom: TabBar(
        controller: _tabController,
        tabs: <Widget>[
            Tab(
              text: 'Home Team',
            ),
            Tab(
              text: 'Away Team',
            ),
        ],
      ),
    );

  }
}
