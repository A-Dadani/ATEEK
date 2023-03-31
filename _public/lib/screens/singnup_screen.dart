import 'package:flutter/material.dart';

import '../controllers/CarouselController.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Container(
          decoration: BoxDecoration(
             image: DecorationImage(
              image: AssetImage("assets/images/background11.jpg"),
              fit: BoxFit.fill,
          )),
          child: CarouselDemo()
      
        ),
      ));
       
   
  }
}