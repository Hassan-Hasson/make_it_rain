import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;

  /// making a global key ...... still not understand it ??!
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  /// _rainMoney
  /// is for raising the money by 100
  /// need no parameter
  void _rainMoney() {
    // set state is called each time we need to update the ui
    setState(() {
      _moneyCounter += 100;
    });
  }

  /// _desend function
  /// no parameters needed
  /// decrees the _moneyCounter by 100 and if it reach 0 is show a snackbar
  /// telling you that is no balance to decrease and give u option to "add"
  /// balance by 100 to the _moneyCounter
  void _desend() {
    setState(() {
      if (_moneyCounter <= 0) {
        _moneyCounter = 0;
        debugPrint("clicked");
        final snackBar = SnackBar(
          content: Text('Yay! A SnackBar!'),
          action: SnackBarAction(
            label: 'Add',
            onPressed: () {
              _rainMoney();
            },
          ),
        );
        _key.currentState.showSnackBar(snackBar);
      } else {
        _moneyCounter -= 100;
      }
    });
  }

  void _clear() {
    setState(() {
      _moneyCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _key,
      appBar: new AppBar(
        title: new Text("Make IT Rain"),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text(
                //text
                "Get Rich!!",
                // styling
                style: new TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 29.9,
                ),
              ),
            ),
            new Expanded(
              child: new Center(
                child: new Text(
                  '\$$_moneyCounter',
                  style: new TextStyle(
                    color: Colors.green,
                    fontSize: 46,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

//          flat button
            new Expanded(
              child: new Center(
                child: new FlatButton(
                  color: Colors.lightGreen,
                  textColor: Colors.white70,
                  onPressed: _rainMoney,
                  child: new Text(
                    "let it rain",
                    style: new TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),

            new Expanded(
              child: new Center(
                child: new FlatButton(
                  color: Colors.lightGreen,
                  textColor: Colors.white70,
                  onPressed: () {
                    _desend();
                  },
                  child: new Text(
                    "desend it",
                    style: new TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),

            // clear button
            new Expanded(
              child: new Center(
                child: new FlatButton(
                  color: Colors.lightGreen,
                  textColor: Colors.white70,
                  onPressed: _clear,
                  child: new Text(
                    "clear",
                    style: new TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
