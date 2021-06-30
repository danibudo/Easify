import 'package:easify/screens/help_right_now/breathing_text.dart';
import 'package:easify/screens/resources_coping/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerspectiveScaleScreen extends StatefulWidget {
  @override
  _PerspectiveScaleScreenState createState() => _PerspectiveScaleScreenState();
}

class _PerspectiveScaleScreenState extends State<PerspectiveScaleScreen> {
  double status = 5;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _header = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            "Easify",
            style: TextStyle(
              fontFamily: "Corbel",
              fontSize: size.height * 0.037,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
    final _scale = Slider(
      min: 1,
      max: 10,
      value: status,
      onChanged: (double newStatus) {
        setState(() {
          status = newStatus;
        });
      },
      divisions: 9,
      activeColor: Colors.blue.shade700,
      inactiveColor: Colors.grey.shade200,
      label: status.round().toString(),
    );

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Column(
        children: [
          // Header
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.045,
            ),
            child: _header,
          ),
          // Title
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.05,
            ),
            child: Text(
              "Perspective Scale",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: size.height * 0.023,
              ),
            ),
          ),
          // Guiding text
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.05,
              bottom: size.height * 0.04,
            ),
            width: size.width * 0.8,
            child: Text(
              "Worried about something?\n\nTry using the slider to put your\ncurrent situation into perspective.\n\nHow would you rate it from 1 to 10?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Scale
          Container(
            margin: EdgeInsets.only(
              bottom: size.height * 0.03,
            ),
            child: _scale,
          ),
          // Scale Text
          Container(
            margin: EdgeInsets.only(
              bottom: size.height * 0.12,
            ),
            width: size.width * 0.85,
            height: size.height * 0.125,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.02,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade100,
            ),
            child: Text(
              BreathingText.scaleText[status.round() - 1],
              textAlign: TextAlign.center,
            ),
          ),
          // Done button
          Container(
            child: TextButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(
                  Colors.grey.shade100.withOpacity(0.7),
                ),
                elevation: MaterialStateProperty.all(3),
              ),
              child: Text("Done"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
