import 'package:flutter/material.dart';

class AddExistingTeamView extends StatefulWidget {
  const AddExistingTeamView({Key? key}) : super(key: key);

  @override
  State<AddExistingTeamView> createState() => _AddExistingTeamViewState();
}

class _AddExistingTeamViewState extends State<AddExistingTeamView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Existing Team View')
      ),
    );
  }
}