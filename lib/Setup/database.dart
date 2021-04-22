import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference nameCollection =
      FirebaseFirestore.instance.collection('names');

  Future updateUserData(String name) async {
    return await nameCollection.doc(uid).set({
      'name': name,
    });
  }
}
