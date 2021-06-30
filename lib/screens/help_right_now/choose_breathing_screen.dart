import 'package:easify/screens/help_right_now/breathing_exercise_screen.dart';
import 'package:easify/screens/resources_coping/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'draw_circle.dart';
import './breathing_text.dart';
import './breathing_exercise_data.dart';

class ChooseBreathingScreen extends StatefulWidget {
  int duration = 1;
  int exerciseId = 0;
  List<Color> colors = [
    Color(0xFF00E39F),
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

    BreathingExerciseData getBreathingExerciseData() {
      switch (widget.exerciseId) {
        case 0:
          return extendedExhale;
        case 1:
          return relaxingBreath;
        case 2:
          return bellyBreathing;
        default:
          return boxBreathing;
      }
    }

    Color handleLeftButtonColor() {
      if (widget.exerciseId == 0) {
        return Colors.transparent;
      } else
        return Colors.black;
    }

    Color handleRightButtonColor() {
      if (widget.exerciseId == 3) {
        return Colors.transparent;
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
          // Circle + IconButtons
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: size.height * 0.175,
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
          // Informative Text
          Container(
            alignment: Alignment.center,
            width: size.width * 0.6,
            height: size.height * 0.025 * 2,
            margin: EdgeInsets.only(
              top: size.height * 0.175,
            ),
            child: Text(
              BreathingText.techniqueInfo[widget.exerciseId],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.height * 0.021,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.05,
            ),
            child: Text(
              "Duration",
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Duration realated widgets
          Container(
            width: size.width * 0.5,
            margin: EdgeInsets.only(
              top: size.height * 0.015,
              left: size.width * 0.25,
              right: size.width * 0.25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_circle_down),
                  iconSize: size.height * 0.05,
                  onPressed: () {
                    setState(() {
                      if (widget.duration > 1) widget.duration--;
                    });
                  },
                  tooltip: "Decrease exercise duration.",
                ),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.15,
                  alignment: Alignment.center,
                  child: Text(
                    widget.duration.toString(),
                    style: TextStyle(
                      fontSize: size.height * 0.027,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade800.withOpacity(0.5),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_circle_up),
                  color: Colors.white,
                  iconSize: size.height * 0.05,
                  onPressed: () {
                    setState(() {
                      if (widget.duration < 99) widget.duration++;
                    });
                  },
                  tooltip: "Increase exercise duration.",
                ),
              ],
            ),
          ),
          // Start button
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.035,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BreathingExerciseScreen(
                      breathingExerciseData: getBreathingExerciseData(),
                      bubbleColor: widget.colors[widget.exerciseId],
                      duration: Duration(
                        minutes: widget.duration,
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                "Choose Exercise",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(widget.colors[widget.exerciseId]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
