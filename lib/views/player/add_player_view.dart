import 'package:flutter/material.dart';

class AddPlayerView extends StatefulWidget {
  const AddPlayerView({Key? key}) : super(key: key);

  @override
  State<AddPlayerView> createState() => _AddPlayerViewState();
}

class _AddPlayerViewState extends State<AddPlayerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Player View')
      ),
    );
  }
}