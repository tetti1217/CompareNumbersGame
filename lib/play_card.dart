import 'package:flutter/material.dart';

class PlayCard extends StatefulWidget {
  final Image image;
  
  const PlayCard({
    super.key,
    required this.image,
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
      child: widget.image,
    );
  }
}

class PlayerCard extends PlayCard {
  final Alignment initialAlignment;
  
  const PlayerCard({
    super.key,
    required super.image,
    required this.initialAlignment,
  });

  @override
  PlayerCardState createState() => PlayerCardState();
}

class PlayerCardState extends PlayCardState<PlayerCard> {
  late Alignment _alignment;

  @override
  void initState() {
    super.initState();
    _alignment = widget.initialAlignment;
  }

  void _onTap() {
    setState(() {
      _alignment = const Alignment(0.0, 0.3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: _alignment,
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
  final Alignment initialAlignment;
  
  const ComputerCard({
    super.key,
    required super.image,
    required this.initialAlignment,
  });

  @override
  ComputerCardState createState() => ComputerCardState();
}

class ComputerCardState extends PlayCardState<ComputerCard> {
  late Alignment _alignment;

  @override
  void initState() {
    super.initState();
    _alignment = widget.initialAlignment;
  }

  void _onTap() {
    setState(() {
      _alignment = const Alignment(0.0, -0.3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: _alignment,
      curve: Curves.ease,
      duration: const Duration(seconds: 1),
      child: GestureDetector(
        onTap: _onTap,
        child: super.build(context),
      ),
    );
  }
}