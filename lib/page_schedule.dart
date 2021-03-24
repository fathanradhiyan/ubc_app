import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "page_schedule",
    home: new PageSchedule(),
  ));
}

class PageSchedule extends StatefulWidget {
  @override
  _PageScheduleState createState() => _PageScheduleState();
}

class _PageScheduleState extends State<PageSchedule> {

  List<int> item = new List();

  @override
  void initState() {
    // TODO: implement initStat
    super.initState();

    for(int i = 0; i<16; i++){
      item.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Schedule'),
        backgroundColor: Colors.indigo[900],
      ),
      body: new ListView.builder(
        itemCount: item.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 160,
              width: double.maxFinite,
              child: FittedBox(
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(7),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 5),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        //Team A Logo
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.account_box,
                                              color: Colors.indigo,
                                              size: 80,
                                            ),
                                          ),
                                        ),

                                        //Team A Name
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: new Text('Home Team'),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        //keterangan
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              top: 30.0,
                                              right: 15.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text('NEXT MATCH'),
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
                                                  fontSize: 20.0),
                                            ),
                                          ),
                                        ),

                                        //tanggal tanding
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              bottom: 30.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: new Text('Mon, 29/4'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        //Team B Logo
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
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
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: new Text('Away Team'),
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
                ),
              ),
            );
          },
    ),
    );
  }
}