import 'package:easify/screens/home_screen.dart';
import 'package:easify/screens/journal/journaling_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './components/emotions_button.dart';

class EmotionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // Components
    var emotionTexts = [
      "Happy",
      "Excited",
      "Grateful",
      "Relaxed",
      "Content",
      "Tired",
      "Bored",
      "Confused",
      "Anxious",
      "Angry",
      "Stressed",
      "Sad"
    ];
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
            CupertinoIcons.list_bullet,
            color: Colors.white,
            size: size.height * 0.035,
          ),
          onPressed: () {
            print("Going to see previous journal entries");
          },
        ),
      ],
    );
    var _titleText = Text(
      "How do you feel right now?",
      style: TextStyle(
        color: Colors.white,
        fontSize: size.height * 0.025,
      ),
    );

    List<EmotionsButton> fetchButtons() {
      List<EmotionsButton> buttons = [];
      String imagesFolderAddress = "assets/images/emojis/";
      for (int i = 0; i < emotionTexts.length; i++) {
        String imgAddr = imagesFolderAddress + emotionPicNames[i];
        var button = EmotionsButton(
          text: emotionTexts[i],
          imageAddress: imgAddr,
          height: size.height * 0.12,
          width: size.height * 0.12,
          nextStep: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JournalingScreen(emotionId: i)));
          },
          id: i,
        );
        buttons.add(button);
      }
      return buttons;
    }

    var _buttons = fetchButtons();
    var _gridRowMargins = EdgeInsets.only(
      left: size.width * 0.04,
      right: size.width * 0.04,
      bottom: size.height * 0.04,
    );
    var _grid = Container(
        margin: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          top: size.height * 0.02,
          bottom: size.height * 0.02,
        ),
        child: Column(
          children: [
            Container(
              margin: _gridRowMargins,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buttons[0], _buttons[1], _buttons[2]],
              ),
            ),
            Container(
              margin: _gridRowMargins,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buttons[3], _buttons[4], _buttons[5]],
              ),
            ),
            Container(
              margin: _gridRowMargins,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buttons[6], _buttons[7], _buttons[8]],
              ),
            ),
            Container(
              margin: _gridRowMargins,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buttons[9], _buttons[10], _buttons[11]],
              ),
            ),
          ],
        ));

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.04),
        decoration: BoxDecoration(color: Colors.blue.shade300),
        child: Column(
          children: [
            Container(
              child: _header,
            ),
            Container(
              child: _titleText,
              margin: EdgeInsets.only(
                top: size.height * 0.02,
                bottom: size.height * 0.04,
              ),
            ),
            Container(
              child: _grid,
            ),
          ],
        ),
      ),
    );
  }
}
