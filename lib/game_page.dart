import 'package:flutter/material.dart';
import 'package:trump_war/play_card.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {

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
            PlayCard(
              image: Image.asset('images/COM.jpg'),
              initialAlignment: const Alignment(-0.6, -0.7),
            ),
            PlayCard(
              image: Image.asset('images/COM.jpg'),
              initialAlignment: const Alignment(-0.3, -0.7),
            ),
            PlayCard(
              image: Image.asset('images/COM.jpg'),
              initialAlignment: const Alignment(0.0, -0.7),
            ),
            PlayCard(
              image: Image.asset('images/COM.jpg'),
              initialAlignment: const Alignment(0.3, -0.7),
            ),
            PlayCard(
              image: Image.asset('images/COM.jpg'),
              initialAlignment: const Alignment(0.6, -0.7),
            ),
            PlayCard(
              image: Image.asset('images/Player_1.jpg'),
              initialAlignment: const Alignment(-0.6, 0.7),
            ),
            PlayCard(
              image: Image.asset('images/Player_2.jpg'),
              initialAlignment: const Alignment(-0.3, 0.7),
            ),
            PlayCard(
              image: Image.asset('images/Player_3.jpg'),
              initialAlignment: const Alignment(0.0, 0.7),
            ),
            PlayCard(
              image: Image.asset('images/Player_4.jpg'),
              initialAlignment: const Alignment(0.3, 0.7),
            ),
            PlayCard(
              image: Image.asset('images/Player_5.jpg'),
              initialAlignment: const Alignment(0.6, 0.7),
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
