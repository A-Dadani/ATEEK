import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/screens/main/main_screen.dart';
import 'package:news/screens/contactus/contact_us.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: kBodyTextColor),
          bodyMedium: TextStyle(color: kBodyTextColor),
          headlineSmall: TextStyle(color: kDarkBlackColor),
        ),
      ),
      home: MainScreen(),
      routes: {
        '/home': (context) => MainScreen(),
        '/contact': (context) => ContactUs(),
      },
    );
  }
}
