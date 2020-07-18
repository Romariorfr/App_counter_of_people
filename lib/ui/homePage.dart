import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int people = 0; //number people into the restaurant
  String infoText = "Be Welcome!";

  void _changePeople(int num) {
    //this function increase or decrease the number of people
    //who enter into the restaurant and give a setState.
    setState(() {
      people = people + num;
      if (people >= 10) {
        infoText = "Crowded Restaurant";
      } else if (people < 0) {
        infoText = "Inverted World!?";
      } else {
        infoText = "Be Welcome!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Counter of People",
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Image.asset("images/restaurant.jpg",
                fit: BoxFit.cover, height: 1000.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "People: $people",
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            "+1",
                            style:
                            TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            if (people <= 9) {
                              _changePeople(1);
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                        ),
                        FlatButton(
                          child: Text(
                            "-1",
                            style:
                            TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            if (people >= 0) {
                              _changePeople(-1);
                            }
                          },
                        )
                      ],
                    )),
                Text(
                  infoText,
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
              ],
            ),
          ],
        ));
  }
}
