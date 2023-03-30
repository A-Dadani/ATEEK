import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controllers/MenuController.dart';
import 'package:news/screens/main/components/header.dart';
import 'package:news/screens/main/components/side_menu.dart';
import 'package:news/screens/mental_wellness/home_m_w.dart';
import '../../constants.dart';

class MainScreenMw extends StatelessWidget {
  final MenuControllerN _controller = Get.put(MenuControllerN());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              child: SafeArea(child: HomeScreenMw()),
            ),
          ],
        ),
      ),
    );
  }
}
