import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main(){
  runApp(
      new MaterialApp(
        title: "more_key_dates",
        home: new MoreKeyDates(),
      )
  );
}

//https://www.youtube.com/watch?v=f2FbW_D8VC8
class MoreKeyDates extends StatefulWidget {
  @override
  _MoreKeyDatesState createState() => _MoreKeyDatesState();
}

class _MoreKeyDatesState extends State<MoreKeyDates> with TickerProviderStateMixin{
  TabController tb;
  int hour = 0;
  int min = 0;
  int sec = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timetodisplay = "";
  bool checkTimer = true;
  int currentTimer = 0;

  @override
  void initState() {
    tb = TabController(
      length: 2,
      vsync: this,
      );
    super.initState();
  }

  void start(){
    setState(() {
      if(currentTimer!=0){
        timeForTimer = currentTimer;
        timetodisplay = timeForTimer.toString();
        timeForTimer = timeForTimer - 1;
        debugPrint("current timer : $currentTimer");
      }
      started = false;
      stopped = false;
    });


      timeForTimer = ((hour * 60 * 60) + (min * 60) + sec);
    Timer.periodic(Duration(
      seconds: 1,
    ), (Timer t){
      setState(() {
        if(timeForTimer < 1 || checkTimer == false){
          t.cancel();
          if(timeForTimer == 0){
            debugPrint("Stopped by default");
          }
          else{
            currentTimer = timeForTimer;
            debugPrint("current timer = $currentTimer");
          }
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => MoreKeyDates(),
          ));
        }
        //code untuk konversi waktu detik ke format H:M:S
        else if (timeForTimer < 60){
          timetodisplay = timeForTimer.toString();
          timeForTimer = timeForTimer - 1;
        }else if (timeForTimer < 3600){
          int m = timeForTimer ~/ 60;
          int s = timeForTimer - (60 * m);
          timetodisplay = m.toString() + ":" + s.toString();
          timeForTimer = timeForTimer - 1;
        }else{
          int h = timeForTimer ~/ 3600;
          int t = timeForTimer - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);
          timetodisplay = h.toString() + ":" + m.toString() + ":" + s.toString();
          timeForTimer = timeForTimer - 1;
        }
      });
    });
    //debugPrint(timeForTimer.toString());
  }

  void stop(){
    setState(() {
      started = true;
      stopped = true;
      checkTimer = false;
    });
  }

  Widget timer(){
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //hour
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        "HH",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                        initialValue: hour,
                        minValue: 0,
                        maxValue: 23,
                        listViewWidth: 60.0,
                        onChanged: (val){
                          setState(() {
                            hour = val;
                          });
                        })
                  ],
                ),
                //minute
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                          "MM",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                        initialValue: min,
                        minValue: 0,
                        maxValue: 59,
                        listViewWidth: 60.0,
                        onChanged: (val){
                          setState(() {
                            min = val;
                          });
                        })
                  ],
                ),
                //second
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                          "SS",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                        initialValue: sec,
                        minValue: 0,
                        maxValue: 59,
                        listViewWidth: 60.0,
                        onChanged: (val){
                          setState(() {
                            sec = val;
                          });
                        })
                  ],
                ),
              ],
            ),
          ),
          //*Time Viewer
          Expanded(
            flex: 1,
            child: Text(
                timetodisplay,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          //*button stop n start
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //button start
                RaisedButton(
                  onPressed: started? start : null,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.green,
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                //button stop
                RaisedButton(
                  onPressed: stopped?null : stop,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.red,
                  child: Text(
                    "Stop",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  )
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

  //============================================================================
  //the stopwatch code
  //============================================================================

  Widget stopwatch(){
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              child: Text(
                "00:00:00",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: (){},
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 15.0,
                        ),
                        child: Text(
                          "Stop",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      RaisedButton(
                        onPressed: (){},
                        color: Colors.teal,
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 15.0,
                        ),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  RaisedButton(
                    onPressed: (){},
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 20.0,
                    ),
                    child: Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Timer project"
        ),
        centerTitle: true,
        bottom: TabBar(
          tabs: <Widget>[
            Text(
              "Timer",
            ),
            Text(
              "Stopwatch",
            ),
          ],
          labelPadding: EdgeInsets.only(
            bottom: 10.0,
          ),
          unselectedLabelColor: Colors.white60,
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          timer(),
          stopwatch(), //https://www.youtube.com/watch?v=nfU8HMwCtRQ
        ],
        controller: tb,
      ),
    );
  }
}


// class MoreKeyDates extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: new Text("Key Dates"),
//         backgroundColor: Colors.indigo[900],
//       ),
//       body: new Container(
//         padding: EdgeInsets.all(20.0),
//         child: new Center(
//           child: new Text("Halaman Key Dates"),
//         ),
//       ),
//     );
//   }
// }
