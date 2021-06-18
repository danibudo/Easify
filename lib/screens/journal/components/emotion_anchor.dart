import 'package:easify/screens/journal/journaling_screen.dart';
import 'package:flutter/material.dart';

class EmotionAnchor extends StatefulWidget {
  String anchorText;
  bool active = false;

  EmotionAnchor({@required this.anchorText});

  @override
  _EmotionAnchorState createState() => _EmotionAnchorState();
}

class _EmotionAnchorState extends State<EmotionAnchor> {
  Color getBgColor() {
    if (widget.active) {
      return Colors.white;
    } else {
      return Colors.transparent;
    }
  }

  Color getTextColor() {
    if (widget.active) {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild " + widget.anchorText);
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.active = !widget.active;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.035,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: getBgColor(),
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.anchorText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: getTextColor(),
          ),
        ),
      ),
    );
  }
}
