import 'dart:async';

import 'package:easify/screens/help_right_now/breathing_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './breathing_exercise_data.dart';

class BreathingExerciseScreen extends StatefulWidget {
  Color bubbleColor;
  String message = "";
  BreathingExerciseData breathingExerciseData;
  Duration duration;
  bool isAnimationDone = false;
  AnimationController animationController;
  Animation<double> growAnimation;
  BreathingExerciseScreen({
    @required this.duration,
    @required this.bubbleColor,
    @required this.breathingExerciseData,
  });
  @override
  _BreathingExerciseScreenState createState() =>
      _BreathingExerciseScreenState();
}

class _BreathingExerciseScreenState extends State<BreathingExerciseScreen>
    with TickerProviderStateMixin {
  double diameter = 0.3;
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
    Widget handleGoBackButton() {
      if (widget.isAnimationDone) {
        return ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Go back"),
        );
      } else {
        return SizedBox(
          width: 0,
          height: 0,
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Column(
        children: [
          Container(
            child: _header,
            margin: EdgeInsets.only(
              top: size.height * 0.03,
            ),
          ),
          Container(
            height: size.height * 0.45,
            width: size.width * 0.8,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: size.height * 0.1,
            ),
            child: Container(
              height: size.height * widget.growAnimation.value,
              width: size.height * widget.growAnimation.value,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(size.width * 0.8),
              ),
              child: BreathingBubble(
                color: widget.bubbleColor,
                message: widget.message,
              ),
            ),
          ),
          handleGoBackButton(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.isAnimationDone = false;
    widget.animationController = AnimationController(
      vsync: this,
      duration: widget.breathingExerciseData.inhale,
      reverseDuration: widget.breathingExerciseData.exhale,
    );
    widget.growAnimation = Tween<double>(begin: 0.25, end: 0.45).animate(
      new CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeIn,
      ),
    );
    Timer timer;
    const rebuildTime = Duration(
      milliseconds: 50,
    );
    int totalTimeInMilliSeconds = (widget.duration.inMilliseconds / 4).round();
    bool firstCycle = true;
    timer = Timer.periodic(
      rebuildTime,
      (timer) {
        if (totalTimeInMilliSeconds % 1000 == 0) print(totalTimeInMilliSeconds);
        if (totalTimeInMilliSeconds <= 0) {
          if (mounted) {
            setState(
              () {
                widget.animationController.reset();
                widget.message = "Done.";
                Timer(
                  Duration(
                    seconds: 1,
                  ),
                  () {
                    setState(() {
                      if (widget.message != "Done.") widget.message = "Done.";
                      widget.isAnimationDone = true;
                      timer.cancel();
                    });
                  },
                );
              },
            );
          }
        } else {
          if (mounted) {
            setState(
              () {
                totalTimeInMilliSeconds -= rebuildTime.inMilliseconds;
                if (widget.animationController.status ==
                    AnimationStatus.completed) {
                  widget.message = "Hold";
                  Timer(
                    widget.breathingExerciseData.holdAfterInhale,
                    () {
                      widget.animationController.reverse();
                      widget.message = "Exhale";
                    },
                  );
                } else if (widget.animationController.status ==
                    AnimationStatus.dismissed) {
                  widget.message = "Hold";
                  if (firstCycle) {
                    widget.animationController.forward();
                    widget.message = "Inhale";
                    firstCycle = false;
                  } else {
                    Timer(
                      widget.breathingExerciseData.holdAfterExhale,
                      () {
                        widget.animationController.forward();
                        widget.message = "Inhale";
                      },
                    );
                  }
                }
              },
            );
          }
        }
      },
    );
  }

  @override
  void dispose() {
    widget.animationController.dispose();
    super.dispose();
  }
}
