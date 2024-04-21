import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:trump_war/hand_of_cards.dart';

enum Phase {
  player,
  computer,
  judge,
  finalJudge,
}

enum JudgeStatus {
  playerWin,
  computerWin,
  draw,
}

int convertCardValueToNumber (CardValue value) {
  if (value == CardValue.ace) {
    return 1;
  }
  return value.index + 2;
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  Phase _phase = Phase.player;
  CardValue? _playerPlayedCard;
  CardValue? _computerPlayedCard;
  JudgeStatus? _judgeStatus;
  int _timesOfPlayerWin = 0;
  int _timesOfComputerWin = 0;
  int _gameCount = 1;

  void _onPlayerPlayed (CardValue value) {
    if (_phase != Phase.player) {
      return;
    }
    setState(() {
      _playerPlayedCard = value;
      _phase = Phase.computer;
    });
  }

  Future<void> _onComputerPlayed (CardValue value) async {
    if (_phase != Phase.computer) {
      return;
    }
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _computerPlayedCard = value;
      _phase = Phase.judge;
    });
    _judge();
  }

  Future<void> _judge () async {
    if (_phase != Phase.judge) {
      return;
    }
    if (_playerPlayedCard == null) {
      return;
    }
    if (_computerPlayedCard == null) {
      return;
    }
    if (_playerPlayedCard!.index == _computerPlayedCard!.index) {
      setState(() {
        _judgeStatus = JudgeStatus.draw;
      });
    } else if (convertCardValueToNumber(_playerPlayedCard!) > convertCardValueToNumber(_computerPlayedCard!)) {
      setState(() {
        _judgeStatus = JudgeStatus.playerWin;
        _timesOfPlayerWin++;
      });
    } else {
      setState(() {
        _judgeStatus = JudgeStatus.computerWin;
        _timesOfComputerWin++;
      });
    }
    await Future.delayed(const Duration(seconds: 1));
    if (_gameCount == 5) {
      setState(() {
        _judgeStatus = null;
        _phase = Phase.finalJudge;
      });
      return;
    }
    setState(() {
      _judgeStatus = null;
      _gameCount++;
      _phase = Phase.player;
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
            EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 10),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                '$_phase',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'COM ${_judgeStatus == JudgeStatus.computerWin ? 'Win' : ''} ${_judgeStatus == JudgeStatus.draw ? 'draw' : ''}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                '$_timesOfComputerWin',
                style: TextStyle(fontSize: 30),
              ),
            ),
            _phase == Phase.finalJudge ? Align(
              alignment: Alignment.center,
              child: Text(
                '${_timesOfComputerWin < _timesOfPlayerWin ? 'Player Win' : 'Computer Win'}',
                style: TextStyle(fontSize: 30),
              ),
            ) : Stack(
              children: [
                ComputerHandOfCards(
                  onPlayed: _onComputerPlayed,
                  phase: _phase,
                ),
                HandOfCards(
                  onPlayed: _onPlayerPlayed,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Player ${_judgeStatus == JudgeStatus.playerWin ? 'Win' : ''} ${_judgeStatus == JudgeStatus.draw ? 'draw' : ''}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '$_timesOfPlayerWin',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
