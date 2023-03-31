import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news/profile/addmedecine.dart';
import 'package:news/profile/settings.dart';
import '../responsive.dart';
import 'dropdown.dart';
import 'global.dart';

import 'right_side.dart';
import 'left_side.dart';

class Sett extends StatefulWidget {
   Sett({superkey});

  @override
  State<Sett> createState() => _SettState();
}

class _SettState extends State<Sett> {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Responsive.isDesktop(context)?Row(
        children:  [
          LeftSide(),
          Profile(),
        ],
      ): Stack(
  children: [
     Positioned(
      left: 0,
      top: 0,
      
      child: Profile(),
    ),
    SidebarPage(),
  ],
)

    );
  }
}
