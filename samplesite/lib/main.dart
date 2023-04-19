import 'package:flutter/material.dart';
import 'package:samplesite/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

//StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        cardColor: Colors.lightGreen,
        primarySwatch: Colors.green,
      ),
      home: userLogin(),
      //To remove the debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}
