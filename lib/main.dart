// ignore_for_file: prefer_const_constructors, slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:tris_flutter/Tris.dart';

/**
 * Class main.dart.
 * 
 * Main class of the Tris project.
 * 
 * The objective of this project is to recreate the game tic tac toe with flutter.
 * It is divided into two classes: 
 *  -main.dart
 *  -Tris.dart 
 * 
 */

/**
 * main function
 * 
 * defines the homepage of the app 
 */

void main() {
  runApp(MaterialApp(
    title: 'App',
    home: Startpage(),
  ));
}

/**
 * Class Startpage
 * 
 * Creates an StatefulWidget needed to manage the state.
 */
class Startpage extends StatefulWidget {
  const Startpage({Key? key}) : super(key: key);

  @override
  StartpageState createState() => StartpageState();
}

/**
 * Class StartpageState
 * 
 * Stateful class that containes all the widgets and variables of the startpage.
 * It is created using the MaterialUI material.
 * It is based on 3 main widgets: 
 *  -the title (Text widget)
 *  -the play vs friend button (ElevatedButton widget)
 *  -the play vs ai (ElevatedButton widget)
 * 
 * On the click of the two buttons the app will change screen using Navigator functions
 * and based on the button pressed the app will activate the ai or not.
 * 
 */

class StartpageState extends State<Startpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        primarySwatch: Colors.red,
      ),
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Tris on flutter - Vlad Postu'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text('Tris Game',
                      style: TextStyle(fontFamily: 'Orbitron', fontSize: 35)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tris(ai: false)),
                    );
                  },
                  child: Text('PLAY vs FRIEND',
                      style: TextStyle(fontFamily: 'Orbitron')),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tris(ai: true)),
                    );
                  },
                  child: Text('PLAY vs AI',
                      style: TextStyle(fontFamily: 'Orbitron')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
