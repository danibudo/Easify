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
  String titleText =
      "Thought patterns are best described as a person’s usual way of thinking. This term can also be described as habitual thinking, since it describes a habitual mental process. Thinking patterns can be negative or positive. Choose a pattern from the list above to read about it in more detail.";
  String contentText = "";
  List<int> buttonIds = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  List<ThinkingPatternButton> fetchButtons() {
    List<ThinkingPatternButton> buttons = [];
    for (var id in buttonIds) {
      final button = ThinkingPatternButton(
          onPressed: () {
            setState(() {
              this.titleText = Texts.patternsName[id];
              this.contentText = Texts.patternsText[id].first;
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
          margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.02,
          ),
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.025,
            horizontal: size.width * 0.04,
          ),
          child: Text(
            contentText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.height * 0.023,
            ),
          ),
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
                  Container(
                    child: Row(
                      children: buttons.sublist(0, 3),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: buttons.sublist(3, 6),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: buttons.sublist(6, 8),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  Row(
                    children: [buttons.last],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                titleText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.height * 0.0215,
                  fontWeight: FontWeight.w600,
                ),
              ),
              margin: EdgeInsets.symmetric(
                vertical: size.height * 0.03,
              ),
              width: size.width * 0.85,
            ),
            handleTextArea(),
          ],
        ),
      ),
    );
  }
}
