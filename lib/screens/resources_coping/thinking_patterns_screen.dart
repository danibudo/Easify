import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './thinking_pattern_button.dart';
import './texts.dart';

class ThinkingPatternsScreen extends StatefulWidget {
  ThinkingPatternsScreen();
  @override
  _ThinkingPatternsScreenState createState() => _ThinkingPatternsScreenState();
}

class _ThinkingPatternsScreenState extends State<ThinkingPatternsScreen> {
  String titleText = "Choose a pattern from the list above";
  String contentText = "";
  List<int> buttonIds = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<ThinkingPatternButton> fetchButtons() {
    List<ThinkingPatternButton> buttons = [];
    for (var id in buttonIds) {
      final button = ThinkingPatternButton(
          onPressed: () {
            setState(() {
              this.titleText = Texts.patternsName[id];
              this.contentText = Texts.patternsText[id];
            });
            ;
          },
          id: id);
      buttons.add(button);
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _header = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: size.height * 0.035,
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        SizedBox(
          width: size.width * 0.3,
        ),
        Text(
          "Easify",
          style: TextStyle(
            fontFamily: "Corbel",
            fontSize: size.height * 0.035,
            color: Colors.black,
          ),
        ),
      ],
    );
    final buttons = fetchButtons();
    Widget handleTextArea() {
      if (contentText.isEmpty) {
        return SizedBox(
          height: 0,
          width: 0,
        );
      } else {
        return Container(
          height: size.height * 0.55,
          margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.02,
          ),
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02,
            horizontal: size.width * 0.04,
          ),
          child: ListView(children: [Text(contentText)]),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }
    }

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: _header,
              margin: EdgeInsets.only(
                top: size.height * 0.03,
              ),
            ),
            Container(
              width: size.width * 0.9,
              child: Column(
                children: [
                  Row(
                    children: buttons.sublist(0, 5),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Row(
                    children: buttons.sublist(5, buttons.length),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ],
              ),
            ),
            Container(
              child: Text(titleText),
              margin: EdgeInsets.only(
                top: size.height * 0.03,
              ),
            ),
            handleTextArea(),
          ],
        ),
      ),
    );
  }
}
