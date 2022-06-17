import 'package:flutter/material.dart';
import 'package:ultilytics/constants/routes.dart';

class TeamRosterView extends StatefulWidget {
  const TeamRosterView({Key? key}) : super(key: key);

  @override
  State<TeamRosterView> createState() => _TeamRosterViewState();
}

class _TeamRosterViewState extends State<TeamRosterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Roster View')
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(playerInfoRoute);
              },
              child: const Text('Player Info View'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(addPlayerRoute);
              },
              child: const Text('Add Player View'),
            ),
          ],
        ),
      ),
    );
  }
}