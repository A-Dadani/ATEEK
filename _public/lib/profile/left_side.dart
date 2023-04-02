import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news/profile/addmed.dart';
import 'package:news/profile/set.dart';
import 'package:news/profile/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../screens/login_screen.dart';
import 'addmedecine.dart';
import 'home.dart';
import 'package:dio/dio.dart';
//import '../global.dart';


 Future<void> logout(BuildContext context) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('user_token');
    try {
      Response response;
      Dio dio = Dio();
      final URL = "localhost:5000";
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

Future<String> GetName()async{
  Response response;
  Dio dio = Dio();
  var URL ="localhost:5000";
  response = await dio.get("$URL/api/v0/auth/authStatus");
  print("username is: $response");
  return response.data['displayName'].toString();
}



 
 
class LeftSide extends StatefulWidget {
  const LeftSide({superkey});

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
   
  
  
  @override
  Widget build(BuildContext context){
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    // String name = await GetName();
    return 
    Expanded(
      flex: 2,
      child: Container(
        color: Color(0xFF01110A),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          }, scrollbars: false),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Image.asset('images/favicon.png', height: height*0.1, width: width*0.1, 
                        ),
                ),
                       SizedBox(height: height*0.08),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                const SizedBox(height: 10),

                 FutureBuilder<String>(
                future: GetName(), // The future function to retrieve the name
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.red[800],
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                },
              ),
                // const Text(
                //   "Abhivan Khare",
                //   style: TextStyle(
                //     fontSize: 17,
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                const SizedBox(height: 5),

                SizedBox(height: height*0.1),
                
                Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
  
    overlayColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered))
          return kBgColor.withOpacity(0.4);
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed))
          return kBgColor.withOpacity(0.8);
        return null; // Defer to the widget's default.
      },
    ),
  ),
                          onPressed: () {
                            Navigator.push(
                                        context,
                                         MaterialPageRoute(builder: (context) =>  Home()));
                            // Navigate to Feed page
                          },
                          child: Text(
                            "Your Medicine List",
                            style: TextStyle(

                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                 Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextButton(
                           style: ButtonStyle(
  
    overlayColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered))
          return kBgColor.withOpacity(0.4);
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed))
          return kBgColor.withOpacity(0.8);
        return null; // Defer to the widget's default.
      },
    ),
  ),
                          onPressed: () {
                             Navigator.push(
                                        context,
                                         MaterialPageRoute(builder: (context) => AddMed()));
                                         
                            // Navigate to Feed page
                          },
                          child: Text(
                            "Add Medecines",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  height: 30,
                  // color: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextButton(
                           style: ButtonStyle(
  
    overlayColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered))
          return kBgColor.withOpacity(0.4);
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed))
          return kBgColor.withOpacity(0.8);
        return null; // Defer to the widget's default.
      },
    ),
  ),
                          onPressed: () {
                             Navigator.push(
                                        context,
                                         MaterialPageRoute(builder: (context) => Sett()));
                            // Navigate to Feed page
                          },
                          child: Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 30,
                  // color: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextButton(
                           style: ButtonStyle(
  
    overlayColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered))
          return kBgColor.withOpacity(0.4);
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed))
          return kBgColor.withOpacity(0.8);
        return null; // Defer to the widget's default.
      },
    ),
  ),
                          onPressed: () {
                            logout(context);
                            // Navigate to Feed page
                          },
                          child: Text(
                            "Logout",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );

   
  }
}
