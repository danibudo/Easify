import 'package:flutter/material.dart';
import 'texts.dart';

class ThinkingPatternButton extends StatelessWidget {
  Function onPressed;
  int id;
  ThinkingPatternButton({@required this.onPressed, @required this.id});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextButton(
      child: Text(
        Texts.patternsName[id],
        style: TextStyle(
          fontSize: size.height * 0.0217,
          fontWeight: FontWeight.w700,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
