import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/profile/main.dart';
import 'package:news/profile/addmed.dart';
import 'package:news/profile/set.dart';
import 'dart:math' as math show pi;

import 'package:news/profile/settings.dart';

import '../constants.dart';
import '../screens/login_screen.dart';
import 'addmedecine.dart';
import 'home.dart';

Future<void> logout(BuildContext context) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.remove('user_token');
  try {
    Response response;
    Dio dio = Dio();
    final URL = "http://localhost:5000";
    response = await dio.post("$URL/api/v0/auth/signout");
    print("User signed out");
  } catch (err) {
    print("Runtime error while trying to logout: $err");
  }
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginScreen()),
  );
}

class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  List<CollapsibleItem> _items = [];
  String _headline = " ";
  AssetImage _avatarImg = AssetImage('images/profile.jpg');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = " ";
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Your Medecine List',
        icon: Icons.home,
        onPressed: () {
          _headline = 'Your Medicine List';
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));

          // Navigate to Feed page
        },
        // isSelected: true,
      ),
      CollapsibleItem(
        text: 'Add Medicine',
        icon: Icons.add,
        onPressed: () {
          _headline = 'Add Medicine';

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddMed()));
        },
        // isSelected: true,
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () {
          _headline = 'Settings';

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Sett()));
          // Navigate to Feed page
        },
        //  isSelected: true,
      ),
      CollapsibleItem(
          text: 'Logout', icon: Icons.logout, onPressed: () => logout(context)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _items,
        collapseOnBodyTap: false,
        avatarImg: _avatarImg,
        title: 'Lorem IPSUM',
        onTitleTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        },
        //     selectedIconBox: Color(0xff2F4047),
        // selectedIconColor: Color(0xff4AC6EA),
        // unselectedIconColor: Color(0xff6A7886),

        body: _body(size, context),
        backgroundColor: Colors.black,
        selectedTextColor: kLabelColor,
        selectedIconBox: Colors.black,
        selectedIconColor: kLabelColor,
        unselectedIconColor: Color(0xff6A7886),
        textStyle: const TextStyle(
          fontSize: 15,
        ),
        titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        toggleTitleStyle:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: const [
          BoxShadow(
            color: kDarkBlackColor,
            blurRadius: 20,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
          BoxShadow(
            color: kDarkBlackColor,
            blurRadius: 50,
            spreadRadius: 0,
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
