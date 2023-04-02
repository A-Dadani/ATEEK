import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import '../../login_screen.dart';
import 'package:news/screens/singnup_screen.dart';

class Socal extends StatelessWidget {
  const Socal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          style: TextButton.styleFrom(
            backgroundColor: kDarkBlackColor,
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical:
                  kDefaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
            ),
          ),
          child: Text("Sign Up"),
          
        ),
        SizedBox(width: 5.0),
        
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical:
                  kDefaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
            ),
            
            
          ),
          child: Text("Login"),
        ),
      ],
    );
  }
}
