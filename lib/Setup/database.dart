import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference nameCollection =
      FirebaseFirestore.instance.collection('names');
  final CollectionReference gratitudeColection =
      FirebaseFirestore.instance.collection('gratitudeJournalEntries');

  Future updateUserData(String name) async {
    return await nameCollection.doc(uid).set({
      'name': name,
    });
  }

  Future updateGratitudeJournalEntry(
      String ans1, String ans2, String ans3) async {
    return await gratitudeColection
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
}
