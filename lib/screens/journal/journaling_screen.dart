import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JournalingScreen extends StatelessWidget {
  int emotionId;

  JournalingScreen({this.emotionId});

  @override
  Widget build(BuildContext context) {
    var emotionPicNames = [
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
    var size = MediaQuery.of(context).size;
    var _header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Text(
          "Easify",
          style: TextStyle(
            fontFamily: "Corbel",
            fontSize: size.height * 0.035,
            color: Colors.white,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.done_outline_rounded,
            color: Colors.white,
            size: size.height * 0.035,
          ),
          onPressed: () {
            print("Finishing journal entry");
          },
        ),
      ],
    );

    return Scaffold(
      body: Container(
        color: Colors.blue.shade200,
        child: Column(
          children: [
            Container(
              child: _header,
              margin: EdgeInsets.only(top: size.height * 0.04),
            ),
            Text("Emotion id: " + emotionId.toString()),
            Image.asset("assets/images/emojis/" + emotionPicNames[emotionId]),
          ],
        ),
      ),
    );
  }
}
