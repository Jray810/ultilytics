import 'package:flutter/material.dart';
import 'package:ultilytics/constants/routes.dart';

class TeamView extends StatefulWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team View'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(teamRosterRoute);
              },
              child: const Text('Team Roster View'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(teamGamesRoute);
              },
              child: const Text('Team Games View'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(removeTeamRoute);
              },
              child: const Text('Remove Team View'),
            ),
          ],
        ),
      ),
    );
  }
}