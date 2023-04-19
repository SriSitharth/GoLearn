import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Userpage extends StatelessWidget {
  const Userpage({super.key});
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(image: AssetImage('assets/images/logo.png')),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: Text("Logout", style: TextStyle(fontSize: 20)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                "Your Email Id : " + user.email!,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
