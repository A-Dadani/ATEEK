import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:news/profile/addmed.dart';
import 'package:news/profile/set.dart';
import 'dart:math' as math show pi;

import 'package:news/profile/settings.dart';

import '../constants.dart';
import 'addmedecine.dart';
import 'home.dart';

class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  List<CollapsibleItem> _items = [];
  String _headline = " ";
  AssetImage _avatarImg = AssetImage('assets/man.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Your Medecine List',
        icon: Icons.home,
       onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()));
            // Navigate to Feed page
          },
        isSelected: true,
      ),
      
      
      CollapsibleItem(
        text: 'Add Medicine',
        icon: Icons.add,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AddMed()));
                                      
            },
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
         onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sett()));
                            // Navigate to Feed page
                          },
      ),
      
      
      CollapsibleItem(
        text: 'Logout',
        icon: Icons.logout,
        onPressed: () => setState(() => _headline = 'Logout'),
      ),
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: false,
        items: _items,
        collapseOnBodyTap: true,
        avatarImg: _avatarImg,
        title: 'John Smith',
       
        body: _body(size, context),
        backgroundColor: Colors.black,
        selectedTextColor: Colors.white,
        textStyle: const TextStyle(fontSize: 15,),
        titleStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: const[
          BoxShadow(
            color: kDarkBlackColor,
            blurRadius: 20,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
          BoxShadow(
            color: kDarkBlackColor,
            blurRadius: 50,
            spreadRadius:0,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      /* color: Colors.blueGrey[50],
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.23),
            child: Text(
              _headline,
              style: Theme.of(context).textTheme.headline1,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
      ), */
    );
  }
}