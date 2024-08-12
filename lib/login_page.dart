import 'dart:developer';

import 'package:danwis_firebase_auth/home_screen.dart';
import 'package:danwis_firebase_auth/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            enabled: true,
            labelText: 'Email',
            floatingLabelStyle: TextStyle(
              color: const Color.fromARGB(255, 226, 228, 230),
            ),
            labelStyle: TextStyle(
              color: const Color.fromARGB(255, 226, 228, 230),
            ),
            prefixIcon: const Icon(
              Icons.mail,
              color: Color.fromARGB(255, 226, 228, 230),
              size: 25,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            enabled: true,
            labelText: 'Password',
            floatingLabelStyle: TextStyle(
              color: const Color.fromARGB(255, 226, 228, 230),
            ),
            labelStyle: TextStyle(
              color: const Color.fromARGB(255, 226, 228, 230),
            ),
            prefixIcon: const Icon(
              Icons.lock_outline_rounded,
              color: Color.fromARGB(255, 226, 228, 230),
              size: 25,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 75, 77, 105),
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                fixedSize: const Size(double.infinity, 50)),
            child: Text("login")),
        SizedBox(height: size.height * 0.02),
        RichText(
            text: TextSpan(
                style: TextStyle(
                    color: const Color.fromARGB(255, 163, 163, 163),
                    fontSize: 14),
                children: [
              const TextSpan(text: 'Already have an account ?'),
              TextSpan(
                  text: ' Login ',
                  style: TextStyle(color: Colors.blue[700], fontSize: 15),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      const CircularProgressIndicator();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ));
                      log('login', name: 'login');
                    }),
            ]))
      ]),
    ));
  }
}
