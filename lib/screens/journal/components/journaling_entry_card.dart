import 'package:flutter/material.dart';

class JournalingEntryCard extends StatelessWidget {
  int emotionId;
  List<String> anchors;
  String text;
  JournalingEntryCard(
      {@required this.emotionId, @required this.anchors, @required this.text});
  final _emotionPicNames = [
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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
