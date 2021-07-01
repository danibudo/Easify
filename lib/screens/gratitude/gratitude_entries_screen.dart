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
            color: Colors.black,
          ),
          onPressed: () {
            while (Navigator.canPop(context)) Navigator.pop(context);
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
              fontSize: size.height * 0.0365,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Color(0xFFFFCFB3),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            _header,
            Container(
              margin: EdgeInsets.only(
                top: size.height * 0.0275,
              ),
              child: Text(
                "Your gratitude journal entries:",
                style: TextStyle(
                  fontSize: size.height * 0.023,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: size.height * 0.845,
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
                        final reversedList =
                            snapshot.data.docs.reversed.toList();
                        final doc = reversedList[index];
                        return Column(
                          children: [
                            GratitudeEntryCard(
                              answer1: doc['answer1'],
                              answer2: doc['answer2'],
                              answer3: doc['answer3'],
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
