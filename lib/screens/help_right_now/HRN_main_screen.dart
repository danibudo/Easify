import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HRNMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var _header = Row(
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
    return Scaffold(
      backgroundColor: Color(0xFF36B5FF),
      body: Container(
        child: Column(
          children: [
            // Header
            Container(
              child: _header,
              margin: EdgeInsets.only(
                top: size.height * 0.035,
              ),
            ),
            // HRN text
            Container(
              margin: EdgeInsets.only(
                top: size.height * 0.02,
                bottom: size.height * 0.025,
              ),
              child: Text(
                "Help right now",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: size.height * 0.025,
                ),
              ),
            ),
            // Breathe button
            Container(
              height: size.height * 0.4,
              child: GestureDetector(
                onTap: () {
                  print("Breathing");
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/GUI/Black_to_transparent_gradient_1.png',
                      fit: BoxFit.fill,
                      width: size.width,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          // Image
                          Container(
                            width: size.width * 0.35,
                            child: Image.asset(
                                "assets/images/GUI/airflow_clear_blue.png"),
                            margin: EdgeInsets.only(
                              left: size.width * 0.123,
                            ),
                          ),
                          // Text
                          Container(
                            margin: EdgeInsets.only(
                              left: size.width * 0.05,
                            ),
                            child: Text(
                              "Breathe",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: size.height * 0.023,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: size.height * 0.004,
              height: 0,
            ),
            // Perspective Scale button
            Container(
              height: size.height * 0.4,
              child: GestureDetector(
                onTap: () {
                  print("Perspective Scale");
                },
                child: Stack(
                  children: [
                    RotatedBox(
                      quarterTurns: 2,
                      child: Image.asset(
                        'assets/images/GUI/Black_to_transparent_gradient_1.png',
                        fit: BoxFit.fill,
                        width: size.width,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          // Image
                          Container(
                            margin: EdgeInsets.only(
                              left: size.width * 0.123,
                            ),
                            child: Image.asset(
                              "assets/images/GUI/white_blue_scale.png",
                            ),
                            width: size.width * 0.35,
                          ),
                          // Text
                          Container(
                            margin: EdgeInsets.only(
                              left: size.width * 0.025,
                              right: size.width * 0.125,
                            ),
                            child: Text(
                              "Perspective Scale",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: size.height * 0.023,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
