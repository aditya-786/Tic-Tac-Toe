import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_project/HomePage.dart';
import 'HomePage.dart';
import 'config.dart';
import 'Unbeatable.dart';
import 'package:url_launcher/url_launcher.dart';
import './pre/my_flutter_app_icons.dart' as custIcons;
import 'package:move_to_background/move_to_background.dart';
import 'WithComputer.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tic Tac Toe'),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 150.0),
                child: Center(
                  child: Text(
                    'Welcome Mind Gamers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Text(
                    'Custom Play',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70.0),
                child: Center(
                  child: RaisedButton(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: Text(
                      'Unbeatable',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UnbeatableTTT()),
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70.0),
                child: Center(
                  child: RaisedButton(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: Text(
                      'With Bot',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AIBot()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        persistentFooterButtons: <Widget>[
          RichText(
              text: TextSpan(children: [
            TextSpan(
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.pinkAccent),
                text: "Developed By: "),
            TextSpan(
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                text: "Aditya Aggarwal   ",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    var url = "https://www.linkedin.com/in/aditya7861/";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }),
          ])),
          IconButton(
            icon: Icon(
              custIcons.MyFlutterApp.linkedin,
            ),
            onPressed: () async {
              const url = "https://www.linkedin.com/in/aditya7861/";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          Text('  ')
        ],
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            currentTheme.switchTheme();
          },
          child: Icon(
            Icons.brightness_4_outlined,
          ),
        ),
      ),
    );
  }
}
