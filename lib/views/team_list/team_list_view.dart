import 'package:flutter/material.dart';
import 'package:ultilytics/constants/routes.dart';

class TeamListView extends StatefulWidget {
  const TeamListView({Key? key}) : super(key: key);

  @override
  State<TeamListView> createState() => _TeamListViewState();
}

class _TeamListViewState extends State<TeamListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team List View'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(signedInProfileRoute);
              },
              child: const Text('Profile - Signed In View'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(guestProfileRoute);
              },
              child: const Text('Profile - Guest View'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(teamRoute);
              },
              child: const Text('Team View'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(addTeamRoute);
              },
              child: const Text('Add Team View'),
            ),
          ],
        ),
      ),
    );
  }
}