import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/screens/main/components/header.dart';
import 'package:news/screens/main/components/side_menu.dart';

import '../../controllers/MenuController.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key key}) : super(key: key);
  final MenuControllerN _controller = Get.put(MenuControllerN());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: SideMenu(),
      body: Column(
        children: [
          Header(),
        ],
      ),
    );
  }
}
