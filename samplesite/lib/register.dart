import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { Male, Female, Other }

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final courseName = <String>["Physics", "Maths", "Science", "Computer"];
  String? selectedvalue;
  final myContoller = TextEditingController();
  final passContoller = TextEditingController();
  GlobalKey<FormState> _regformkey = GlobalKey<FormState>();
  Gender? _gender;
  final storage = FirebaseStorage.instance;

  bool isVisible = false;
  void info() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void initState() {
    setState(() {
      _gender = Gender.Male;
    });
    super.initState();
  }

  void dispose() {
    myContoller.dispose();
    passContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //............Appbar
      appBar: AppBar(
        title: Text('User Profile'),
      ),

      //............Body of Website
      body: SingleChildScrollView(
        child: Form(
          key: _regformkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //.................Create Button
              Container(
                width: 150,
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    info();
                  },
                  child: Text("Create", style: TextStyle(fontSize: 20)),
                ),
              ),
              //.................Text
              Visibility(
                visible: !isVisible,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text("Click the above button to create your profile",
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Visibility(
                visible: isVisible,
                child:
                    //...............Name
                    Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your Email ID";
                      }
                    },
                    controller: myContoller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username ',
                        hintText: 'New Username'),
                  ),
                ),
              ),
              Visibility(
                visible: isVisible,
                child:
                    //...............Create Password
                    Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the new Password";
                      }
                    },
                    controller: passContoller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'New Password'),
                  ),
                ),
              ),
              Visibility(
                  visible: isVisible,
                  child: Text(
                    "Select your Gender",
                    style: TextStyle(fontSize: 20),
                  )),
              Visibility(
                visible: isVisible,
                child:
                    //.................Radio Button
                    RadioListTile<Gender>(
                        title: Text("Male"),
                        value: Gender.Male,
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        }),
              ),
              Visibility(
                visible: isVisible,
                child: RadioListTile<Gender>(
                    title: Text("Female"),
                    value: Gender.Female,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    }),
              ),
              Visibility(
                visible: isVisible,
                child: RadioListTile<Gender>(
                    title: Text("Other"),
                    value: Gender.Other,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    }),
              ),
              Visibility(
                visible: isVisible,
                child:
                    //..............Dropdown Button
                    Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      hint: Text("Choose your Subject"),
                      value: selectedvalue,
                      validator: (value) =>
                          value == null ? 'Field Required' : null,
                      items: courseName
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      icon: Icon(FontAwesomeIcons.book),
                      onChanged: (val) {
                        setState(() {
                          selectedvalue = val as String;
                        });
                      }),
                ),
              ),

              Visibility(
                visible: isVisible,
                child:
                    //..............Save Button
                    Container(
                  child: ElevatedButton(
                    onPressed: () {
                      var genderInString = describeEnum(_gender as Object);
                      if (_regformkey.currentState!.validate()) {
                        signUp();
                        final name = myContoller.text;
                        final pass = passContoller.text;
                        final gender = genderInString;
                        final subject = selectedvalue as String;
                        createUser(
                            name: name,
                            pass: pass,
                            gender: gender,
                            subject: subject);
                        //Popup Box
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  "Student Info \n\n Name : ${myContoller.text} \n Gender : $genderInString \n Subject : $selectedvalue"),
                            );
                          },
                        );
                      } else {
                        print("Registration Error");
                      }
                    },
                    child: Text("Save", style: TextStyle(fontSize: 19)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: myContoller.text.trim(), password: passContoller.text.trim());
  }

  Future createUser(
      {required String name,
      required String pass,
      required String gender,
      required String subject}) async {
    final docUser = FirebaseFirestore.instance.collection('Students').doc();
    final json = {
      'Name': name,
      'Password': pass,
      'Gender': gender,
      'Subject': subject,
    };
    await docUser.set(json);
  }
}
