import 'package:easify/screens/resources_coping/reading_screen.dart';
import 'package:easify/screens/resources_coping/text_widget.dart';
import 'package:easify/screens/resources_coping/thinking_patterns_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'texts.dart';

class ResourcesTopicsScreen extends StatelessWidget {
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
    void onTapToReadingScreen(String title, int id) {
      print("onTap topic ID: " + id.toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReadingScreen(
            title: title,
            topicId: id,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFbcf4de),
      body: Container(
        child: Column(
          children: [
            // Container with header
            Container(
              child: _header,
              margin: EdgeInsets.only(
                top: size.height * 0.03,
              ),
            ),
            // Container with buttons
            Container(
              width: size.width * 0.85,
              margin: EdgeInsets.only(top: size.height * 0.05),
              child: Column(
                children: [
                  Text(
                    "Topics to read on:",
                    style: TextStyle(
                      fontSize: size.height * 0.022,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapToReadingScreen("Depression", 0);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: size.height * 0.04,
                        bottom: size.height * 0.05,
                      ),
                      width: size.width * 0.6,
                      alignment: Alignment.center,
                      child: Text(
                        "Depression",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.7,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.2,
                        vertical: size.height * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEC6CA),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapToReadingScreen("Anxiety", 1);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: size.height * 0.05,
                      ),
                      width: size.width * 0.6,
                      alignment: Alignment.center,
                      child: Text(
                        "Anxiety",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.7,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.2,
                        vertical: size.height * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEC6CA),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapToReadingScreen("Self-Esteem", 2);
                    },
                    child: Container(
                      width: size.width * 0.6,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        bottom: size.height * 0.05,
                      ),
                      child: Text(
                        "Self-Esteem",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.17,
                        vertical: size.height * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEC6CA),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThinkingPatternsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: size.width * 0.6,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        bottom: size.height * 0.03,
                      ),
                      child: Text(
                        "Thinking Patterns",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.15,
                        vertical: size.height * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEC6CA),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
