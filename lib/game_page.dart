import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trump_war/home_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  GamePageState createState() => GamePageState();
}

final playerCard1 = Image.asset('images/Player_1.jpg');
final playerCard2 = Image.asset('images/Player_2.jpg');
final playerCard3 = Image.asset('images/Player_3.jpg');
final playerCard4 = Image.asset('images/Player_4.jpg');
final playerCard5 = Image.asset('images/Player_5.jpg');
final comReverseCard1 = Image.asset('images/COM.jpg');
final comReverseCard2 = Image.asset('images/COM.jpg');
final comReverseCard3 = Image.asset('images/COM.jpg');
final comReverseCard4 = Image.asset('images/COM.jpg');
final comReverseCard5 = Image.asset('images/COM.jpg');

class GamePageState extends State<GamePage> {
  Alignment _playerCard1Alignment = const Alignment(-0.6, 0.7);
  void _changePlayerCard1Alignment() {
    setState(() {
      _playerCard1Alignment = Alignment.center;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('数比べ'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 10),
        child: Stack(
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "COM",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Align(
              alignment: const Alignment(-0.6, -0.7),
              child: SizedBox(
                width: 60,
                height: 100,
                child: comReverseCard1,
              ),
            ),
            Align(
              alignment: const Alignment(-0.3, -0.7),
              child: SizedBox(
                width: 60,
                height: 100,
                child: comReverseCard2,
              ),
            ),
            Align(
              alignment: const Alignment(0.0, -0.7),
              child: SizedBox(
                width: 60,
                height: 100,
                child: comReverseCard3,
              ),
            ),
            Align(
              alignment: const Alignment(0.3, -0.7),
              child: SizedBox(
                width: 60,
                height: 100,
                child: comReverseCard4,
              ),
            ),
            Align(
              alignment: const Alignment(0.6, -0.7),
              child: SizedBox(
                width: 60,
                height: 100,
                child: comReverseCard5,
              ),
            ),
            AnimatedAlign(
              alignment: _playerCard1Alignment,
              curve: Curves.ease,
              duration: const Duration(seconds: 1),
              child: GestureDetector(
                onTap: _changePlayerCard1Alignment,
                child: SizedBox(
                  width: 60,
                  height: 100,
                  child: playerCard1,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.3, 0.7),
              child: SizedBox(
                width: 60,
                height: 100,
                child: playerCard2,
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.7),
              child: SizedBox(
                width: 60,
                height: 100,
                child: playerCard3,
              ),
            ),
            Align(
              alignment: const Alignment(0.3, 0.7),
              child: SizedBox(
                width: 60,
                height: 100,
                child: playerCard4,
              ),
            ),
            Align(
              alignment: const Alignment(0.6, 0.7),
              child: SizedBox(
                width: 60,
                height: 100,
                child: playerCard5,
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Player",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
