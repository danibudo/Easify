import 'package:flutter/material.dart';

class ThinkingPatternButton extends StatelessWidget {
  Function onPressed;
  int id;
  ThinkingPatternButton({@required this.onPressed, @required this.id});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("Pattern " + this.id.toString()),
      onPressed: onPressed,
    );
  }
}
