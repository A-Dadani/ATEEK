import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';
import 'constants.dart';
import 'left_side.dart';

Future<void> createAlbum(
    String newFirstName, String newLastName, String newPassword) async {
  Response response;

  Dio dio = Dio();
  var URL = "http://localhost:5000";

  // response = await dio.get("$URL/api/v0/auth/authStatus");
  // print("Response :: ${response.headers.toString()}");
  try {
    // First request, and save cookies (CookieManager do it).
    response = await dio.patch("$URL/api/v0/pharmacists/profile", data: {
      "newFirstName": newFirstName,
      "newLastName": newLastName,
      "NewPassword": newPassword
    });
    print("post response is $response");
    // authStatus = await dio.get("$URL/api/v0/auth/authStatus");
    // print("get response $authStatus");
    //response = await dio.get("https://google.com/");
    //print("google response is $response");
  } catch (err) {
    print("exception caught on line 22 - 29 : $err");
  }
}

class Album {
  final String newFirstName;
  final String newLastName;
  final String newPassword;

  Album({this.newFirstName, this.newLastName, this.newPassword});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      newFirstName: json['newFirstName'],
      newLastName: json['newLastName'],
      newPassword: json['newPassword'],
    );
  }
}

class Profile extends StatefulWidget {
  Profile({superkey});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController newFirstNameController = TextEditingController();
  TextEditingController newLastNameController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 7,
      child: Container(
        margin: Responsive.isDesktop(context)
            ? const EdgeInsets.only(top: 10, left: 0, right: 27, bottom: 15)
            : const EdgeInsets.only(top: 10, left: 55, right: 0, bottom: 15),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              kBgColor, // yellow sun
              kLabelColor,
              // blue sky
            ],
          ),
          //  color: Color.fromARGB(250, 250, 250, 250),
          borderRadius: BorderRadius.all(Radius.circular(35)),
        ),
        child: Row(
          children: [
            Responsive.isDesktop(context)
                ? Image.asset('images/Asset3.png',
                    height: height * 0.4, width: width * 0.35)
                : const SizedBox(),
            SingleChildScrollView(
              child: SizedBox(
                height:
                    Responsive.isDesktop(context) ? height * 1.1 : height * 1.2,
                width:
                    Responsive.isDesktop(context) ? width * 0.4 : width * 0.85,
                child: Card(
                  margin: const EdgeInsets.all(40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.08,
                      ),
                      Center(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Modify Your Profile',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor,
                                  //  Responsive.isDesktop(context)? kPrimaryColor: Colors.black,
                                  //  decorationColor: Responsive.isDesktop(context)? kPrimaryColor: Colors.black,
                                  fontSize: Responsive.isDesktop(context)
                                      ? 30.0
                                      : 20.0,
                                  fontFamily:
                                      'assets/fonts/Raleway-SemiBold.ttf'))
                        ])),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Center(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  'Fill the form to update your personal infos',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  decorationColor: Colors.red,
                                  color: Colors.red,
                                  fontSize: Responsive.isDesktop(context)
                                      ? 13.0
                                      : 9.0,
                                  fontFamily:
                                      'assets/fonts/Raleway-SemiBold.ttf'))
                        ])),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      SizedBox(
                        width: Responsive.isMobile(context)
                            ? width * 0.5
                            : width * 0.25,
                        height: 90,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding),
                          child: TextFormField(
                            controller: newFirstNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            onSaved: (text) {},
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(
                                      width: 1.5, color: kPrimaryColor)),
                              labelText: "New First Name",
                              labelStyle: const TextStyle(
                                color: kLabelColor,
                                fontSize: 15,
                              ),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(kDefaultPadding),
                                child: Icon(Icons.person,
                                    color: kPrimaryColor, size: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Responsive.isMobile(context)
                            ? width * 0.5
                            : width * 0.25,
                        height: 90,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding),
                          child: TextFormField(
                            controller: newLastNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            onSaved: (text) {},
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(
                                      width: 1.5, color: kPrimaryColor)),
                              labelText: "New Last Name",
                              labelStyle: const TextStyle(
                                color: kLabelColor,
                                fontSize: 15,
                              ),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(kDefaultPadding),
                                child: Icon(
                                  Icons.person,
                                  color: kPrimaryColor,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Responsive.isMobile(context)
                            ? width * 0.5
                            : width * 0.25,
                        height: 90,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding),
                          child: TextFormField(
                            controller: newPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            cursorColor: kPrimaryColor,
                            obscureText: _isObscure,
                            onSaved: (text) {},
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(
                                      width: 1.5, color: kPrimaryColor)),
                              labelText: "New Password",
                              labelStyle: const TextStyle(
                                color: kLabelColor,
                                fontSize: 15,
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  color: kPrimaryColor,
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                              alignLabelWithHint: false,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(kDefaultPadding),
                                child: Icon(
                                  Icons.lock,
                                  color: kPrimaryColor,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        width: Responsive.isMobile(context)
                            ? width * 0.5
                            : Responsive.isTablet(context)
                                ? width * 0.5
                                : width * 0.25,
                        height: height * 0.08,
                        child: Hero(
                          tag: "save changes",
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(kPrimaryColor),
                            ),
                            onPressed: () {
                              setState(() async {
                                await createAlbum(
                                    newFirstNameController.text.toString(),
                                    newLastNameController.text.toString(),
                                    newPasswordController.text.toString());
                                newFirstNameController.clear();
                                newLastNameController.clear();
                                newPasswordController.clear();
                              });
                            },
                            child: const Text(
                              "Save Changes",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
