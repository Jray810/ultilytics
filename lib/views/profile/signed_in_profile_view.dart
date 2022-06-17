import 'package:flutter/material.dart';

class SignedInProfileView extends StatefulWidget {
  const SignedInProfileView({Key? key}) : super(key: key);

  @override
  State<SignedInProfileView> createState() => _SignedInProfileViewState();
}

class _SignedInProfileViewState extends State<SignedInProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile - Signed In View'),
      ),
    );
  }
}