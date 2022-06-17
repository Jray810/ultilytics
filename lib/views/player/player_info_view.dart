import 'package:flutter/material.dart';

class PlayerInfoView extends StatefulWidget {
  const PlayerInfoView({Key? key}) : super(key: key);

  @override
  State<PlayerInfoView> createState() => _PlayerInfoViewState();
}

class _PlayerInfoViewState extends State<PlayerInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Info View')
      ),
    );
  }
}