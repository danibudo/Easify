import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference nameCollection =
      FirebaseFirestore.instance.collection('names');
  final CollectionReference gratitudeCollection =
      FirebaseFirestore.instance.collection('gratitudeJournalEntries');
  final CollectionReference journalCollection =
      FirebaseFirestore.instance.collection('journalEntries');

  Future updateUserData(String name) async {
    return await nameCollection.doc(uid).set({
      'name': name,
    });
  }

  Future updateGratitudeJournalEntry(
      String ans1, String ans2, String ans3) async {
    return await gratitudeCollection
        .doc(uid)
        .collection('entries')
        .doc(getCurrentTimeStamp())
        .set({
      'answer1': ans1,
      'answer2': ans2,
      'answer3': ans3,
    });
  }

  String getCurrentTimeStamp() {
    DateTime _now = DateTime.now();
    String timeStamp = 'y' +
        _now.year.toString() +
        'm' +
        _now.month.toString() +
        'd' +
        _now.day.toString() +
        'h' +
        _now.hour.toString() +
        'm' +
        _now.minute.toString() +
        's' +
        _now.second.toString();
    return timeStamp;
  }

  Future fetchGratitudeJournalEntries() async {
    QuerySnapshot stuff =
        await gratitudeCollection.doc(uid).collection('entries').get();
    stuff.docs.forEach((element) {
      print(element.data());
    });
  }

  Future updateJournalEntry(
      int emotionId, List<String> anchors, String text) async {
    await journalCollection
        .doc(uid)
        .collection('entries')
        .doc(getCurrentTimeStamp())
        .set({
      'emotionId': emotionId,
      'anchors': anchors,
      'text': text,
    });
  }
}
