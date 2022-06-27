import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ultilytics/constants/routes.dart';
import 'package:ultilytics/views/player/add_player_view.dart';

class TeamRosterView extends StatefulWidget {
  final String teamID;

  const TeamRosterView({Key? key, required this.teamID}) : super(key: key);

  @override
  State<TeamRosterView> createState() => _TeamRosterViewState();
}

class _TeamRosterViewState extends State<TeamRosterView> {

  bool isLoggedIn = false;
  
  Widget _buildListItem(BuildContext context, DocumentSnapshot PlayerInfo) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              print("Confirm remove player?");
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(PlayerInfo['jerseyNumber'].toString()),
                ),
              ]
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(PlayerInfo['playerName']),
              )
            ),
          ]
        ),
        onTap: () {
          Navigator.of(context).pushNamed(playerInfoRoute);
        },
      )
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
              child: const Icon(CupertinoIcons.person)
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('teams').doc(widget.teamID).collection('roster').snapshots(),
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
          label: const Text('Add Player'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPlayerView(teamID: widget.teamID)));
          },
        )
      ),
    );
  }
}