import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        body: ListView(children: [
      TextField(
        controller: emailController,
        decoration: InputDecoration(
          enabled: true,
          labelText: 'email',
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
            Icons.mail,
            color: Color.fromARGB(255, 226, 228, 230),
            size: 25,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      TextField(
        controller: passwordController,
        decoration: InputDecoration(
          enabled: false,
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
      ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 75, 77, 105),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              fixedSize: const Size(double.infinity, 50)),
          child: Text("login"))
    ]));
  }
}
