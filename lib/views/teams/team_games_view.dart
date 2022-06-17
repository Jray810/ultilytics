import 'package:flutter/material.dart';
import 'package:ultilytics/constants/routes.dart';

class TeamGamesView extends StatefulWidget {
  const TeamGamesView({Key? key}) : super(key: key);

  @override
  State<TeamGamesView> createState() => _TeamGamesViewState();
}

class _TeamGamesViewState extends State<TeamGamesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Games View')
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(gameInfoRoute);
              },
              child: const Text('Game Info View'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(addGameRoute);
              },
              child: const Text('Add Game View'),
            ),
          ],
        ),
      ),
    );
  }
}