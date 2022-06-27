import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ultilytics/constants/routes.dart';

class AddTeamView extends StatefulWidget {
  const AddTeamView({Key? key}) : super(key: key);

  @override
  State<AddTeamView> createState() => _AddTeamViewState();
}

class _AddTeamViewState extends State<AddTeamView> {

  late TextEditingController teamNameController;
  late TextEditingController seasonNumberController;
  late String divisionController;
  late TextEditingController accessCodeController;
  late TextEditingController imageSourceController;

  @override
  void initState() {
    super.initState();
    teamNameController = TextEditingController();
    seasonNumberController = TextEditingController();
    divisionController = '';
    accessCodeController = TextEditingController();
    imageSourceController = TextEditingController();
  }

  var items = [
    'High School Boys',
    'High School Girls',
    'College DI Open',
    'College DI Womens',
    'Club Open',
    'Club Womens',
    'Club Mixed',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Team View')
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
                      controller: teamNameController,
                      decoration: const InputDecoration(
                        labelText: 'Team Name',
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12)
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: TextFormField(
                      controller: seasonNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Season Number',
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12)
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: DropdownButtonFormField(
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(
                          () {
                            divisionController = value!;
                          }
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: TextFormField(
                      controller: accessCodeController,
                      decoration: const InputDecoration(
                        labelText: 'Access Code',
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12)
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: TextFormField(
                      controller: imageSourceController,
                      decoration: const InputDecoration(
                        labelText: 'Image Source',
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12)
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('teams').add(
                  {
                    'teamName' : teamNameController.text,
                    'seasonNumber' : seasonNumberController.text,
                    'division' : divisionController,
                    'accessCode' : accessCodeController.text,
                    'imageSource' : imageSourceController.text,
                  }
                );
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Create and Add Team'),
            ),
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