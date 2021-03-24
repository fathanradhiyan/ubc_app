import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "more_players",
    home: new MorePlayers(),
  ));
}

class MorePlayers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MorePlayersState();
}

class MorePlayersState extends State<MorePlayers> {
  List<String> items = [];
  List<String> position = [];
  List<String> number = [];
  TextEditingController controller = new TextEditingController();
  String filter;

  @override
  //ignore: must_call_super
  initState() {
    items.add("Abdul Irsyad");
    items.add("Fathan Radhiyan");
    items.add("Fajri Maulana");

    position.add('Guard');
    position.add('Forward');
    position.add('Center');

    number.add('16');
    number.add('11');
    number.add('10');

    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Players'),
        backgroundColor: Colors.indigo[900],
      ),
      body: new Material(
          child: new Column(children: <Widget>[
        new TextField(
          decoration: new InputDecoration(
              icon: Icon(Icons.search), labelText: "Search something"),
          controller: controller,
        ),
        new Expanded(
          child: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              //check if the filter is null or empty
              return filter == null || filter == ""
                  ?
                  //then we return all items
                  new ListTile(
                      leading: CircleAvatar(
                          //player photo
                          ),
                      title: new Text(items[index]),
                      subtitle:
                          new Text(position[index] + ' | #' + number[index]),
                      trailing: Icon(
                        Icons.blur_circular,
                        color: Colors.indigo[900],
                        size: 40,
                      ),
                      onTap: () {
                        //detail data players
                      },
                    )
                  //When the item with the index number contains the string of the filter
                  : items[index].toLowerCase().contains(filter.toLowerCase())
                      ?
                      //we return this item,
                      new ListTile(
                          leading: CircleAvatar(
                              //player photo
                              ),
                          title: new Text(items[index]),
                          subtitle: new Text(
                              position[index] + ' | #' + number[index]),
                          trailing: Icon(
                            Icons.blur_circular,
                            color: Colors.indigo[900],
                            size: 40,
                          ),
                          onTap: () {
                            //detail data players
                          },

                        )
                      // if not we return an empty container
                      : new Container();
            },
          ),
        ),
      ])),
    );
  }
}
