import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:trump_war/game_page.dart';
import 'package:trump_war/play_card.dart';

const List<CardValue> allHandOfCards = [
  CardValue.ace,
  CardValue.two,
  CardValue.three,
  CardValue.four,
  CardValue.five,
];

class HandOfCards extends StatefulWidget {
  final void Function(CardValue)? onPlayed;

  const HandOfCards({
    super.key,
    this.onPlayed,
  });

  @override
  HandOfCardsState createState() => HandOfCardsState();
}

class HandOfCardsState extends State<HandOfCards> {
  final List<CardValue> _handOfCards = [...allHandOfCards];
  final List<CardValue> _playedCards = [];

  void _onPlayed (CardValue value) {
    if (widget.onPlayed != null) {
      widget.onPlayed!(value);
    }
    setState(() {
      _handOfCards.remove(value);
      _playedCards.add(value);
    });
  }

  Alignment _calculateAlliment (CardValue value, List<CardValue> handsOfCards, List<CardValue> playedCards) {
    if (playedCards.contains(value)) {
      return const Alignment(0.0, 0.3);
    }
    return Alignment(
      - (handsOfCards.length - 1) * 0.15 + handsOfCards.indexOf(value) * 0.3,
      0.7
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: allHandOfCards.map((v) => Visibility(
        visible: _handOfCards.contains(v) || _playedCards.last == v,
        child: PlayerCard(
          value: v,
          onPlayed: _onPlayed,
          alignment: _calculateAlliment(v, _handOfCards, _playedCards),
        ),
      )).toList(),
    );
  }
}

class ComputerHandOfCards extends StatefulWidget {
  final void Function(CardValue)? onPlayed;
  final Phase phase;

  const ComputerHandOfCards({
    super.key,
    this.onPlayed,
    required this.phase,
  });

  @override
  ComputerHandOfCardstate createState() => ComputerHandOfCardstate();
}

class ComputerHandOfCardstate extends State<ComputerHandOfCards> {
  final List<CardValue> _handOfCards = [...allHandOfCards];
  final List<CardValue> _playedCards = [];

  @override
  void initState() {
    super.initState();
    _handOfCards.shuffle();
  }

  @override
  void didUpdateWidget(ComputerHandOfCards oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.phase == Phase.player && widget.phase == Phase.computer) {
      _onPlayed();
    }
  }

  void _onPlayed () {
    CardValue value = _handOfCards.last;
    if (widget.onPlayed != null) {
      widget.onPlayed!(value);
    }
    setState(() {
      _handOfCards.remove(value);
      _playedCards.add(value);
    });
  }

  Alignment _calculateAlliment (CardValue value, List<CardValue> handsOfCards, List<CardValue> playedCards) {
    if (playedCards.contains(value)) {
      return const Alignment(0.0, -0.3);
    }
    return Alignment(
      - (handsOfCards.length - 1) * 0.15 + handsOfCards.indexOf(value) * 0.3,
      -0.7
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: allHandOfCards.map((v) => Visibility(
        visible: _handOfCards.contains(v) || _playedCards.last == v,
        child: ComputerCard(
          value: v,
          alignment: _calculateAlliment(v, _handOfCards, _playedCards),
          isHided: !(_playedCards.isNotEmpty && v == _playedCards.last),
        ),
      )).toList(),
    );
  }
}