import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]).then((_){
    runApp(MoreChessTimer());
  });
}

class MoreChessTimer extends StatefulWidget {
  @override
  _MoreChessTimerState createState() => _MoreChessTimerState();
}

class _MoreChessTimerState extends State<MoreChessTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: new Text("chess timer"),
        backgroundColor: Colors.indigo[900],
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Center(
          child: new Text("Halaman Chess timer"),
        ),
      ),
    );
  }
}
