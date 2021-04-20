import 'dart:io';

import 'package:easify/Setup/authentication_service.dart';
import 'package:easify/Setup/database.dart';
import 'package:easify/models/theuser.dart';
import 'package:easify/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_details_screen.dart';

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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/GUI/mainscreen_gradient.png'),
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 64,
                  child: Row(
                    // Set elements at each end of the row
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Easify",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Corbel',
                            fontSize: 25,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: size.width * 0.08,
                          top: size.height * 0.05,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('names')
                                  .doc(widget.user.uid)
                                  .snapshots(),
                              builder: (builder, snapshot) {
                                return snapshot.hasData
                                    ? Text(snapshot.data.get('name'))
                                    : Text("Welcome");
                              },
                            ),
                            margin: EdgeInsets.only(top: size.height * 0.06),
                          ),
                          GestureDetector(
                            child: Container(
                              child: CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage(
                                    'assets/images/GUI/circle_avatar.png'),
                              ),
                              margin: EdgeInsets.only(
                                right: size.width * 0.02,
                                top: size.height * 0.025,
                              ),
                              padding: EdgeInsets.only(
                                right: size.width * 0.02,
                                top: size.height * 0.025,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (
                                      context,
                                    ) =>
                                        UserDetailsScreen(),
                                  ));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // TODO: Style button, add text, then add the other buttons
                Container(
                  width: size.width * 0.8,
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        height: size.height * 0.8,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('hi');
                              },
                              child: Image.asset(
                                  'assets/images/GUI/helping-hand-blue.png',
                                  fit: BoxFit.fill),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
