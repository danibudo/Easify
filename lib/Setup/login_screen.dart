import 'package:easify/Setup/signup_screen.dart';
import 'package:easify/Setup/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // variable that holds the size of the entire screen
    // size is of class type Size
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Column(
        children: [
          TextFormField(
            validator: (input) {
              if (input.isEmpty) {
                return 'Please type your email';
              }
            },
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextFormField(
            validator: (input) {
              if (input.isEmpty) {
                return 'Please provide a password';
              } else if (input.length < 6) {
                return 'Your password must be at least 6 characters long';
              }
            },
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.03),
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
              },
              child: Text("Sign in"),
            ),
          ),
          Padding(
            child: Text("Don't have an account yet?"),
            padding: EdgeInsets.only(
              top: size.height * 0.03,
              bottom: size.height * 0.01,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupScreen()));
            },
            child: Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
