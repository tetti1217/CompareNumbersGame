import 'dart:math';

import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:trump_war/game_page.dart';
import 'package:trump_war/play_card.dart';

class HandOfCards extends StatefulWidget {
  final void Function(CardValue)? onPlayed;

  const HandOfCards({
    super.key,
    this.onPlayed,
  });

  @override
  HandOfCardsState createState() => HandOfCardsState();
}

class HandOfCardsState <T extends HandOfCards> extends State<T>{
  final List<CardValue> _allHandOfCards = [
    CardValue.ace,
    CardValue.two,
    CardValue.three,
    CardValue.four,
    CardValue.five,
  ];
  late final List<CardValue> _handOfCards = [..._allHandOfCards];
  final List<CardValue> _playedCards = [];

  void _onPlayed (CardValue value) {
    setState(() {
      _handOfCards.remove(value);
      _playedCards.add(value);
    });
    if (widget.onPlayed != null) {
      widget.onPlayed!(value);
    }
  }

  double _calculateXAlliment (CardValue value, List<CardValue> handOfCards, List<CardValue> playedCards) {
    if (playedCards.contains(value)) {
      return 0.0;
    }
    return - (handOfCards.length - 1) * 0.15 + handOfCards.indexOf(value) * 0.3;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _allHandOfCards.map((v) => PlayCard(
        value: v,
      )).toList(),
    );
  }
}

class PlayerHandOfCards extends HandOfCards {
  final bool tapable;

  const PlayerHandOfCards({
    super.key,
    super.onPlayed,
    required this.tapable,
  });

  @override
  PlayerHandOfCardsState createState() => PlayerHandOfCardsState();
}

class PlayerHandOfCardsState extends HandOfCardsState<PlayerHandOfCards>{

  Alignment _calculateAlliment (CardValue value, List<CardValue> handOfCards, List<CardValue> playedCards) {
    return Alignment(
      super._calculateXAlliment(value, handOfCards, playedCards),
      playedCards.contains(value) ? 0.3 : 0.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _allHandOfCards.map((v) => Visibility(
        visible: _handOfCards.contains(v) || _playedCards.last == v,
        child: PlayerCard(
          value: v,
          onPlayed: _onPlayed,
          alignment: _calculateAlliment(v, _handOfCards, _playedCards),
          tapable: widget.tapable,
        ),
      )).toList(),
    );
  }
}

class ComputerHandOfCards extends HandOfCards {
  final Phase phase;

  const ComputerHandOfCards({
    super.key,
    super.onPlayed,
    required this.phase,
  });

  @override
  ComputerHandOfCardstate createState() => ComputerHandOfCardstate();
}

class ComputerHandOfCardstate extends HandOfCardsState<ComputerHandOfCards> {
  var random = Random();

  @override
  void didUpdateWidget(ComputerHandOfCards oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.phase == Phase.player && widget.phase == Phase.computer) {
      CardValue value = _handOfCards[random.nextInt(_handOfCards.length)];
      _onPlayed(value);
    }
  }

  Alignment _calculateAlliment (CardValue value, List<CardValue> handOfCards, List<CardValue> playedCards) {
    return Alignment(
      super._calculateXAlliment(value, handOfCards, playedCards),
      playedCards.contains(value) ? - 0.3 : - 0.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _allHandOfCards.map((v) => Visibility(
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