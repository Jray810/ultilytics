import 'package:flutter/material.dart';
import 'package:ultilytics/constants/routes.dart';

class GuestProfileView extends StatefulWidget {
  const GuestProfileView({Key? key}) : super(key: key);

  @override
  State<GuestProfileView> createState() => _GuestProfileViewState();
}

class _GuestProfileViewState extends State<GuestProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile - Guest View')
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(loginRoute);
          },
          child: const Text('Login or Signup'),
        ),
      ),
    );
  }
}