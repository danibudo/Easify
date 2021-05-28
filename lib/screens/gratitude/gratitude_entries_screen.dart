import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GratitudeEntriesScreen extends StatefulWidget {
  @override
  _GratitudeEntriesScreenState createState() => _GratitudeEntriesScreenState();
}

class _GratitudeEntriesScreenState extends State<GratitudeEntriesScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Components
    var _header = Row(
      children: [
        IconButton(
          iconSize: size.width * 0.07,
          icon: Icon(
            Icons.home_rounded,
            color: Colors.grey,
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        SizedBox(
          width: size.width * 0.30,
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.01),
          child: Text(
            "Easify",
            style: TextStyle(
              fontFamily: "Corbel",
              fontSize: size.height * 0.03,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            _header,
          ],
        ),
      ),
    );
  }
}
