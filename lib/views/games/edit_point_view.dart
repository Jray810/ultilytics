import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditPointView extends StatefulWidget {
  final String teamID;
  final String gameID;
  final String pointID;
  final DocumentReference docRef;
  final CollectionReference colRef;

  const EditPointView({Key? key, required this.teamID, required this.gameID, required this.pointID, required this.docRef, required this.colRef}) : super(key: key) ;

  @override
  State<EditPointView> createState() => _EditPointViewState();
}

class _EditPointViewState extends State<EditPointView> {
  late bool ourPossession;
  late String possessionOwner;

  @override
  void initState() {
    super.initState();
    ourPossession = true;
    possessionOwner = 'field';
    widget.colRef.orderBy('eventNumber').get().then(
      ((value) {
        if (value.docs.length <= 1) return;
        String eventType = value.docs.last.get('eventType');
        possessionOwner = value.docs.last.get('eventOwner');
        ourPossession = possessionOwner != 'opponent';
        if (['goal', 'interception', 'possession'].contains(eventType)) {
          return;
        }
        if (['stall', 'block'].contains(eventType)) {
          if (ourPossession) {possessionOwner = 'field';}
          return;
        }
        ourPossession = !ourPossession;
        possessionOwner = ourPossession ? 'field' : 'opponent';
      })
    );
  }

  void changePossession() {
    setState(() {
      ourPossession = !ourPossession;
      if (!ourPossession) {
        possessionOwner = 'opponent';
      }
    });
  }

  void setPossessionOwner(String owner) {
    setState(() {
      possessionOwner = owner;
    });
  }

  Widget _buildEventItem(BuildContext context, DocumentSnapshot eventInfo) {
    String eventOwner = eventInfo['eventOwner'];
    String eventType = eventInfo['eventType'];
    return Text(
      eventOwner + ' ' + eventType,
    );
  }

