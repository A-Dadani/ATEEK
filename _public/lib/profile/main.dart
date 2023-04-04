import 'package:flutter/material.dart';

import 'home.dart';

import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

/*
CODE BY Hmida71 Github
Site Web https://hmida71.netlify.app
For any service text me on instagram : hmida_._071 -- https://www.instagram.com/hmida_._071
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({superkey});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    /* double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width; */
    return MaterialApp(
      title: 'Profile - Ateek',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFF01110A),
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            body: Home(),
          );
        },
      ),
    );
  }
}
