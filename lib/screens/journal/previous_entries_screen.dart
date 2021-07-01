import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './components/journal_entry_card.dart';
import 'converters.dart';

class PreviousEntriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final User user = FirebaseAuth.instance.currentUser;
    final CollectionReference journalCollection =
        FirebaseFirestore.instance.collection('journalEntries');
    final CollectionReference journalEntries =
        journalCollection.doc(user.uid).collection('entries');
    final emotionPicNames = [
      "happyOK.png",
      "excitedOK.png",
      "gratefulOK.png",
      "relaxedOK.png",
      "contentOK.PNG",
      "tiredOK.png",
      "boredOK.png",
      "confusedOK.png",
      "anxiousOK.png",
      "angryOK.PNG",
      "stressedOK.PNG",
      "sadOK.PNG"
    ];
    var _header = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
            size: size.height * 0.035,
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        Container(
          margin: EdgeInsets.only(left: size.width * 0.31),
          child: Text(
            "Easify",
            style: TextStyle(
              fontFamily: "Corbel",
              fontSize: size.height * 0.035,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFF3F83D1),
      body: Container(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.03,
            ),
            child: _header,
          ),
          Container(
            height: size.height * 0.899,
            width: size.width * 0.8,
            child: StreamBuilder(
              stream: journalEntries.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      final reversedList = snapshot.data.docs.reversed.toList();
                      final doc = reversedList[index];
                      return Column(
                        children: [
                          JournalEntryCard(
                              emotionId: doc['emotionId'],
                              anchors: Converter.convertListToListOfString(
                                  doc['anchors']),
                              text: doc['text'],
                              width: size.width),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
