import 'dart:ui';

import 'package:flutter/material.dart';
import '../responsive.dart';
import 'dropdown.dart';
import 'global.dart';

import 'right_side.dart';
import 'left_side.dart';

class Home extends StatefulWidget {
   Home({superkey});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Responsive.isDesktop(context)?Row(
        children: const [
          LeftSide(),
          RightSide(),
        ],
      ): Stack(
  children: [
    const Positioned(
      left: 0,
      top: 0,
      
      child: RightSide(),
    ),
    SidebarPage(),
  ],
)

    );
  }
}
