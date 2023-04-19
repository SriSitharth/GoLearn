import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class aboutpage extends StatelessWidget {
  const aboutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_ikvz7qhc.json'),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Hello",
              style: TextStyle(fontSize: 35),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "             Go Learn is an education technology company that provides an online learning and teaching platform.",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "At Go learn, we’re all learners and instructors. We live out our values every day to create a culture that is diverse, inclusive, and committed to helping employees thrive.",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Our curated collection of business and technical courses help companies, governments, and nonprofits go further by placing learning at the center of their strategies.",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ]),
      ),
    );
  }
}
