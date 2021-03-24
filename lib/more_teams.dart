import 'package:flutter/material.dart';

void main(){
  runApp(
      new MaterialApp(
        title: "more_teams",
        home: new MoreTeams(),
      )
  );
}

class MoreTeams extends StatefulWidget {
  @override
  _MoreTeamsState createState() => _MoreTeamsState();
}

class _MoreTeamsState extends State<MoreTeams> {

  List<int> item = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i = 0; i<10; i++){
      item.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Teams'),
        backgroundColor: Colors.indigo[900],
      ),
      body: new ListView.builder(
          itemCount: item.length,
          itemBuilder: (BuildContext context, int index){
            return new ListTile(
              leading: CircleAvatar(
                //logo team
              ),
              title: new Text('Team $index'),
              subtitle: new Text('0 - 0'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                //detail data team
              },
            );
          },
      ),
    );
  }
}

