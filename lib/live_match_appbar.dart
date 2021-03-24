import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "live_match_appbar",
    home: new LiveMatchAppBar(),
  ));
}

class LiveMatchAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Match'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        color: Colors.indigo[900],
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: 160,
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

                                //Team A Name
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: new Text(
                                      'Home Team',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                //keterangan
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 30.0, right: 15.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'ONGOING',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),

                                //jam tanding
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: new Text(
                                      '00:00 WIB',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),

                                //tanggal tanding
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0, bottom: 30.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: new Text(
                                      'Mon, 29/4',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
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

                                //Team B Name
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: new Text(
                                      'Away Team',
                                      style: TextStyle(color: Colors.white),
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
    );
  }
}
