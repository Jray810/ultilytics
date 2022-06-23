import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultilytics/constants/routes.dart';

class TeamListView extends StatefulWidget {
  const TeamListView({Key? key}) : super(key: key);

  @override
  State<TeamListView> createState() => _TeamListViewState();
}

class MockTeamInfo {
  const MockTeamInfo({required this.name});

  final String name;
}

class _TeamListViewState extends State<TeamListView> {

  bool isLoggedIn = false;

  static const List<MockTeamInfo> teamList = [
    MockTeamInfo(name: "Name 1"),
    MockTeamInfo(name: "Name 2"),
    MockTeamInfo(name: "Name 3"),
    MockTeamInfo(name: "Name 4"),
  ];

  late final String title;

  Widget _buildListItem(BuildContext context, MockTeamInfo TeamInfo) {
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
                  child: Image.network('https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3RvcmV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60', width: 74, height: 74, fit: BoxFit.cover)
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
                      Text(TeamInfo.name)
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text('teamid'),
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
      body: ListView.builder(
        itemCount: teamList.length,
        itemBuilder: (context, index) => _buildListItem(context, teamList[index]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
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