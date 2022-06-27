import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ultilytics/constants/routes.dart';
import 'package:ultilytics/views/teams/team_roster_view.dart';

class TeamView extends StatefulWidget {
  final String teamID;

  const TeamView({Key? key, required this.teamID }) : super(key: key);

  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {

  bool isLoggedIn = false;

  Widget _buildTeamPage(BuildContext context, DocumentSnapshot TeamInfo) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TeamInfo['teamName'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    TeamInfo['seasonNumber'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )
                  ),
                  Text(
                    'id: ${TeamInfo.id}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 180, 0, 0),
            child: Container(
              width: double.infinity,
              height: 700,
              decoration: const BoxDecoration(),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.amber.shade50,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                      child: Text(TeamInfo['division']),
                    ),
                    const Text('User Access Role'),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Align(
                              alignment: AlignmentDirectional(-0.9, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text('Games')
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        Navigator.of(context).pushNamed(gameInfoRoute);
                                      },
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {
                                                Navigator.of(context).pushNamed(removeTeamRoute);
                                              },
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                              icon: Icons.delete,
                                              label: 'Delete',
                                            ),
                                          ],
                                        ),
                                        child: const ListTile(
                                          title: Text('Game Title'),
                                          subtitle: Text('Game subtitle'),
                                          trailing: Icon(CupertinoIcons.chevron_forward),
                                        )
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(TeamInfo['imageSource']),
                ),
              ),
            ],
          ),
        ],
      ),
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('teams').doc(widget.teamID).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return _buildTeamPage(context, snapshot.data as DocumentSnapshot);
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(CupertinoIcons.add),
        label: const Text('Add Game'),
        onPressed: () {
          Navigator.of(context).pushNamed(addGameRoute);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton (
              icon: const Icon(CupertinoIcons.person_2),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TeamRosterView(teamID: 'TFYuB9Jz4djah520IkpQ')));
              },
            ),
            IconButton(
              icon: const Icon(CupertinoIcons.bars),
              onPressed: () {
                Navigator.of(context).pushNamed(removeTeamRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}