import 'package:Opchoo/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  bool signUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: TextField(
                controller: loginEmail,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: TextField(
                controller: loginPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            onPressed: () {
              if (signUp) {
                context.read<AuthenticateProvider>().signUp(
                      email: loginEmail.text.trim(),
                      password: loginPassword.text.trim(),
                    );
              } else {
                context.read<AuthenticateProvider>().signIn();
              }
            },
            child: signUp ? Text("Sign Up") : Text("SignIn"),
          ),
          SizedBox(height: 10.0),
          OutlineButton(
            onPressed: () {
              setState(() {
                signUp = !signUp;
              });
            },
            child: signUp
                ? Text(
                    "Have an account? Sign In",
                  )
                : Text(
                    "Create an account",
                  ),
          ),
        ],
      ),
    );
  }
}
