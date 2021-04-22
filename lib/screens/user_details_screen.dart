import 'package:easify/screens/login_screen.dart';
import 'package:easify/Setup/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String emailText = 'Email: ' + user.email;
    // TODO: Add gradient to bgcolor
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.only(
            top: 3,
          ),
          child: Text(
            'Easify',
            style: TextStyle(
              fontFamily: 'Corbel',
              fontSize: size.height * 0.035,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.brown.shade200,
              ),
              margin: EdgeInsets.only(
                top: size.height * 0.07,
                left: size.width * 0.21,
                right: size.width * 0.2,
              ),
              padding: EdgeInsets.only(
                top: size.height * 0.02,
                left: size.width * 0.1,
                bottom: size.height * 0.03,
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(
                                'assets/images/GUI/circle_avatar.png'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            'User Details',
                            style: GoogleFonts.titilliumWeb(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: size.height * 0.022,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.02),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      emailText,
                      style: GoogleFonts.titilliumWeb(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: size.height * 0.022,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.02),
                    child: Row(
                      children: [
                        Text(
                          'Name: ',
                          style: GoogleFonts.titilliumWeb(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: size.height * 0.022,
                          ),
                        ),
                        Container(
                          child: StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('names')
                                .doc(user.uid)
                                .snapshots(),
                            builder: (builder, snapshot) {
                              return snapshot.hasData
                                  ? Text(
                                      '${snapshot.data.get('name')}',
                                      style: GoogleFonts.titilliumWeb(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: size.height * 0.022,
                                      ),
                                    )
                                  : Text(
                                      '${user.email.split('@')}',
                                      style: GoogleFonts.titilliumWeb(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: size.height * 0.022,
                                      ),
                                    );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.05),
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                  // Delete navigator history
                  while (Navigator.canPop(context)) Navigator.pop(context);
                },
                label: Text("Sign Out"),
                icon: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
