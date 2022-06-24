import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultilytics/constants/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeamListView extends StatefulWidget {
  const TeamListView({Key? key}) : super(key: key);

  @override
  State<TeamListView> createState() => _TeamListViewState();
}

class _TeamListViewState extends State<TeamListView> {

  bool isLoggedIn = false;

  Widget _buildListItem(BuildContext context, DocumentSnapshot TeamInfo) {
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(TeamInfo['imageSource'], width: 74, height: 74, fit: BoxFit.cover)
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 1, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(TeamInfo['teamName'])
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('id: ${TeamInfo.id}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                child: Icon(CupertinoIcons.chevron_forward, size: 24),
              ),
            ],
          ),
        ]
      ),
      onTap: () {
        Navigator.of(context).pushNamed(teamRoute);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ultilytics'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                if (isLoggedIn) {
                  Navigator.of(context).pushNamed(signedInProfileRoute);
                } else {
                  Navigator.of(context).pushNamed(guestProfileRoute);
                }
              },
              child: Icon(CupertinoIcons.person)
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('teams').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => _buildListItem(context, snapshot.data!.docs[index]),
          );
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
        child: FloatingActionButton.extended(
          icon: const Icon(CupertinoIcons.add),
          label: const Text('Add Team'),
          onPressed: () {
            Navigator.of(context).pushNamed(addTeamRoute);
          },
        ),
      ),
    );
  }
}