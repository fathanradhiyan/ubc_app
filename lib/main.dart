import 'package:flutter/material.dart';
import './page_home.dart';
import './page_schedule.dart';
import './page_standing.dart';
import './page_more.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_){
    runApp(new MaterialApp(
      title: 'My Apps',
      debugShowCheckedModeBanner: false,
      home: new MyApp(),
    ));
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    PageHome(),
    PageSchedule(),
    PageStanding(),
    PageMore(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            title: Text('Schedule'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            title: Text('Standing'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text('More'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        fixedColor: Colors.indigo[900],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}














//import 'package:flutter/material.dart';
//import 'page_more.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MainHome(),
//      debugShowCheckedModeBanner: false,
//    );
//  }
//}
//
//class MainHome extends StatefulWidget {
//  @override
//  _MainHomeState createState() => _MainHomeState();
//}
//
//class _MainHomeState extends State<MainHome> {
//  int _selectedIndex = 0;
//  static List<Widget> _widgetOptions = <Widget>[
//    new Center(
//      child: Column(
//        children: <Widget>[
//          new MaterialButton(onPressed: (){
//
//          }, child: Text('Page One'),
//          color: Colors.red,
//          textColor: Colors.white,
//          )
//        ],
//      ),
//    ),
//
//    new Center(
//      child: Column(
//        children: <Widget>[
//          new MaterialButton(onPressed: (){
//
//          }, child: Text('Page Two'),
//            color: Colors.blueAccent,
//            textColor: Colors.white,
//          )
//        ],
//      ),
//    ),
//
//    new Center(
//      child: Column(
//        children: <Widget>[
//          new MaterialButton(onPressed: (){
//
//          }, child: Text('Page Three'),
//            color: Colors.green,
//            textColor: Colors.white,
//          )
//        ],
//      ),
//    ),
//
//    new Center(
//      child: Column(
//        children: <Widget>[
//          new MaterialButton(onPressed: (){
//
//          }, child: Text('Page Four'),
//            color: Colors.brown,
//            textColor: Colors.white,
//          )
//        ],
//      ),
//    ),
//  ];
//
//  void _onItemTapped(int index) {
//    setState(() {
//      _selectedIndex = index;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('UBC App'),
//        backgroundColor: Colors.indigo[900],
//      ),
//      body: Center(
//        child: _widgetOptions.elementAt(_selectedIndex),
//
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//            backgroundColor: Colors.indigo,
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.schedule),
//            title: Text('Schedule'),
//            backgroundColor: Colors.blueAccent,
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.insert_chart),
//            title: Text('Standing'),
//            backgroundColor: Colors.indigoAccent,
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.more_horiz),
//            title: Text('More'),
//            backgroundColor: Colors.indigo,
//          ),
//        ],
//        currentIndex: _selectedIndex,
//        selectedItemColor: Colors.white70,
//        onTap: _onItemTapped,
//      ),
//    );
//  }
//}
