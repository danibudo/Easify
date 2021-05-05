import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../Setup/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../gratitude/gratitude_entry_card.dart';

class GratitudeEntriesScreen extends StatefulWidget {
  @override
  _GratitudeEntriesScreenState createState() => _GratitudeEntriesScreenState();
}

class _GratitudeEntriesScreenState extends State<GratitudeEntriesScreen> {
  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser;
    final size = MediaQuery.of(context).size;
    final CollectionReference gratitudeCollection =
        FirebaseFirestore.instance.collection('gratitudeJournalEntries');
    final CollectionReference gratitudeJournalEntries =
        gratitudeCollection.doc(user.uid).collection('entries');
    // Components
    var _header = Row(
      children: [
        IconButton(
          iconSize: size.width * 0.07,
          icon: Icon(
            Icons.home_rounded,
            color: Colors.grey,
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        SizedBox(
          width: size.width * 0.30,
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.01),
          child: Text(
            "Easify",
            style: TextStyle(
              fontFamily: "Corbel",
              fontSize: size.height * 0.03,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            _header,
            Container(
              height: size.height * 0.8,
              width: size.width * 0.8,
              child: StreamBuilder(
                stream: gratitudeJournalEntries.snapshots(),
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
                                    Text('Answer 1: ' + doc['answer1']),
                                    Text('Answer 2 :' + doc['answer2']),
                                    Text('Answer 3 :' + doc['answer3']),
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
          ],
        ),
      ),
    );
  }
}
