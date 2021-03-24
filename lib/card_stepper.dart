import 'package:flutter/material.dart';

class CardStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Card(
        elevation: 5,
        child: Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                          color: Colors.indigo,
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
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    //home score
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '0',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),

                    //strip
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: new Text(
                          '-',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),

                    //away score
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: new Text(
                          '0',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