  Widget _friendlyDialog(BuildContext context, String eventOwner) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:
        ourPossession ?
        [
          OutlinedButton(
            onPressed: () async {
              QuerySnapshot qSnap = await widget.colRef.get();
              int eventNum = qSnap.docs.length + 1;
              setPossessionOwner(eventOwner);
              await widget.colRef.add(
                {
                  'eventNumber' : eventNum,
                  'eventOwner' : eventOwner,
                  'eventType' : 'goal',
                }
              );
              Navigator.of(context).pop();
            },
            child: const Text('Goal'),
          ),
          OutlinedButton(
            onPressed: () async {
              QuerySnapshot qSnap = await widget.colRef.get();
              int eventNum = qSnap.docs.length + 1;
              changePossession();
              await widget.colRef.add(
                {
                  'eventNumber' : eventNum,
                  'eventOwner' : eventOwner,
                  'eventType' : 'drop',
                }
              );
              Navigator.of(context).pop();
            },
            child: const Text('Drop'),
          ),
        ]
        :
        [
          OutlinedButton(
            onPressed: () async {
              QuerySnapshot qSnap = await widget.colRef.get();
              int eventNum = qSnap.docs.length + 1;
              changePossession();
              await widget.colRef.add(
                {
                  'eventNumber' : eventNum,
                  'eventOwner' : eventOwner,
                  'eventType' : 'interception',
                }
              );
              Navigator.of(context).pop();
            },
            child: const Text('Interception'),
          ),
          OutlinedButton(
            onPressed: () async {
              QuerySnapshot qSnap = await widget.colRef.get();
              int eventNum = qSnap.docs.length + 1;
              changePossession();
              setPossessionOwner(eventOwner);
              await widget.colRef.add(
                {
                  'eventNumber' : eventNum,
                  'eventOwner' : eventOwner,
                  'eventType' : 'goal',
                }
              );
              Navigator.of(context).pop();
            },
            child: const Text('Callahan'),
          ),
          OutlinedButton(
            onPressed: () async {
              QuerySnapshot qSnap = await widget.colRef.get();
              int eventNum = qSnap.docs.length + 1;
              changePossession();
              setPossessionOwner('field');
              await widget.colRef.add(
                {
                  'eventNumber' : eventNum,
                  'eventOwner' : eventOwner,
                  'eventType' : 'stall',
                }
              );
              Navigator.of(context).pop();
            },
            child: const Text('Stall'),
          ),
        ]
    );
  }

  Widget _opponentDialog(BuildContext context, String eventOwner) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:
        ourPossession ?
        [
          OutlinedButton(
            onPressed: () async {
              QuerySnapshot qSnap = await widget.colRef.get();
              int eventNum = qSnap.docs.length + 1;
              changePossession();
              await widget.colRef.add(
                {
                  'eventNumber' : eventNum,
                  'eventOwner' : eventOwner,
                  'eventType' : 'goal',
                }
              );
              Navigator.of(context).pop();
            },
            child: const Text('Callahan'),
          ),
          OutlinedButton(
            onPressed: () async {
              QuerySnapshot qSnap = await widget.colRef.get();
              int eventNum = qSnap.docs.length + 1;
              changePossession();
              await widget.colRef.add(
                {
                  'eventNumber' : eventNum,
                  'eventOwner' : eventOwner,
                  'eventType' : 'stall',
                }
              );
              Navigator.of(context).pop();
            },
            child: const Text('Stall'),
          ),
        ]
        :
        [
          OutlinedButton(
            onPressed: () async {
              QuerySnapshot qSnap = await widget.colRef.get();
              int eventNum = qSnap.docs.length + 1;
              changePossession();
              setPossessionOwner('field');
              await widget.colRef.add(
                {
                  'eventNumber' : eventNum,
                  'eventOwner' : eventOwner,
                  'eventType' : 'drop',
                }
              );
              Navigator.of(context).pop();
            },
            child: const Text('Drop'),
          ),
          OutlinedButton(
            onPressed: () async {
              QuerySnapshot qSnap = await widget.colRef.get();
              int eventNum = qSnap.docs.length + 1;
              await widget.colRef.add(
                {
                  'eventNumber' : eventNum,
                  'eventOwner' : eventOwner,
                  'eventType' : 'goal',
                }
              );
              Navigator.of(context).pop();
            },
            child: const Text('Goal'),
          ),
        ]
    );
  }

  Widget _buildPopup(BuildContext context, String eventOwner) {
    return AlertDialog(
      title: Text(eventOwner),
      content: Container(
        child: eventOwner == 'opponent' ? _opponentDialog(context, eventOwner) : _friendlyDialog(context, eventOwner),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  Widget _eventButton(BuildContext context, double buttonWidth, String eventOwner) {
    bool isOwner = eventOwner == possessionOwner;

    return OutlinedButton(
      onPressed: () async {
        if (isOwner && eventOwner != 'opponent') return;
        QuerySnapshot qSnap = await widget.colRef.get();
        int eventNum = qSnap.docs.length + 1;
        String eventType;
        if (eventOwner == 'field') {
          eventType = 'throwaway';
          eventOwner = possessionOwner;
          setPossessionOwner('field');
          changePossession();
        } else if ((eventOwner == 'opponent' && ourPossession) || (eventOwner != 'opponent' && !ourPossession)) {
          eventType = 'block';
          setPossessionOwner('field');
          changePossession();
        } else {
          eventType = 'possession';
          setPossessionOwner(eventOwner);
        }
        await widget.colRef.add(
          {
            'eventNumber' : eventNum,
            'eventOwner' : eventOwner,
            'eventType' : eventType,
          }
        );
      },
      onLongPress: () {
        if (isOwner && eventOwner != 'opponent') return;
        if (eventOwner != 'field')
        {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopup(context, eventOwner),
          );
        }
      },
      style: OutlinedButton.styleFrom(
        fixedSize: Size.fromWidth(buttonWidth),
      ),
      child: Text(
        eventOwner,
        style: TextStyle(
          color: isOwner ? Colors.green : Colors.blue,
        ),
      ),
    );
  }

  Widget _buildEventControls(BuildContext context, DocumentSnapshot pointInfo) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('Players'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            _eventButton(context, width/4, pointInfo['players']['player1']),
            _eventButton(context, width/4, pointInfo['players']['player2']),
            _eventButton(context, width/4, pointInfo['players']['player3']),
            _eventButton(context, width/4, pointInfo['players']['player4']),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            _eventButton(context, width/4, pointInfo['players']['player5']),
            _eventButton(context, width/4, pointInfo['players']['player6']),
            _eventButton(context, width/4, pointInfo['players']['player7']),
            _eventButton(context, width/4, 'unknown'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _eventButton(context, width/3, 'opponent'),
            _eventButton(context, width/3, 'field'),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text('Score'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Text(
              ourPossession ? 'Offense' : 'Defense',
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Text('Events'),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                  child: Container(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: widget.colRef.orderBy('eventNumber').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return const Text('Loading...');
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) => _buildEventItem(context, snapshot.data!.docs[index]),
                        );
                      }
                    )
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: OutlinedButton(
              onPressed: () async {
                QuerySnapshot qSnap = await widget.colRef.get();
                if (qSnap.docs.length <= 1) return;
                widget.colRef.orderBy('eventNumber').limitToLast(1).get().then(
                  (QuerySnapshot querySnapshot) {
                    querySnapshot.docs.forEach(
                      (element) {
                        widget.colRef.doc(element.id).delete();
                      }
                    );
                  }
                );
              },
              child: Text('Undo'),
            ),
          ),
          Container(
            child: StreamBuilder(
              stream: widget.docRef.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Loading...');
                return _buildEventControls(context, snapshot.data as DocumentSnapshot);
              }
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text('Stoppage'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}