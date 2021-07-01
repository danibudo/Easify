import 'package:flutter/material.dart';

class GratitudeEntryCard extends StatelessWidget {
  GratitudeEntryCard({this.answer1, this.answer2, this.answer3});
  String answer1;
  String answer2;
  String answer3;
  TextStyle reasonStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  Color containerColor = Color(
    0xFFF59258,
  );
  Color textContainerColor = Color(
    0xFFFFCFB3,
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: 10,
      ),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.7,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                30,
              ),
              color: textContainerColor,
            ),
            child: Text(
              '1. ' + answer1,
              textAlign: TextAlign.left,
              style: reasonStyle,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            width: size.width * 0.7,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                40,
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
              color: textContainerColor,
            ),
            child: Text(
              '2. ' + answer2,
              textAlign: TextAlign.left,
              style: reasonStyle,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            width: size.width * 0.7,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                40,
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
              color: textContainerColor,
            ),
            child: Text(
              '3. ' + answer3,
              textAlign: TextAlign.left,
              style: reasonStyle,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(
          width: 1.5,
          color: Colors.white.withOpacity(
            0.7,
          ),
        ),
        borderRadius: BorderRadius.circular(45),
      ),
    );
  }
}
