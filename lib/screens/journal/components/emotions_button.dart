import 'package:flutter/material.dart';

class EmotionsButton extends StatelessWidget {
  int id;
  String text = "";
  String imageAddress = "";
  double height = 0;
  double width = 0;
  Function nextStep;
  EmotionsButton({
    @required this.id,
    @required this.text,
    @required this.imageAddress,
    @required this.height,
    @required this.width,
    @required this.nextStep,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: nextStep,
      child: Container(
        width: size.width * 0.21,
        height: size.height * 0.14,
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              child: Image.asset(imageAddress, fit: BoxFit.contain),
              width: size.width * 0.125,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(text),
            SizedBox(
              height: size.height * 0.01,
            )
          ],
        ),
      ),
    );
  }
}
