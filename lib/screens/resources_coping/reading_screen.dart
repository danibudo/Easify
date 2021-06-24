import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadingScreen extends StatelessWidget {
  String title;
  String text;
  ReadingScreen({@required this.title, @required this.text});

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
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
