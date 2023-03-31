import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news/profile/addmedecine.dart';
import '../responsive.dart';
import 'dropdown.dart';
import 'global.dart';

import 'right_side.dart';
import 'left_side.dart';

class AddMed extends StatefulWidget {
   AddMed({superkey});

  @override
  State<AddMed> createState() => _AddMedState();
}

class _AddMedState extends State<AddMed> {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Responsive.isDesktop(context)?Row(
        children:  [
          LeftSide(),
          AddMedecine(),
        ],
      ): Stack(
  children: [
     Positioned(
      left: 0,
      top: 0,
      
      child: AddMedecine(),
    ),
    SidebarPage(),
  ],
)

    );
  }
}
