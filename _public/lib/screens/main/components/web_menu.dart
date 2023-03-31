import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controllers/MenuController.dart';
import 'package:news/screens/main/main_screen.dart';
import 'package:news/screens/contactus/contact_us.dart';
import 'package:news/screens/mental_wellness/mental_wellness.dart';

import '../../../constants.dart';

class WebMenu extends StatelessWidget {
  final MenuControllerN _controller = Get.put(MenuControllerN());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: List.generate(
          _controller.menuItems.length,
          (index) => WebMenuItem(
            text: _controller.menuItems[index],
            isActive: index == _controller.selectedIndex,
            press: () {
              if (index == 0) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MainScreen()));
              }
              if (index == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MainScreenMw()));
              }
            },
          ),
        ),
      ),
    );
  }
}

class WebMenuItem extends StatefulWidget {
  const WebMenuItem({
    Key key,
    @required this.isActive,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final bool isActive;
  final String text;
  final VoidCallback press;

  @override
  _WebMenuItemState createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return kPrimaryColor;
    } else if (!widget.isActive & _isHover) {
      return kPrimaryColor.withOpacity(0.4);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: _borderColor(), width: 3),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
