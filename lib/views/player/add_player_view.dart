import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPlayerView extends StatefulWidget {
  final String teamID;

  const AddPlayerView({Key? key, required this.teamID}) : super(key: key);

  @override
  State<AddPlayerView> createState() => _AddPlayerViewState();
}

class _AddPlayerViewState extends State<AddPlayerView> {

  late TextEditingController playerNameController;
  late TextEditingController jerseyNumberController;

  @override
  void initState() {
    super.initState();
    playerNameController = TextEditingController();
    jerseyNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Player View')
      ),
      body: Center(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: TextFormField(
                      controller: playerNameController,
                      decoration: const InputDecoration(
                        labelText: 'Player Name',
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: TextFormField(
                      controller: jerseyNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Jersey Number',
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('teams').doc(widget.teamID).collection('roster').add(
                  {
                    'playerName' : playerNameController.text,
                    'jerseyNumber' : jerseyNumberController.text,
                  }
                );
                Navigator.pop(context);
              },
              child: const Text('Create and Add Player'),
            ),
          ],
        ),
      ),
    );
  }
}