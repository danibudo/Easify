import 'package:easify/screens/home_screen.dart';
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
      "happy.PNG",
      "excited.PNG",
      "grateful.PNG",
      "relaxed.PNG",
      "content.PNG",
      "tired.PNG",
      "bored.PNG",
      "confused.PNG",
      "anxious.PNG",
      "angry.PNG",
      "stressed.PNG",
      "sad.PNG"
    ];
    var _header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        Text(
          "Easify",
          style: TextStyle(
            fontFamily: "Corbel",
            fontSize: size.height * 0.03,
            color: Colors.white,
          ),
        ),
        IconButton(
          icon: Icon(
            CupertinoIcons.list_bullet,
            color: Colors.white,
          ),
          onPressed: () {
            print("Going to see previous journal entries");
          },
        ),
      ],
    );

    List<EmotionsButton> fetchButtons() {
      List<EmotionsButton> buttons = [];
      String imagesFolderAddress = "assets/images/emojis/";
      print("Addresses:");
      for (int i = 0; i < emotionTexts.length; i++) {
        String imgAddr = imagesFolderAddress + emotionPicNames[i];
        var button = EmotionsButton(
          text: emotionTexts[i],
          imageAddress: imgAddr,
          height: size.height * 0.12,
          width: size.height * 0.12,
          nextStep: () {
            print(emotionTexts[i]);
          },
        );
        buttons.add(button);
      }
      return buttons;
    }

    var _buttons = fetchButtons();

    var _grid = Column(
      children: [
        Container(
          margin: EdgeInsets.all(
            size.width * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buttons[0], _buttons[1], _buttons[2]],
          ),
        ),
        Container(
          margin: EdgeInsets.all(
            size.width * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buttons[3], _buttons[4], _buttons[5]],
          ),
        ),
        Container(
          margin: EdgeInsets.all(
            size.width * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buttons[6], _buttons[7], _buttons[8]],
          ),
        ),
        Container(
          margin: EdgeInsets.all(
            size.width * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buttons[9], _buttons[10], _buttons[11]],
          ),
        ),
      ],
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blue.shade300),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.04),
            Container(
              child: _header,
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
