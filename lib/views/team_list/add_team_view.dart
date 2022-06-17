import 'package:flutter/material.dart';
import 'package:ultilytics/constants/routes.dart';

class AddTeamView extends StatefulWidget {
  const AddTeamView({Key? key}) : super(key: key);

  @override
  State<AddTeamView> createState() => _AddTeamViewState();
}

class _AddTeamViewState extends State<AddTeamView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Team View')
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(addExistingTeamRoute);
              },
              child: const Text('Add Existing Team View'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(migrateTeamRoute);
              },
              child: const Text('Migrate Team View'),
            ),
          ],
        ),
      ),
    );
  }
}