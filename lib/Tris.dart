// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, no_logic_in_create_state, slash_for_doc_comments

import 'dart:math';
import 'package:flutter/material.dart';

/**
 * Class Tris.dart
 * 
 * The class where the game is played.
 * 
 * Contains all the widgets and function to let the execution of the game
 */

/**
 * Class Tris
 * 
 * Creates an StatefulWidget needed to manage the state.
 */
class Tris extends StatefulWidget {
  bool ai;
  Tris({Key? key, required this.ai}) : super(key: key);

  @override
  TrisState createState() => TrisState(ai: ai);
}


/**
 * Class TrisState
 * 
 * The class where all the game is executed.
 * The cells are Containers with customized borders
 */
class TrisState extends State<Tris> {
  bool ai = false;
  TrisState({required this.ai});

  var scheme = [
    '', '', '',
    '', '', '',
    '', '', '',
  ];

  var schemeClickable = [
    true, true, true,
    true, true, true,
    true, true, true,
  ];

  var turn = 'X';
  bool won = false;
  var message = "X's turn...";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(ai ? 'Playing vs AI' : 'Playing vs Friend'),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.home)),
            actions: [
              IconButton(
                onPressed: () => restart(),
                icon: Icon(Icons.restart_alt),
              )
            ]),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Orbitron'),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              box(0, false, true, true, false),
              box(1, false, true, true, true),
              box(2, false, false, true, true),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              box(3, true, true, true, false),
              box(4, true, true, true, true),
              box(5, true, false, true, true),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              box(6, true, true, false, false),
              box(7, true, true, false, true),
              box(8, true, false, false, true),
            ]),
          ], // row of boxes
        ),
      ),
    );
  }

  // box container (position on the scheme, border top, border right, border bottom, border left)
  GestureDetector box(int positionOnScheme, bool topBorder, bool rightBorder,
      bool bottomBorder, bool leftBorder) {
    return GestureDetector(
      onTap: () {
        if (schemeClickable[positionOnScheme]) {
          setState(() {
            if (ai) {
              scheme[positionOnScheme] = turn;
              schemeClickable[positionOnScheme] = false;
              someoneWon();
              if (won == false) {
                turn == 'X' ? turn = 'O' : turn = 'X';
                message = turn + "'s turn...";
                tie();
              }
              simplyAi();
            } else {
              scheme[positionOnScheme] = turn;
              schemeClickable[positionOnScheme] = false;
              someoneWon();
              if (won == false) {
                turn == 'X' ? turn = 'O' : turn = 'X';
                message = turn + "'s turn...";
                tie();
              }
            }
          });
        }
      },
      child: Container(
        padding: EdgeInsets.all(30.0),
        width: 100,
        decoration: BoxDecoration(
            border: Border(
          //If true add an blue border, else add white (invisible) border
          top: BorderSide(
              width: 3,
              color: topBorder == true ? Colors.redAccent : Colors.white),
          right: BorderSide(
              width: 3,
              color: rightBorder == true ? Colors.redAccent : Colors.white),
          bottom: BorderSide(
              width: 3,
              color: bottomBorder == true ? Colors.redAccent : Colors.white),
          left: BorderSide(
              width: 3,
              color: leftBorder == true ? Colors.redAccent : Colors.white),
        )),
        child: Text(
          scheme[positionOnScheme],
          style: TextStyle(
            fontSize: 50,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }

  /**
   * simplyAi function
   * 
   * Creates and simply ai that will place randomly (where the cell is blank) a sign.
   */
  void simplyAi() {
    if (won == false) {
      int random = randomNumber(8);
      if (scheme[random] != '') {
        bool found = false;
        while (found == false) {
          int r = randomNumber(8);
          if (scheme[r] == '') {
            random = r;
            found = true;
          }
        }
      }
      scheme[random] = turn;
      schemeClickable[random] = false;
      someoneWon();
      if (won == false) {
        turn == 'X' ? turn = 'O' : turn = 'X';
        message = turn + "'s turn...";
        tie();
      }
    }
  }

  //restart function
  void restart() {
    setState(() {
      clearArrayOfStrings(scheme);
      clearArrayOfBooleans(schemeClickable);
      won = false;
      message = "X's turn...";
      turn = 'X';
    });
  }

  //win conditions functions
  void someoneWon() {
    leftColumnWin(turn);
    centerColumnWin(turn);
    rightColumnWin(turn);
    topRowWin(turn);
    centerRowWin(turn);
    bottomRowWin(turn);
    rightCrossWon(turn);
    leftColumnWin(turn);
    leftCrossWon(turn);
    rightColumnWin(turn);
  }

  //tie condition function
  void tie() {
    int n = 0;
    if (won == false) {
      for (int i = 0; i < schemeClickable.length; i++) {
        if (schemeClickable[i] == false) {
          n++;
        }
      }
    }

    if (n == 9) {
      message = 'Tie';
      freezeGame();
    }
  }

  //all win conditions
  void leftColumnWin(var sign) {
    if (scheme[0] == sign && scheme[3] == sign && scheme[6] == sign) {
      won = true;
      freezeGame();
      setState(() {
        message = turn + ' won';
      });
    }
  }

  void centerColumnWin(var sign) {
    if (scheme[1] == sign && scheme[4] == sign && scheme[7] == sign) {
      won = true;
      freezeGame();
      setState(() {
        message = turn + ' won';
      });
    }
  }

  void rightColumnWin(var sign) {
    if (scheme[2] == sign && scheme[5] == sign && scheme[8] == sign) {
      won = true;
      freezeGame();
      setState(() {
        message = turn + ' won';
      });
    }
  }

  void topRowWin(var sign) {
    if (scheme[0] == sign && scheme[1] == sign && scheme[2] == sign) {
      won = true;
      freezeGame();
      setState(() {
        message = turn + ' won';
      });
    }
  }

  void centerRowWin(var sign) {
    if (scheme[3] == sign && scheme[4] == sign && scheme[5] == sign) {
      won = true;
      freezeGame();
      setState(() {
        message = turn + ' won';
      });
    }
  }

  void bottomRowWin(var sign) {
    if (scheme[6] == sign && scheme[7] == sign && scheme[8] == sign) {
      won = true;
      freezeGame();
      setState(() {
        message = turn + ' won';
      });
    }
  }

  void rightCrossWon(var sign) {
    if (scheme[2] == sign && scheme[4] == sign && scheme[6] == sign) {
      won = true;
      freezeGame();
      setState(() {
        message = turn + ' won';
      });
    }
  }

  void leftCrossWon(var sign) {
    if (scheme[0] == sign && scheme[4] == sign && scheme[8] == sign) {
      won = true;
      freezeGame();
      setState(() {
        message = turn + ' won';
      });
    }
  }

  //block - unblock functions for freezing the game
  void freezeGame() {
    for (int i = 0; i < schemeClickable.length; i++) {
      schemeClickable[i] = false;
    }
  }

  void unfreezeGame() {
    for (int i = 0; i < schemeClickable.length; i++) {
      schemeClickable[i] = true;
    }
  }

  //utilities functions

  //clear an array of strings
  void clearArrayOfStrings(List arr) {
    for (int i = 0; i < arr.length; i++) {
      arr[i] = '';
    }
  }

  //clear an array of booleans
  void clearArrayOfBooleans(List arr) {
    for (int i = 0; i < arr.length; i++) {
      arr[i] = true;
    }
  }

  int randomNumber(int maxNumber) {
    Random random = Random();
    return random.nextInt((maxNumber + 1));
  }
}




