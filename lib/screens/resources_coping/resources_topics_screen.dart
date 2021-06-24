import 'package:easify/screens/resources_coping/reading_screen.dart';
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
    void onTapToReadingScreen(String title, String text) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReadingScreen(
            title: title,
            text: text,
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
                  Text("Topics to read on:"),
                  GestureDetector(
                    onTap: () {
                      onTapToReadingScreen("Depression", Texts.depressionText);
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
                      onTapToReadingScreen("Anxiety", Texts.anxietyText);
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
                      onTapToReadingScreen("Self-Esteem", Texts.selfEsteemText);
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
                  Container(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
