import 'package:easify/screens/login_screen.dart';
import 'package:easify/Setup/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // TODO: Add more sophisticated validators
  bool _obscureText = true;

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
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade200,
        title: Text("Create an account"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1, vertical: size.height * 0.025),
        children: <Widget>[
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
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
                      icon: Icon(Icons.email_rounded),
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
                      icon: Icon(Icons.lock_outline),
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.height * 0.15,
                      vertical: size.height * 0.05,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          AuthenticationService(firebaseAuth).signUp(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            name: nameController.text.trim(),
                          );
                          while (Navigator.canPop(context))
                            Navigator.pop(context);
                        }
                      },
                      child: Text("Sign Up"),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
