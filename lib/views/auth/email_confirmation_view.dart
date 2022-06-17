import 'package:flutter/material.dart';

class EmailConfirmationView extends StatefulWidget {
  const EmailConfirmationView({Key? key}) : super(key: key);

  @override
  State<EmailConfirmationView> createState() => _EmailConfirmationViewState();
}

class _EmailConfirmationViewState extends State<EmailConfirmationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Confirmation View')
      ),
    );
  }
}