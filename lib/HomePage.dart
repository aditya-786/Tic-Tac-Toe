import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_project/config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  List<String> states;
  String winner;
  bool checkBox;
  String autoResetMessage;
  bool isDone = true;
  bool changeTheme = true;
  bool checkerReset = false;
  String turn;

  @override
  void initState() {
    super.initState();
    this.states = [
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
    ];
    this.winner = "";
    this.checkBox = true;
    this.autoResetMessage = "Tap Any Box To Continue";
    this.isDone = true;
    this.changeTheme = true;
    this.checkerReset = false;
    this.turn = "";
  }

  void playGame(int index) {
    if (this.states[index] == "empty" && isDone) {
      setState(() {
        if (this.checkBox)
          states[index] = "cross";
        else
          states[index] = "circle";

        this.checkBox = !this.checkBox;
        this.checkWin();
      });
    }
  }

  getImage(String value) {
    if (isDone) {
      switch (value) {
        case 'empty':
          return edit;
          break;

        case 'cross':
          return cross;
          break;

        case 'circle':
          return circle;
          break;
      }
    } else {
      switch (value) {
        case 'cross':
          return cross;
          break;
        case 'circle':
          return circle;
          break;
        default:
          return edit;
          break;
      }
    }
  }

  void resetGame() {
    setState(() {
      if (!checkerReset) {
        states = [
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
        ];

        this.winner = "";
        this.checkBox = true;
        this.autoResetMessage = "Tap Any Box To Continue";
        this.isDone = true;
        this.checkerReset = false;
      }
    });
  }

  void delayTime() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        //this.resetGame();
        this.checkerReset = false;
        states = [
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
          "empty",
        ];

        this.winner = "";
        this.checkBox = true;
        this.autoResetMessage = "Tap Any Box To Continue";
        this.isDone = true;
        this.checkerReset = false;
      });
    });
  }

  void delayTimeForResetMessage() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {});
    });
  }

  void checkWin() {
    if (this.checkBox)
      this.autoResetMessage = "Turn of X";
    else
      this.autoResetMessage = "Turn of O";
    if (!isDone) {
    } else if (states[0] != 'empty' &&
        (states[0] == states[1] && states[0] == states[2])) {
      setState(() {
        this.winner =
            '${this.states[0][0].toUpperCase()}${this.states[0].substring(1)} Wins';
        this.isDone = false;
        this.checkerReset = true;
        this.delayTimeForResetMessage();
        this.winner =
            '${this.states[0][0].toUpperCase()}${this.states[0].substring(1)} Wins';
        this.autoResetMessage = "Auto Resetting Your Game ...";
        this.delayTime();
      });
    } else if (states[3] != 'empty' &&
        (states[3] == states[4] && states[3] == states[5])) {
      setState(() {
        this.winner =
            '${this.states[3][0].toUpperCase()}${this.states[3].substring(1)} Wins';
        this.isDone = false;
        this.checkerReset = true;
        this.delayTimeForResetMessage();
        this.winner =
            '${this.states[3][0].toUpperCase()}${this.states[3].substring(1)} Wins';
        this.autoResetMessage = "Auto Resetting Your Game ...";
        this.delayTime();
      });
    } else if (states[6] != 'empty' &&
        (states[6] == states[7] && states[6] == states[8])) {
      setState(() {
        this.winner =
            '${this.states[6][0].toUpperCase()}${this.states[6].substring(1)} Wins';
        this.isDone = false;
        this.checkerReset = true;
        this.delayTimeForResetMessage();
        this.winner =
            '${this.states[6][0].toUpperCase()}${this.states[6].substring(1)} Wins';
        this.autoResetMessage = "Auto Resetting Your Game ...";
        this.delayTime();
      });
    } else if (states[0] != 'empty' &&
        (states[0] == states[3] && states[0] == states[6])) {
      setState(() {
        this.winner =
            '${this.states[0][0].toUpperCase()}${this.states[0].substring(1)} Wins';
        this.isDone = false;
        this.checkerReset = true;
        this.delayTimeForResetMessage();
        this.winner =
            '${this.states[0][0].toUpperCase()}${this.states[0].substring(1)} Wins';
        this.autoResetMessage = "Auto Resetting Your Game ...";
        this.delayTime();
      });
    } else if (states[1] != 'empty' &&
        (states[1] == states[4] && states[1] == states[7])) {
      setState(() {
        this.winner =
            '${this.states[1][0].toUpperCase()}${this.states[1].substring(1)} Wins';
        this.isDone = false;
        this.checkerReset = true;
        this.delayTimeForResetMessage();
        this.winner =
            '${this.states[1][0].toUpperCase()}${this.states[1].substring(1)} Wins';
        this.autoResetMessage = "Auto Resetting Your Game ...";
        this.delayTime();
      });
    } else if (states[2] != 'empty' &&
        (states[2] == states[5] && states[2] == states[8])) {
      setState(() {
        this.winner =
            '${this.states[2][0].toUpperCase()}${this.states[2].substring(1)} Wins';
        this.isDone = false;
        this.checkerReset = true;
        this.delayTimeForResetMessage();
        this.winner =
            '${this.states[2][0].toUpperCase()}${this.states[2].substring(1)} Wins';
        this.autoResetMessage = "Auto Resetting Your Game ...";
        this.delayTime();
      });
    } else if (states[0] != 'empty' &&
        (states[0] == states[4] && states[0] == states[8])) {
      setState(() {
        this.winner =
            '${this.states[0][0].toUpperCase()}${this.states[0].substring(1)} Wins';
        this.isDone = false;
        this.checkerReset = true;
        this.delayTimeForResetMessage();
        this.winner =
            '${this.states[0][0].toUpperCase()}${this.states[0].substring(1)} Wins';
        ;
        this.autoResetMessage = "Auto Resetting Your Game ...";
        this.delayTime();
      });
    } else if (states[2] != 'empty' &&
        (states[2] == states[4] && states[2] == states[6])) {
      setState(() {
        this.winner =
            '${this.states[2][0].toUpperCase()}${this.states[2].substring(1)} Wins';
        this.isDone = false;
        this.checkerReset = true;
        this.delayTimeForResetMessage();
        this.winner =
            '${this.states[2][0].toUpperCase()}${this.states[2].substring(1)} Wins';
        this.autoResetMessage = "Auto Resetting Your Game ...";
        this.delayTime();
      });
    } else if (!states.contains('empty')) {
      setState(() {
        this.winner = "Game Draw";
        this.isDone = false;
        this.checkerReset = true;
        this.delayTimeForResetMessage();
        this.winner = 'Game Draw';
        this.autoResetMessage = "Auto Resetting Your Game ...";
        this.delayTime();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 110) / 2;
    final double itemWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Play Mode'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: itemWidth / itemHeight,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.states.length,
              itemBuilder: (context, i) => FractionallySizedBox(
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.5,
                widthFactor: 1,
                heightFactor: 1,
                child: MaterialButton(
                  onPressed: () {
                    playGame(i);
                  },
                  child: Image(
                    image: getImage(this.states[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.only(bottom: 50.0),
            child: Text(
              this.winner,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.only(bottom: 50.0),
            child: Text(
              this.autoResetMessage,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50.0),
            child: MaterialButton(
              color: Colors.red,
              onPressed: () {
                this.resetGame();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Text(
                "Reset Game",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          currentTheme.switchTheme();
        },
        child: Icon(
          Icons.brightness_high,
        ),
      ),
    );
  }
}
