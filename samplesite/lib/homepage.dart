import 'package:flutter/material.dart';
import 'package:samplesite/about_page.dart';
import 'package:samplesite/courses_page.dart';
import 'package:samplesite/payment_page.dart';
import 'package:samplesite/program_page.dart';
import 'package:samplesite/register.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  final storage = FirebaseStorage.instance;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();
  @override
  void dispose() {
    usercontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usercontroller.text.trim(),
        password: passcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      //Used for AppBar
      appBar: AppBar(
          title: Text("Go Learn"),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(FontAwesomeIcons.bars),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          )),

      //Used for Drawer
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 123, 201, 123),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("Profile"),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(FontAwesomeIcons.houseUser),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 0.3,
            ),
            ListTile(
              title: Text('Program'),
              leading: Icon(FontAwesomeIcons.handshakeSimple),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => programpage()));
              },
            ),
            Divider(
              height: 0.3,
            ),
            ListTile(
              title: Text('Courses'),
              leading: Icon(FontAwesomeIcons.book),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => coursespage()));
              },
            ),
            Divider(
              height: 0.3,
            ),
            ListTile(
              title: Text('Payment'),
              leading: Icon(FontAwesomeIcons.cartShopping),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => paymentpage()));
              },
            ),
            Divider(
              height: 0.3,
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(FontAwesomeIcons.userGroup),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => aboutpage()));
              },
            ),
            Divider(
              height: 0.3,
            ),
          ],
        ),
      ),
      body: Container(
        //Used for Linear Gradient
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 101, 224, 101),
          Color.fromARGB(255, 163, 221, 176),
        ], begin: Alignment.topCenter)),

        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.all(1),
                    child: Lottie.network(
                        'https://assets7.lottiefiles.com/packages/lf20_ad3uxjiv.json'),
                  ),

                  //Username
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter valid Email";
                        }
                      },
                      controller: usercontroller,
                      decoration: InputDecoration(
                          prefixIcon: Icon(FontAwesomeIcons.userGraduate),
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                          hintText: 'Enter your Mail Id'),
                    ),
                  ),
                  //Password
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter valid Password";
                        }
                      },
                      controller: passcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            FontAwesomeIcons.lock,
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Your Password'),
                    ),
                  ),

                  //Login Button
                  Container(
                    height: 55,
                    width: 230,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          signIn();
                        } else {
                          print("Login Error");
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),

                  //Register Button
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserRegister()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
