import 'package:flutter/material.dart';

class PlayCard extends StatefulWidget {
  final Image image;
  final Alignment initialAlignment;
  
  const PlayCard({
    super.key,
    required this.image,
    required this.initialAlignment,
  });

  @override
  PlayCardState createState() => PlayCardState();
}

class PlayCardState extends State<PlayCard> {
  late Alignment _alignment;

  @override
  void initState() {
    super.initState();
    _alignment = widget.initialAlignment;
  }

  void _onTap() {
    setState(() {
      _alignment = Alignment.center;
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
        child: SizedBox(
          width: 60,
          height: 100,
          child: widget.image,
        ),
      ),
    );
  }
}