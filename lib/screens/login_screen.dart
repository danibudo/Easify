import 'package:easify/models/theuser.dart';
import 'package:easify/screens/signup_screen.dart';
import 'package:easify/Setup/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // variable that holds the size of the entire screen
    // size is of class type Size
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.teal.shade100,
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.12, bottom: size.height * 0.06),
              child: Center(
                child: Text(
                  'Easify',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey.shade600,
                    fontFamily: 'Corbel',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
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
                      icon: Icon(Icons.email_outlined),
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
                      icon: Icon(Icons.lock_outline),
                    ),
                    obscureText: true,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.height * 0.15,
                      vertical: size.height * 0.05,
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          context.read<AuthenticationService>().signIn(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                        }
                      },
                      child: Text("Sign in"),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                child: Text("Don't have an account yet?"),
                margin: EdgeInsets.only(top: size.height * 0.05),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupScreen()));
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
