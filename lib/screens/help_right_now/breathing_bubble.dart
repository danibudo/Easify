import "package:flutter/material.dart";

class BreathingBubble extends StatefulWidget {
  Color color;
  String message;
  BreathingBubble({@required this.message, @required this.color});
  @override
  _BreathingBubbleState createState() => _BreathingBubbleState();
}

class _BreathingBubbleState extends State<BreathingBubble>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(widget.message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          )),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadiusDirectional.circular(
          MediaQuery.of(context).size.width * 0.6,
        ),
      ),
    );
  }
}
