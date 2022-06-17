import 'package:flutter/material.dart';

class RemoveTeamView extends StatefulWidget {
  const RemoveTeamView({Key? key}) : super(key: key);

  @override
  State<RemoveTeamView> createState() => _RemoveTeamViewState();
}

class _RemoveTeamViewState extends State<RemoveTeamView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remove Team View')
      ),
    );    
  }
}