import 'package:flutter/material.dart';

class GratitudeEntryCard extends StatelessWidget {
  GratitudeEntryCard({this.answer1, this.answer2, this.answer3});
  String answer1;
  String answer2;
  String answer3;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(answer1),
          Text(answer2),
          Text(answer3),
        ],
      ),
      decoration: BoxDecoration(border: Border.all(width: 2)),
    );
  }
}
