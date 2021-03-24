import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main(){
  runApp(
      new MaterialApp(
        title: "more_about",
        home: new MoreAbout(),
      )
  );
}

class MoreAbout extends StatefulWidget {
  @override
  _MoreAboutState createState() => _MoreAboutState();
}

class _MoreAboutState extends State<MoreAbout> {
  double percent = 0;
  static int TimeInMinute = 25;
  int TimeInSec = TimeInMinute * 60;

  //we need to import async library and add a timer object
  Timer timer;

  _StartTimer(){
    TimeInMinute = 25;
    int Time = TimeInMinute*60;
    double SecPercent = (Time/100);
    timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        if(Time > 0){
          Time--;
          if(Time%60 == 0){
            TimeInMinute--;
          }if(Time % SecPercent == 0){
            if(percent <1){
              percent += 0.01;
            }else{
              percent = 1;
            }
          }
        }else{
          percent = 0;
          TimeInMinute = 25;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1542bf),Color(0xff51a8ff)],
              begin: FractionalOffset(0.5, 1)
            )
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Podomoro Clock",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0
                  ),
                ),
              ),
              Expanded(
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 250.0,
                  lineWidth: 20.0,
                  progressColor: Colors.white,
                  center: Text(
                    "$TimeInMinute",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80.0
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0,left: 20.0,right: 20.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Study Time",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(height: 20.0,),
                                    Text(
                                      "25",
                                      style: TextStyle(
                                        fontSize: 60.0
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Pause Time",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(height: 20.0,),
                                    Text(
                                      "5",
                                      style: TextStyle(
                                          fontSize: 60.0
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 28.0),
                          child: RaisedButton(
                            onPressed: _StartTimer,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "start studying",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

// class MoreAbout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: new Text("About UBC"),
//         backgroundColor: Colors.indigo[900],
//       ),
//       body: new Container(
//         padding: EdgeInsets.all(20.0),
//         child: new Center(
//           child: new Text("Halaman About UBC"),
//         ),
//       ),
//     );
//   }
// }
