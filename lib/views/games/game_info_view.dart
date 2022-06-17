import 'package:flutter/material.dart';

class GameInfoView extends StatefulWidget {
  const GameInfoView({Key? key}) : super(key: key);

  @override
  State<GameInfoView> createState() => _GameInfoViewState();
}

class _GameInfoViewState extends State<GameInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Info View')
      ),
    );
  }
}