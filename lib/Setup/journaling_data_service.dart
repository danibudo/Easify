import 'package:easify/Setup/database.dart';
import 'package:easify/models/theuser.dart';
import 'package:easify/Setup/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> uploadGratitudeJournalEntry(
    String ans1, String ans2, String ans3) {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User user = auth.currentUser;
  final uid = user.uid;
  DatabaseService(uid: uid).updateGratitudeJournalEntry(ans1, ans2, ans3);
}
