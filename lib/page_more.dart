import 'package:flutter/material.dart';
import 'package:ubc_app/more_key_dates.dart';
import './more_players.dart';
import './more_teams.dart';
import './more_stats.dart';
import './more_key_dates.dart';
import './more_about.dart';
import './more_chess_timer.dart';


void main() {
  runApp(new MaterialApp(
    title: "page_more",
    home: new PageMore(),
  ));
}

class PageMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('More'),
        backgroundColor: Colors.indigo[900],
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: Text('Teams'),
            leading: Icon(Icons.flag, color: Colors.indigo[900],),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MoreTeams()));
            },
          ),
          new ListTile(
            title: Text('Players'),
            leading: Icon(Icons.people, color: Colors.indigo[900],),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MorePlayers()));
            },
          ),
          new ListTile(
            title: Text('Stats'),
            leading: Icon(Icons.insert_chart, color: Colors.indigo[900],),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MoreStats()));
            },
          ),
          new ListTile(
            title: Text('Key Dates'),
            leading: Icon(Icons.date_range, color: Colors.indigo[900],),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MoreKeyDates()));
            },
          ),
          new ListTile(
            title: Text('Chess Timer'),
            leading: Icon(Icons.timer, color: Colors.indigo[900],),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MoreChessTimer()));
            },
          ),
          new ListTile(
            title: Text('About UBC'),
            leading: Icon(Icons.alternate_email, color: Colors.indigo[900],),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MoreAbout()));
            },
          ),
        ],
      )
    );
  }
}

