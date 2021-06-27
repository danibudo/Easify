import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'draw_circle.dart';
import './breathing_text.dart';

class ChooseBreathingScreen extends StatefulWidget {
  int duration;
  int exerciseId = 0;
  List<Color> colors = [
    Color(0xFF00F4AB),
    Color(0xFF3874FF),
    Color(0xFFFF3874),
    Color(0xFFFFC338)
  ];
  @override
  _ChooseBreathingScreenState createState() => _ChooseBreathingScreenState();
}

class _ChooseBreathingScreenState extends State<ChooseBreathingScreen> {
  @override
  void initState() {
    widget.duration = 1;
    widget.exerciseId = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _header = Row(
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
        Container(
          margin: EdgeInsets.only(
            left: size.width * 0.31,
          ),
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
    void handleOnPressedLeftButton() {
      if (widget.exerciseId > 0)
        setState(() {
          widget.exerciseId--;
        });
      print("Left - index: " + widget.exerciseId.toString());
    }

    void handleOnPressedRightButton() {
      if (widget.exerciseId < 3)
        setState(() {
          widget.exerciseId++;
        });
      print("Right - index: " + widget.exerciseId.toString());
    }

    Color handleLeftButtonColor() {
      if (widget.exerciseId == 0) {
        return Colors.grey;
      } else
        return Colors.black;
    }

    Color handleRightButtonColor() {
      if (widget.exerciseId == 3) {
        return Colors.grey;
      } else
        return Colors.black;
    }

    return Scaffold(
      backgroundColor: Color(0xFF36B5FF),
      body: Column(
        children: [
          // Header
          Container(
            child: _header,
            margin: EdgeInsets.only(
              top: size.height * 0.035,
            ),
          ),
          // "Breathing Technique"
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.02,
            ),
            child: Text(
              "Breathing Technique",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: size.height * 0.025,
              ),
            ),
          ),
          // Circle
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: size.height * 0.3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  color: handleLeftButtonColor(),
                  icon: Icon(Icons.arrow_left_rounded),
                  iconSize: size.width * 0.1,
                  onPressed: handleOnPressedLeftButton,
                ),
                Stack(
                  children: [
                    Container(
                      child: CustomPaint(
                        painter: DrawCircle(
                          size: size.width * 0.25,
                          center:
                              Offset(size.width * 0.165, size.height * 0.01),
                          color: widget.colors[widget.exerciseId],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.35,
                      alignment: Alignment.center,
                      child: Text(
                        BreathingText.techniqueNames[widget.exerciseId],
                        style: TextStyle(
                          color: Colors.grey.shade100,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  color: handleRightButtonColor(),
                  icon: Icon(Icons.arrow_right_rounded),
                  iconSize: size.width * 0.1,
                  onPressed: handleOnPressedRightButton,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
