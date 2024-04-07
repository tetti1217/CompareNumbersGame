import 'package:flutter/material.dart';
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
        child: Column(
          //大枠の階層
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "COM",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Row(
              //COMカード
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: comReverseCard1,
                  width: 60,
                  height: 100,
                ),
                SizedBox(
                  child: comReverseCard2,
                  width: 60,
                  height: 100,
                ),
                SizedBox(
                  child: comReverseCard3,
                  width: 60,
                  height: 100,
                ),
                SizedBox(
                  child: comReverseCard4,
                  width: 60,
                  height: 100,
                ),
                SizedBox(
                  child: comReverseCard5,
                  width: 60,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 400),
            Row(
              // Playerカード
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    child: playerCard1,
                    width: 60,
                    height: 100,
                  ),
                ),
                SizedBox(
                  child: playerCard2,
                  width: 60,
                  height: 100,
                ),
                SizedBox(
                  child: playerCard3,
                  width: 60,
                  height: 100,
                ),
                SizedBox(
                  child: playerCard4,
                  width: 60,
                  height: 100,
                ),
                SizedBox(
                  child: playerCard5,
                  width: 60,
                  height: 100,
                ),
              ],
            ),
            const Align(
              alignment: Alignment.centerLeft,
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
