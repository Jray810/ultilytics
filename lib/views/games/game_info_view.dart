import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultilytics/views/games/edit_point_view.dart';

import '../../constants/routes.dart';

class GameInfoView extends StatefulWidget {
  final String teamID;
  final String gameID;

  const GameInfoView({Key? key, required this.teamID, required this.gameID}) : super(key: key);

  @override
  State<GameInfoView> createState() => _GameInfoViewState();
}

class _GameInfoViewState extends State<GameInfoView> {
  bool isLoggedIn = false;

  Widget _buildPointItem(BuildContext context, DocumentSnapshot pointInfo) {
    return ListTile(
      title: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.92,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x35000000),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFF1F4F8),
              width: 1,
            ),
          ),
          child: Padding(
            padding:
                EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      8, 0, 0, 0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: pointInfo['scored'] == true ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          8, 8, 8, 8),
                      child: pointInfo['openingPull'] == true ?
                      Icon(
                        Icons.tsunami,
                        color: Colors.white,
                        size: 24,
                      )
                      :
                      Icon(
                        Icons.anchor,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        12, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          (pointInfo['scored'] ? 'Our ' : 'Their ') + (pointInfo['openingPull'] != pointInfo['scored'] ? 'hold' : 'break'),
                          // style: FlutterFlowTheme.of(context)
                          //     .subtitle1
                          //     .override(
                          //       fontFamily: 'Lexend Deca',
                          //       color: Color(0xFF090F13),
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Our Turnover Count',
                            // style: FlutterFlowTheme.of(
                            //         context)
                            //     .bodyText1
                            //     .override(
                            //       fontFamily: 'Lexend Deca',
                            //       color: Color(0xFF090F13),
                            //       fontSize: 14,
                            //       fontWeight:
                            //           FontWeight.normal,
                            //     ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${pointInfo['ourScore']} - ${pointInfo['theirScore']}',
                        textAlign: TextAlign.end,
                        style: TextStyle(color: pointInfo['ourScore'] < pointInfo['theirScore'] ? Colors.red : Colors.green, fontSize: 20),
                        // style: FlutterFlowTheme.of(context)
                        //     .subtitle2
                        //     .override(
                        //       fontFamily: 'Lexend Deca',
                        //       color: Color(0xFF090F13),
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        DocumentReference docRef = FirebaseFirestore.instance.collection('teams').doc(widget.teamID).collection('games').doc(widget.gameID).collection('points').doc(pointInfo.id);
        CollectionReference colRef = docRef.collection('events');
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPointView(teamID: widget.teamID, gameID: widget.gameID, pointID: pointInfo.id, docRef: docRef, colRef: colRef)));
      },
    );
  }

  Widget _buildGameInfoPage(BuildContext context, DocumentSnapshot gameInfo) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0x32171717),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 4, 0, 0),
                            child: Text(
                              gameInfo['opponent'],
                              // style: FlutterFlowTheme.of(context)
                              //     .title1
                              //     .override(
                              //       fontFamily: 'Lexend Deca',
                              //       color: Colors.white,
                              //       fontSize: 24,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Text(
                            gameInfo['tournament'],
                            // style: FlutterFlowTheme.of(context)
                            //     .title1
                            //     .override(
                            //       fontFamily: 'Lexend Deca',
                            //       color: Colors.white,
                            //       fontSize: 36,
                            //       fontWeight: FontWeight.normal,
                            //     ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 0),
                              child: Text(
                                'Score Goes Here',
                                textAlign: TextAlign.end,
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyText2
                                //     .override(
                                //       fontFamily: 'Lexend Deca',
                                //       color: Color(0xB3FFFFFF),
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w300,
                                //     ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Text(
                        'Points',
                        // style: FlutterFlowTheme.of(context)
                        //     .bodyText1
                        //     .override(
                        //       fontFamily: 'Lexend Deca',
                        //       color: Color(0xFF090F13),
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.normal,
                        //     ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
              child: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('teams').doc(widget.teamID).collection('games').doc(widget.gameID).collection('points').orderBy('pointNumber').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) => _buildPointItem(context, snapshot.data!.docs[index]),
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ],
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
      backgroundColor: Color(0xFFF1F4F8),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('teams').doc(widget.teamID).collection('games').doc(widget.gameID).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return _buildGameInfoPage(context, snapshot.data as DocumentSnapshot);
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(CupertinoIcons.add),
        label: const Text('Add Point'),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton (
              icon: const Icon(CupertinoIcons.person_2),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(CupertinoIcons.bars),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}