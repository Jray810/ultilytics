import 'package:flutter/material.dart';

class AddGameView extends StatefulWidget {
  const AddGameView({Key? key}) : super(key: key);

  @override
  State<AddGameView> createState() => _AddGameViewState();
}

class _AddGameViewState extends State<AddGameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Game View')
      ),
    );
  }
}