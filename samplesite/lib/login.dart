import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samplesite/homepage.dart';
import 'package:samplesite/user.dart';

class userLogin extends StatelessWidget {
  const userLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Userpage();
            } else {
              return Homepage();
            }
          }),
    );
  }
}
