import 'package:easify/Setup/login_screen.dart';
import 'package:easify/Setup/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../home_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // TODO: Add more sophisticated validators
  bool _obscureText = false;

  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // User result = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // variable that holds the size of the entire screen
    // size is of class type Size
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
              ),
              validator: (username) {
                if (username.isEmpty) {
                  return "Please provide a name";
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
              validator: (email) {
                if (email.isEmpty) {
                  return "Please provide an email address";
                }
              },
            ),
            TextFormField(
              obscureText: _obscureText,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    toggle();
                  },
                ),
              ),
              validator: (password) {
                if (password.isEmpty) {
                  return "Please provide a password";
                } else if (password.length < 6) {
                  return "Password must be at least 6 characters";
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signUp(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                while (Navigator.canPop(context)) Navigator.pop(context);
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
