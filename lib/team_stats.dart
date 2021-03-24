import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "more_stats",
    home: new TeamStats(),
  ));
}

class TeamStats extends StatefulWidget {
  @override
  _TeamStatsState createState() => _TeamStatsState();
}

class _TeamStatsState extends State<TeamStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Stats'),
        //   backgroundColor: Colors.indigo[900],
        // ),
        body:
        ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          new Row(children: <Widget>[
            Column(
              children: <Widget>[
                DataTable(
                  columns: [
                    DataColumn(label: Text('Name')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Fathan Radhiyan')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Abdul Irsyad')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Fajri Maulana')),
                    ]),
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                DataTable(
                  columns: [
                    DataColumn(label: Text('Team')),
                    DataColumn(label: Text('PPG')),
                    DataColumn(label: Text('RPG')),
                    DataColumn(label: Text('APG')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('FST')),
                      DataCell(Text('30.1')),
                      DataCell(Text('5.4')),
                      DataCell(Text('6.7')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('FDK')),
                      DataCell(Text('29.0')),
                      DataCell(Text('6.1')),
                      DataCell(Text('7.5')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('FEB')),
                      DataCell(Text('28.2')),
                      DataCell(Text('8.2')),
                      DataCell(Text('5.0')),
                    ]),
                  ],
                ),
              ],
            ),
          ])
        ])
    );
  }
}

//class MoreStats extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: new Text("Stats"),
//        backgroundColor: Colors.indigo[900],
//      ),
//      body: new Container(
//        padding: EdgeInsets.all(20.0),
//        child: new Center(
//          child: new Text("Halaman Stats"),
//        ),
//      ),
//    );
//  }
//}
