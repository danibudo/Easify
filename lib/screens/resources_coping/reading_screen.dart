import 'package:easify/screens/resources_coping/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './text_widget.dart';

class ReadingScreen extends StatelessWidget {
  String title;
  int topicId;
  ReadingScreen({@required this.title, @required this.topicId});

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

    return Scaffold(
      backgroundColor: Color(0xFFCDE5D7),
      body: Column(
        children: [
          Container(
            child: _header,
            margin: EdgeInsets.only(
              top: size.height * 0.03,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * .03),
            child: Text(
              title,
              style: TextStyle(
                fontSize: size.height * 0.022,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.7,
              ),
            ),
          ),
          Container(
            height: size.height * 0.75,
            margin: EdgeInsets.only(
              top: size.height * 0.03,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
            ),
            width: size.width * 0.85,
            child: ListView(
              children: [
                TextWidget(topicId: topicId),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFFC6CCD2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
