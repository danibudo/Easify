import 'package:flutter/material.dart';

class EmotionsButton extends StatelessWidget {
  String text = "";
  String imageAddress = "";
  double height = 0;
  double width = 0;
  Function nextStep;
  EmotionsButton({
    @required this.text,
    @required this.imageAddress,
    @required this.height,
    @required this.width,
    @required this.nextStep,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextStep,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              child: Image.asset(imageAddress),
              height: height,
              width: width,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
