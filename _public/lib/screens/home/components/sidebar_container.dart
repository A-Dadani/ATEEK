import 'package:flutter/material.dart';

import '../../../constants.dart';

class SidebarContainer extends StatelessWidget {
  final RichText title;
  final Widget child;
  const SidebarContainer({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kDefaultPadding / 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          SizedBox(height: kDefaultPadding / 2), //10
          child,
          
        ],
      ),
    );
  }
}
