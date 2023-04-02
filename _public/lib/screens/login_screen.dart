import 'dart:convert';

import 'package:flutter/material.dart';



import 'package:news/responsive.dart';
import 'package:news/screens/singnup_screen.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../profile/home.dart';
import '../profile/main.dart';


  
Future<void> createAlbum(String email, dynamic password) async {
  Response response;
 
  Dio dio = Dio();
  var URL ="localhost:5000";
  // response = await dio.get("$URL/api/v0/auth/authStatus");
  // print("Response :: ${response.headers.toString()}");
 try {
  // First request, and save cookies (CookieManager do it).
  response = await dio.post("$URL/api/v0/auth/signin", data: {"email": email, "password": password});
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
  final String password;
  final String email;
 
  Album({ this.password, this.email});
 
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      password: json['password'],
      email: json['email'],
    );
  }
}


class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  
 

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
 

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
           image: DecorationImage(
            image: AssetImage("assets/images/background11.jpg"),
            fit: BoxFit.fill,
        )),
        child: SizedBox(
           
          height: height,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Responsive.isMobile(context)? SizedBox(): Responsive.isTablet(context)? SizedBox(): Expanded(child: Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(130, 40, 0, 40),
                  width: width, height: height,
                  child: Card(
                    
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
      
                    ),
                    color: Colors.white,
                    child: Image.asset('assets/images/pic.png', height: height, width: width,fit:BoxFit.fill,
                      ),)
                  ),
              ),
              ),
              Center(
                child: SizedBox(width: 0, height: height*0.855,
                child: 
                
                const DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white
                    
                  ),
                ),),
              ),
              Expanded(child: Container(
                height: height,
                
                
                child: Container(
                 width: Responsive.isMobile(context)? width *0.75:Responsive.isTablet(context)? width*0.75: width*0.28, 
                 height: Responsive.isMobile(context)? height*0.75 :Responsive.isTablet(context)? height*0.75: height*0.25,
                  margin: Responsive.isMobile(context)? EdgeInsets.all(40):Responsive.isTablet(context)? EdgeInsets.all(30): EdgeInsets.fromLTRB(0, 40, 130, 40),
                  child: Card(
                    margin: EdgeInsets.zero,
                    
                    shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
      
                    ),
                    color: Colors.white,
      
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           SizedBox(height: height*0.04),
                              Center(child: Image.asset('assets/images/favicon.png', width: width*0.08, height: height*0.1)),
                              SizedBox(height: height*0.04),
                          Center(
                            child: RichText(text: TextSpan(
                              children:[
                                TextSpan(
                                  text: 'Sign in to your account',
                                  style: TextStyle(fontWeight: FontWeight.w600,
                                  decorationColor: kPrimaryColor,
                                  color: kDarkBlackColor,
                                  fontSize: Responsive.isDesktop(context)? 30.0: 20,
                                  fontFamily: 'assets/fonts/Raleway-SemiBold.ttf')
                                )
                              ])),
                          ),
                    
                          SizedBox(height:Responsive.isMobile(context)? height*0.03: height*0.06),
                    
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: SizedBox(
                                width: Responsive.isMobile(context)? width*0.6 :Responsive.isTablet(context)? width*0.5: width*0.3,
                                
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                   child: TextFormField(
                                    controller: emailController,
                                             keyboardType: TextInputType.emailAddress,
                                             textInputAction: TextInputAction.next,
                                             cursorColor: Colors.black,
      
                                             onSaved: (email) {},
                                             decoration: InputDecoration(
                                              focusedBorder:UnderlineInputBorder(
                                                   borderSide:  BorderSide(color: kPrimaryColor, width: 1.5),
                                                   
                                                  ),
                                                  
                                               enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                               hintText: "Your email",
                                               labelText: "Email",
                                               labelStyle: TextStyle(
                                                   color: kLabelColor,
                                                  ),
                                                
                                               prefixIcon: Padding(
                                                 padding: const EdgeInsets.all(kDefaultPadding),
                                                 child: Icon(Icons.person, color: kPrimaryColor,),
                                               ),
                                             ),
                                           ),
                                 ),
                               ),
                            ),
                          ),
                    
                      Expanded(
                        flex:3,
                        child: Center(
                        child: SizedBox(
                         width: Responsive.isMobile(context)? width*0.6  :Responsive.isTablet(context)? width*0.5: width*0.3,
                      
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                          child: TextFormField(
                            controller: passwordController,
                            textInputAction: TextInputAction.done,
                            obscureText: _isObscure,
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              
                              focusedBorder:UnderlineInputBorder(
                              borderSide:  BorderSide(color: kPrimaryColor, width: 1.5),),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                              hintText: "Your password",
                              labelText: "Password",
                               suffixIcon: IconButton(
                        icon: Icon( 
                            _isObscure ? Icons.visibility_off : Icons.visibility), 
                            color: kPrimaryColor,
                            
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                               });
                            }),
                      
                               
                              alignLabelWithHint: false,
                              
                              
                               labelStyle: TextStyle(color: kLabelColor),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(kDefaultPadding),
                                child: Icon(Icons.lock, color: kPrimaryColor,),
                              ),
                            ),
                              keyboardType: TextInputType.visiblePassword,
                              
                            
                          ),
                        ),
                                  ),
                                ),
                      ),
                    
                              Expanded(
                                flex:1,
                                child: SizedBox(
                                  child: Container(
                                    margin:Responsive.isMobile(context)?  EdgeInsets.only(left: width*0.15): Responsive.isTablet(context)? EdgeInsets.only(left: width*0.30): EdgeInsets.only(left: width*0.12),
                                    child: Row(children: [
                                    RichText(text: TextSpan(
                                      text: "Don't have an account?",
                                      style: TextStyle(
                                        fontFamily: ('assets/fonts/Raleway-SemiBold.ttf'),
                                        color: kDarkBlackColor,
                                        fontSize: 15,
                                      ),
                                    )),
                                    Center(
                                      child: ElevatedButton(onPressed: (){
                                         Navigator.push(
                                        context,
                                         MaterialPageRoute(builder: (context) => const SignUpScreen()));
                                      }, child: Text("Sign up", style: TextStyle(color: Colors.red, fontSize: 16, decoration: TextDecoration.underline,), ), style: ElevatedButton.styleFrom(
                                         shadowColor: Colors.transparent,
                                        elevation: 0.0,
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.all(0)
                                       
                                      )
                                                    
                                                              
                                      )
                                    )
                                    
                                    ],),
                                  ),
                                
                                ),
                              ),
                              const SizedBox(height: kDefaultPadding),
                              Expanded(
                                flex:3,
                                child: Center(
                                  child: SizedBox(
                                                   width: Responsive.isMobile(context)? width*0.6 : Responsive.isTablet(context)? width*0.5: width*0.3,
                                                  height: height*0.08,
                                                  child: Hero(
                                                    tag: "login_btn",
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                      
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                           RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                    
                                                    
                                                    )
                                                  ),
                                                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(MaterialState.pressed))
                                                  // ignore: curly_braces_in_flow_control_structures
                                                  return kPrimaryColor;
                                                return kPrimaryColor;
                                                },
                                              ), 
                                    ),
                                                      onPressed: () {
                                                         setState(() async{
                                                          await createAlbum(emailController.text.toString(), passwordController.text.toString());
                                                          Navigator.push(
                                                          context,
                                                        MaterialPageRoute(builder: (context) =>  MyApp())); //pushReplacementNamed
                                                        });
                                                      },
                                                      child: Text(
                                                        "Login".toUpperCase(),
                                                      ),
                                                    ),
                                                  ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: kDefaultPadding),
                            ],
                      ),
                     
                    ),
                  ),
                ),
              ))
            ],
        ),
          ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {

      // TODO: Implement login process
      // If login is successful, save token to local storage
      String token = 'sample_token';
      Navigator.pushReplacementNamed(context, '/home', arguments: token);
    }
  }
 
}