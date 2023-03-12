import 'package:flutter/material.dart';
import 'package:news/constants.dart';
import 'package:news/responsive.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({Key key}) : super(key: key);

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
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
              Responsive.isMobile(context)? SizedBox(): Expanded(child: Container(
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
                  child: Column(
                    children: [
                      RichText(text: TextSpan(
                      children:[
                        TextSpan(
                          text: 'Geolocation',
                          style: TextStyle(fontWeight: FontWeight.w200,
                          decorationColor: kPrimaryColor,
                          fontSize: 20.0,
                          fontFamily: 'assets/fonts/Raleway-SemiBold.ttf'),
                          
                        )
                      ])),
                    ],
                  ),
                          
                           
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
                  width: width*0.25, height: height*0.25, margin: EdgeInsets.fromLTRB(0, 40, 130, 40),
                  child: Card(
                    margin: EdgeInsets.zero,
                    
                    shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
      
                    ),
                    color: Colors.white,
      
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         SizedBox(height: height*0.02),
                            Center(child: Image.asset('assets/images/favicon.png', width: width*0.04, height: height*0.06)),
                            SizedBox(height: height*0.02),
                        Center(
                          child: RichText(text: TextSpan(
                            children:[
                              TextSpan(
                                text: 'Regestration Form',
                                style: TextStyle(fontWeight: FontWeight.w600,
                                decorationColor: kPrimaryColor,
                                fontSize: 25.0,
                                fontFamily: 'assets/fonts/Raleway-SemiBold.ttf')
                              )
                            ])),
                        ),
                        SizedBox(height: height*0.04),
                        RichText(text: TextSpan(
                            children:[
                              TextSpan(
                                text: 'Personal Information:',
                                style: TextStyle(fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                fontFamily: 'assets/fonts/Raleway-SemiBold.ttf')
                              )
                            ])),
                            
                        Row(
                          children: [
                            SizedBox(width: width*0.01,),
                            Expanded(
                              flex: 1,
                              
                              child: SizedBox(
                                width: Responsive.isMobile(context)? width*0.6 : width*0.15,
                                height: 90,
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                   child: TextFormField(
                                             keyboardType: TextInputType.name,
                                             textInputAction: TextInputAction.next,
                                             cursorColor: Colors.black,
                                             onSaved: (text) {},
                                             decoration: InputDecoration(
                                              focusedBorder:UnderlineInputBorder(
                                                   borderSide: const BorderSide(color: kPrimaryColor, width: 1.0),
                                                   
                                                  ),
                                                  
                                               enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1, color: kPrimaryColor)),
                                              
                                               labelText: "Fast Name",
                                               labelStyle: TextStyle(
                                                   color: kLabelColor,
                                                   fontSize: 15,
                                                  ),
                              
                                               prefixIcon: Padding(
                                                 padding: const EdgeInsets.all(kDefaultPadding),
                                                 child: Icon(Icons.person , color: kPrimaryColor, size: 18),
                                               ),
                                             ),
                                           ),
                                 ),
                               ),
                            ),
                            SizedBox(width: width*0.03),

                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                width: Responsive.isMobile(context)? width*0.6 : width*0.13,
                                height: 90,
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                   
                                   child: TextFormField(
                                             keyboardType: TextInputType.name,
                                             textInputAction: TextInputAction.next,
                                             cursorColor: Colors.black,
                                             onSaved: (text) {},
                                             decoration: InputDecoration(
                                              focusedBorder:UnderlineInputBorder(
                                                   borderSide: const BorderSide(color: kPrimaryColor, width: 1.0),
                                                   
                                                  ),
                                                  
                                               enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1, color: kPrimaryColor)),
                                              
                                               labelText: "Last Name",
                                               labelStyle: TextStyle(
                                                   color: kLabelColor,
                                                   fontSize: 15,
                                                  ),
                              
                                               prefixIcon: Padding(
                                                 padding: const EdgeInsets.all(kDefaultPadding),
                                                 child: Icon(Icons.person , color: kPrimaryColor, size: 18,),
                                               ),
                                             ),
                                           ),
                                 ),
                                                           ),
                              ),
                               SizedBox(width: width*0.01,)

                          ],
                        ),
                            SizedBox(
                     width: Responsive.isMobile(context)? width*0.6 : width*0.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        obscureText: _isObscure,
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                          
                          focusedBorder:UnderlineInputBorder(
                          borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:3, color: kPrimaryColor)),
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
                            const SizedBox(height: kDefaultPadding),
                            Center(
                              child: SizedBox(
                     width: Responsive.isMobile(context)? width*0.6 : width*0.3,
                    height: height*0.08,
                    child: Hero(
                      tag: "login_btn",
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                      )
                    )
                                ),
                        onPressed: () {},
                        child: Text(
                          "Login".toUpperCase(),
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
              ))
            ],
        ),
          ),
      ),
    );
  }
}
  
