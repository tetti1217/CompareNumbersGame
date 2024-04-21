import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class PlayCard extends StatefulWidget {
  final CardValue value;
  final bool? isHided;
  
  const PlayCard({
    super.key,
    required this.value,
    this.isHided,
  });

  @override
  PlayCardState createState() => PlayCardState();
}

class PlayCardState<T extends PlayCard> extends State<T> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 100,
      child: PlayingCardView(
        card: PlayingCard(Suit.clubs, widget.value),
        showBack: widget.isHided == true,
      ),
    );
  }
}

class PlayerCard extends PlayCard {
  final Alignment alignment;
  final void Function(CardValue) onPlayed;
  
  const PlayerCard({
    super.key,
    required super.value,
    required this.onPlayed,
    required this.alignment,
  });

  @override
  PlayerCardState createState() => PlayerCardState();
}

class PlayerCardState extends PlayCardState<PlayerCard> {
  void _onTap() {
    widget.onPlayed(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: widget.alignment,
      curve: Curves.ease,
      duration: const Duration(seconds: 1),
      child: GestureDetector(
        onTap: _onTap,
        child: super.build(context),
      ),
    );
  }
}

class ComputerCard extends PlayCard {
  final Alignment alignment;
  
  const ComputerCard({
    super.key,
    required super.value,
    super.isHided,
    required this.alignment,
  });

  @override
  ComputerCardState createState() => ComputerCardState();
}

class ComputerCardState extends PlayCardState<ComputerCard> {

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: widget.alignment,
      curve: Curves.ease,
      duration: const Duration(seconds: 1),
      child: super.build(context),
    );
  }
}