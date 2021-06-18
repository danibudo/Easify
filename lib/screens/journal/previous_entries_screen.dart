import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PreviousEntriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final User user = FirebaseAuth.instance.currentUser;
    final CollectionReference journalCollection =
        FirebaseFirestore.instance.collection('journalEntries');
    final CollectionReference journalEntries =
        journalCollection.doc(user.uid).collection('entries');
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
      backgroundColor: Colors.blue.shade100,
      body: Container(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.03,
            ),
            child: _header,
          ),
          Container(
            height: size.height * 0.8,
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
                      final doc = snapshot.data.docs[index];
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Container(
                              width: size.width,
                              child: Column(
                                children: [
                                  Text('Emotion ID: ' +
                                      doc['emotionId'].toString()),
                                  Text('Anchors:' + doc['anchors'].toString()),
                                  Text('Text:' + doc['text']),
                                ],
                              ),
                            ),
                          ),
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
