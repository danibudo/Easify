import 'package:easify/Setup/authentication_service.dart';
import 'package:easify/Setup/database.dart';
import 'package:easify/models/theuser.dart';
import 'package:easify/screens/gratitude/gratitude_main.dart';
import 'package:easify/screens/login_screen.dart';
import 'package:easify/screens/resources_coping/resources_topics_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_details_screen.dart';
import './journal/emotions_screen.dart';

class HomeScreen extends StatefulWidget {
  final TheUser user;
  HomeScreen({@required this.user});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // variable that holds the size of the entire screen
    // size is of class type Size
    var size = MediaQuery.of(context).size;
    var name = widget.user.name;
    return Scaffold(
        backgroundColor: Colors.greenAccent.shade100,
        body: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/GUI/mainscreen_gradient.png'),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                top: size.height * 0.05,
                left: size.width * 0.06,
                right: size.width * 0.06,
              ),
              child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: size.height * 0.02),
                  child: Row(
                    // Set spacing between row items
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: size.width * 0.035),
                        child: Text(
                          'Easify',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Corbel',
                            fontSize: size.height * 0.043,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: size.width * 0.025),
                        child: Row(
                          children: [
                            Container(
                              child: StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('names')
                                    .doc(widget.user.uid)
                                    .snapshots(),
                                builder: (builder, snapshot) {
                                  return snapshot.hasData
                                      ? Text(
                                          'Hi, ${snapshot.data.get('name')}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          'Welcome',
                                        );
                                },
                              ),
                              margin: EdgeInsets.only(right: size.width * 0.02),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.01),
                              child: IconButton(
                                icon: Icon(
                                  CupertinoIcons.person_crop_circle_fill,
                                  size: size.height * 0.06,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (
                                        context,
                                      ) =>
                                          UserDetailsScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: size.width * 0.02,
                    right: size.width * 0.02,
                  ),
                  width: size.width,
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        height: size.height * 0.8,
                        child: Column(
                          children: [
                            // Gratitude button
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topLeft,
                                  image: AssetImage(
                                      'assets/images/GUI/SelfGrowth_MainMenuItem.png'),
                                ),
                              ),
                              height: size.height * 0.185,
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.02),
                              child: OutlinedButton(
                                onPressed: () {
                                  print('Going to gratitude');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GratitudeMainScreen()));
                                },
                                child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Opacity(
                                        opacity: 0.5,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: size.height * 0.128,
                                            bottom: size.height * 0.002,
                                            right: size.width * 0.5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade800,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          bottom: size.height * 0.015,
                                          left: size.width * 0.04,
                                        ),
                                        child: Text(
                                          'Gratitude',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: size.height * 0.025,
                                          ),
                                        ),
                                      ),
                                    ]),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Journal button
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topLeft,
                                  image: AssetImage(
                                      'assets/images/GUI/Journaling_Item.png'),
                                ),
                              ),
                              height: size.height * 0.185,
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.02),
                              child: OutlinedButton(
                                onPressed: () {
                                  print('Journal');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EmotionsScreen()));
                                },
                                child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Opacity(
                                        opacity: 0.5,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: size.height * 0.128,
                                            bottom: size.height * 0.002,
                                            right: size.width * 0.53,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade800,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          bottom: size.height * 0.015,
                                          left: size.width * 0.04,
                                        ),
                                        child: Text(
                                          'Journal',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: size.height * 0.025,
                                          ),
                                        ),
                                      ),
                                    ]),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Explanations and Coping button
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topLeft,
                                  image: AssetImage(
                                      'assets/images/GUI/Information_MainMenuItem.png'),
                                ),
                              ),
                              height: size.height * 0.185,
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.02),
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ResourcesTopicsScreen()),
                                  );
                                },
                                child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Opacity(
                                        opacity: 0.5,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: size.height * 0.128,
                                            bottom: size.height * 0.002,
                                            right: size.width * 0.315,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade800,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          bottom: size.height * 0.015,
                                          left: size.width * 0.04,
                                        ),
                                        child: Text(
                                          'Resources & Coping',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: size.height * 0.025,
                                          ),
                                        ),
                                      ),
                                    ]),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Help Right Now button
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topLeft,
                                  image: AssetImage(
                                      'assets/images/GUI/helping-hand-blue.png'),
                                ),
                              ),
                              height: size.height * 0.185,
                              child: OutlinedButton(
                                onPressed: () {
                                  print('Help');
                                },
                                child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Opacity(
                                        opacity: 0.5,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: size.height * 0.128,
                                            bottom: size.height * 0.002,
                                            right: size.width * 0.41,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade800,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          bottom: size.height * 0.015,
                                          left: size.width * 0.04,
                                        ),
                                        child: Text(
                                          'Help right now',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: size.height * 0.025,
                                          ),
                                        ),
                                      ),
                                    ]),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]))
        ]));
  }
}
