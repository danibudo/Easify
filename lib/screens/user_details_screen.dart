import 'package:easify/screens/login_screen.dart';
import 'package:easify/Setup/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    String emailText = 'Email: ' + user.email;
    // TODO: Add gradient to bgcolor
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Easify',
          style: TextStyle(
            fontFamily: 'Corbel',
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 5,
                  ),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        AssetImage('assets/images/GUI/circle_avatar.png'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(
                    'User Details',
                  ),
                ),
              ],
            ),
          ),
          Text(emailText),
          Container(
            child: ElevatedButton.icon(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
                // Delete navigator history
                while (Navigator.canPop(context)) Navigator.pop(context);
              },
              label: Text("Sign Out"),
              icon: Icon(Icons.logout),
            ),
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(
              top: 5,
            ),
          ),
        ],
      ),
    );
  }
}
