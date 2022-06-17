import 'package:flutter/material.dart';

class MigrateTeamView extends StatefulWidget {
  const MigrateTeamView({Key? key}) : super(key: key);

  @override
  State<MigrateTeamView> createState() => _MigrateTeamViewState();
}

class _MigrateTeamViewState extends State<MigrateTeamView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Migrate Team View')
      ),
    );
  }
}