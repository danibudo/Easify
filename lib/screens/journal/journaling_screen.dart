import 'package:easify/screens/journal/components/emotion_anchor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JournalingScreen extends StatelessWidget {
  int emotionId;

  JournalingScreen({this.emotionId});

  @override
  Widget build(BuildContext context) {
    var _emotionPicNames = [
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
    var _anchorTexts = [
      "Money",
      "Health",
      "School",
      "Work",
      "Family",
      "Relationships",
      "Sleep",
      "Friends",
      "Spirituality",
    ];

    List<EmotionAnchor> fetchAnchors() {
      List<EmotionAnchor> list = [];
      for (int i = 0; i < _anchorTexts.length; i++) {
        var anchorWidth;
        if (_anchorTexts[i].length > 7)
          anchorWidth = size.width * 0.0225 * (_anchorTexts[i].length - 2);
        else if (_anchorTexts[i].length < 5)
          anchorWidth = size.width * 0.026 * (_anchorTexts[i].length + 1);
        else
          anchorWidth = size.width * 0.025 * _anchorTexts[i].length;
        var instance = EmotionAnchor(
          anchorText: _anchorTexts[i],
          width: anchorWidth,
        );
        list.add(instance);
      }
      return list;
    }

    var _anchors = fetchAnchors();
    List<EmotionAnchor> activeAnchors = [];

    List<EmotionAnchor> fetchActiveAnchors() {
      for (int i = 0; i < _anchors.length; i++) {
        if (_anchors[i].active) activeAnchors.add(_anchors[i]);
      }
    }

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
            fetchActiveAnchors();
            for (var element in activeAnchors) {
              print(element.anchorText + " ");
            }
            activeAnchors.clear();
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
              margin: EdgeInsets.only(
                top: size.height * 0.04,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: size.height * 0.03,
                bottom: size.height * 0.015,
              ),
              width: size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: size.height * 0.08,
                      child: Image.asset("assets/images/emojis/" +
                          _emotionPicNames[emotionId])),
                  Container(
                    width: size.width * 0.5,
                    child: Text(
                      "Take a moment to notice what makes you feel this way.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: size.width * 0.07,
                right: size.width * 0.07,
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: _anchors.sublist(0, 5),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    margin: EdgeInsets.only(
                      top: size.height * 0.01,
                      bottom: size.height * 0.01,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.95,
                    child: Container(
                      child: Row(
                        children: _anchors.sublist(5, _anchors.length),
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
