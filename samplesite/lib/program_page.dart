import 'package:flutter/material.dart';

class programpage extends StatefulWidget {
  const programpage({super.key});

  @override
  State<programpage> createState() => _programpageState();
}

class _programpageState extends State<programpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Programs")),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              color: Color.fromARGB(255, 123, 201, 123),
              child: Text("1"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              color: Color.fromARGB(255, 123, 201, 123),
              child: Text("2"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              color: Color.fromARGB(255, 123, 201, 123),
              child: Text("3"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              color: Color.fromARGB(255, 123, 201, 123),
              child: Text("4"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              color: Color.fromARGB(255, 123, 201, 123),
              child: Text("5"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              color: Color.fromARGB(255, 123, 201, 123),
              child: Text("6"),
            ),
          ),
        ],
      ),
    );
  }
}
