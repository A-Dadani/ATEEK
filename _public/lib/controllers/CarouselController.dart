
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news/responsive.dart';
import 'package:news/constants.dart';
import 'dart:io';

class CarouselDemo extends StatefulWidget {
  @override
  State<CarouselDemo> createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  final CarouselController buttonCarouselController = CarouselController();
  final formKey = GlobalKey<FormState>();
 
   

 @override
Widget build(BuildContext context){
  double height= MediaQuery.of(context).size.height;
  double width= MediaQuery.of(context).size.width;
  return Column(
    children: <Widget>[
      SizedBox(
       
        child: CarouselSlider(
         
          items: [1,2,3].map((i) {
          return Builder(
        
        builder: (BuildContext context) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: height*0.04),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white,),
                   width: width*0.6,
                  height: height*0.87,
                  
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [ 
                        Expanded(
                          flex: 16,
                          child: Container(child: Column(
                            children: [
                              Text('$i/3', style: TextStyle(fontSize: 16.0),),
                              
                               Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 100, height: 15,
                                    child:  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
                                      border: Border.all(
                                        color: kPrimaryColor,
                                        width: 2,
                                      ), 
                                      ),
                                  ),),
                                                       
                                  //Center(child: SizedBox(width: 3,)),
                               
                                  SizedBox(width: 100, height: 15,
                                    child:  DecoratedBox(
                                      decoration:  BoxDecoration(
                                        color: i==2 || i==3? kPrimaryColor : Colors.white,
                                         
                                      border: Border.all(
                                        color: kPrimaryColor,
                                        width: 2,
                                      ), 
                                      ),
                                    ),),
                               
                                  //Center(child: SizedBox(width: 3,)),
                               
                                  SizedBox(width: 100, height: 15,
                                    child:  DecoratedBox(
                                      decoration:  BoxDecoration(
                                        color: i==3? kPrimaryColor: Colors.white,
                                         borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
                                      border: Border.all(
                                        color: kPrimaryColor,
                                        width: 2,
                                        
                                      ),
                                    ),)
                                  ),
                                ],
                                 
                               ),
                               SizedBox(height: height*0.02),
                               

                            i==1? Container(
                              
                                child: Column(
                                  children: [
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
                          SizedBox(height: height*0.07),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: width*0.03,),
                              RichText(text: TextSpan(
                                      children:[
                                        TextSpan(
                                          text: 'Personal Information:',
                                          style: TextStyle(fontWeight: FontWeight.w600,
                                          fontSize: 15.0,
                                          color: kPrimaryColor,
                                          fontFamily: 'assets/fonts/Raleway-SemiBold.ttf')
                                        )
                                      ])),
                            ],
                          ),
                  
                          Row(
                            children: [
                              SizedBox(width: width*0.03,),
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
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
                                                     labelText: "First Name",
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
                              SizedBox(width: width*0.08),
                  
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
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
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
                                     SizedBox(width: width*0.03,)
                  
                            ],
                          ),
                  
                          Row(
                            children: [
                              SizedBox(width: width*0.03,),
                              Expanded(
                                    flex: 1,
                                    
                                    child: SizedBox(
                                      width: Responsive.isMobile(context)? width*0.6 : width*0.15,
                                      height: 90,
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                         child: TextFormField(
                                                   keyboardType: TextInputType.emailAddress,
                                                   textInputAction: TextInputAction.next,
                                                   cursorColor: Colors.black,
                                                   onSaved: (text) {},
                                                   decoration: InputDecoration(
                                                    focusedBorder:UnderlineInputBorder(
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
                                                     labelText: "Email",
                                                     labelStyle: TextStyle(
                                                         color: kLabelColor,
                                                         fontSize: 15,
                                                        ),
                                    
                                                     prefixIcon: Padding(
                                                       padding: const EdgeInsets.all(kDefaultPadding),
                                                       child: Icon(Icons.email , color: kPrimaryColor, size: 18),
                                                     ),
                                                   ),
                                                 ),
                                       ),
                                     ),
                              ),
                              SizedBox(width: width*0.08),
                  
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                      width: Responsive.isMobile(context)? width*0.6 : width*0.13,
                                      height: 90,
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                         
                                         child: TextFormField(
                                                   keyboardType: TextInputType.visiblePassword,
                                                   textInputAction: TextInputAction.next,
                                                   cursorColor: Colors.black,
                                                   onSaved: (text) {},
                                                   decoration: InputDecoration(
                                                    focusedBorder:UnderlineInputBorder(
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
                                                     labelText: "Password",
                                                     labelStyle: TextStyle(
                                                         color: kLabelColor,
                                                         fontSize: 15,
                                                        ),
                                    
                                                     prefixIcon: Padding(
                                                       padding: const EdgeInsets.all(kDefaultPadding),
                                                       child: Icon(Icons.lock , color: kPrimaryColor, size: 18,),
                                                     ),
                                                   ),
                                                 ),
                                       ),
                                                                 ),
                                    ),
                                     SizedBox(width: width*0.03)
                            ],
                          ),
                  
                           Row(
                            children: [
                              SizedBox(width: width*0.03,),
                              Expanded(
                                    flex: 1,
                                    
                                    child: SizedBox(
                                      width: Responsive.isMobile(context)? width*0.6 : width*0.15,
                                      height: 90,
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
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
                                                  return kPrimaryColor;
                                                return kPrimaryColor;
                                                },
                                              ), 
                                                side: MaterialStateProperty.all(BorderSide(
                                                  color: kPrimaryColor,
                                                  width: 1.5,
                                                  style: BorderStyle.solid))
                                                ),
                                          onPressed: (){
                                            pickFile();
                                            
                                          },
                                          child: Text("choose a picture", style: TextStyle(color: Colors.white),)
                                          )

                                       ),
                                     ),
                              ),
                              SizedBox(width: width*0.08),
                  
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                      width: Responsive.isMobile(context)? width*0.6 : width*0.13,
                                      height: 90,
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                         
                                         child: TextFormField(
                                                   keyboardType: TextInputType.visiblePassword,
                                                   textInputAction: TextInputAction.next,
                                                   cursorColor: Colors.black,
                                                   onSaved: (text) {},
                                                   decoration: InputDecoration(
                                                    focusedBorder:UnderlineInputBorder(
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
                                                     labelText: "Confirm Password",
                                                     labelStyle: TextStyle(
                                                         color: kLabelColor,
                                                         fontSize: 15,
                                                        ),
                                    
                                                     prefixIcon: Padding(
                                                       padding: const EdgeInsets.all(kDefaultPadding),
                                                       child: Icon(Icons.lock , color: kPrimaryColor, size: 18,),
                                                     ),
                                                   ),
                                                 ),
                                       ),
                                                                 ),
                                    ),
                                     SizedBox(width: width*0.03,),
                                    ],
                          ),
                                  ],
                                ),





                            ): i==2?
                            Container(
                               child: Column(
                                  children: [
                          SizedBox(height: height*0.07),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: width*0.03,),
                              RichText(text: TextSpan(
                                      children:[
                                        TextSpan(
                                          text: 'Pharmacy Information:',
                                          style: TextStyle(fontWeight: FontWeight.w600,
                                          fontSize: 15.0,
                                          color: kPrimaryColor,
                                          fontFamily: 'assets/fonts/Raleway-SemiBold.ttf')
                                        )
                                      ])),
                            ],
                          ),
                  
                          Row(
                            children: [
                              SizedBox(width: width*0.03,),
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
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
                                                     labelText: "Pharmacy Name",
                                                     labelStyle: TextStyle(
                                                         color: kLabelColor,
                                                         fontSize: 15,
                                                        ),
                                    
                                                     prefixIcon: Padding(
                                                       padding: const EdgeInsets.all(kDefaultPadding),
                                                       child: Icon(Icons.local_pharmacy , color: kPrimaryColor, size: 18),
                                                     ),
                                                   ),
                                                 ),
                                       ),
                                     ),
                              ),
                              SizedBox(width: width*0.08),
                  
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                      width: Responsive.isMobile(context)? width*0.6 : width*0.13,
                                      height: 90,
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                         
                                         child: TextFormField(
                                                   keyboardType: TextInputType.streetAddress,
                                                   textInputAction: TextInputAction.next,
                                                   cursorColor: Colors.black,
                                                   onSaved: (text) {},
                                                   decoration: InputDecoration(
                                                    focusedBorder:UnderlineInputBorder(
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
                                                     labelText: "Pharmacy adress line 1",
                                                     labelStyle: TextStyle(
                                                         color: kLabelColor,
                                                         fontSize: 15,
                                                        ),
                                    
                                                     prefixIcon: Padding(
                                                       padding: const EdgeInsets.all(kDefaultPadding),
                                                       child: Icon(Icons.add_location_alt , color: kPrimaryColor, size: 18,),
                                                     ),
                                                   ),
                                                 ),
                                       ),
                                                                 ),
                                    ),
                                     SizedBox(width: width*0.03,)
                  
                            ],
                          ),
                  
                          Row(
                            children: [
                              SizedBox(width: width*0.03,),
                              Expanded(
                                    flex: 1,
                                    
                                    child: SizedBox(
                                      width: Responsive.isMobile(context)? width*0.6 : width*0.15,
                                      height: 90,
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                         child: TextFormField(
                                                   keyboardType: TextInputType.streetAddress,
                                                   textInputAction: TextInputAction.next,
                                                   cursorColor: Colors.black,
                                                   onSaved: (text) {},
                                                   decoration: InputDecoration(
                                                    focusedBorder:UnderlineInputBorder(
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
                                                     labelText: "Pharmacy Adress line 2",
                                                     labelStyle: TextStyle(
                                                         color: kLabelColor,
                                                         fontSize: 15,
                                                        ),
                                    
                                                     prefixIcon: Padding(
                                                       padding: const EdgeInsets.all(kDefaultPadding),
                                                       child: Icon(Icons.add_location_alt , color: kPrimaryColor, size: 18),
                                                     ),
                                                   ),
                                                 ),
                                       ),
                                     ),
                              ),
                              SizedBox(width: width*0.08),
                  
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                      width: Responsive.isMobile(context)? width*0.6 : width*0.13,
                                      height: 90,
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                         
                                         child: TextFormField(
                                                   keyboardType: TextInputType.visiblePassword,
                                                   textInputAction: TextInputAction.next,
                                                   cursorColor: Colors.black,
                                                   onSaved: (text) {},
                                                   decoration: InputDecoration(
                                                    focusedBorder:UnderlineInputBorder(
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
                                                     labelText: "country",
                                                     labelStyle: TextStyle(
                                                         color: kLabelColor,
                                                         fontSize: 15,
                                                        ),
                                    
                                                     prefixIcon: Padding(
                                                       padding: const EdgeInsets.all(kDefaultPadding),
                                                       child: Icon(Icons.mail, color: kPrimaryColor, size: 18,),
                                                     ),
                                                   ),
                                                 ),
                                       ),
                                                                 ),
                                    ),
                                     SizedBox(width: width*0.03,)
                  
                            ],
                          ),
                  
                           Row(
                            children: [
                              SizedBox(width: width*0.03,),
                            
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
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
                                                     labelText: "City",
                                                     labelStyle: TextStyle(
                                                         color: kLabelColor,
                                                         fontSize: 15,
                                                        ),
                                    
                                                     prefixIcon: Padding(
                                                       padding: const EdgeInsets.all(kDefaultPadding),
                                                       child: Icon(Icons.location_city , color: kPrimaryColor, size: 18),
                                                     ),
                                                   ),
                                                 ),
                                       ),
                                     ),
                              ),
                              SizedBox(width: width*0.08),
                  
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                      width: Responsive.isMobile(context)? width*0.6 : width*0.13,
                                      height: 90,
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                         
                                         child: TextFormField(
                                                   keyboardType: TextInputType.number,
                                                   textInputAction: TextInputAction.next,
                                                   cursorColor: Colors.black,
                                                   onSaved: (text) {},
                                                   decoration: InputDecoration(
                                                    focusedBorder:UnderlineInputBorder(
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
                                                     labelText: "Postal Code",
                                                     labelStyle: TextStyle(
                                                         color: kLabelColor,
                                                         fontSize: 15,
                                                        ),
                                    
                                                     prefixIcon: Padding(
                                                       padding: const EdgeInsets.all(kDefaultPadding),
                                                       child: Icon(Icons.numbers_rounded , color: kPrimaryColor, size: 18,),
                                                     ),
                                                   ),
                                                 ),
                                       ),
                                                                 ),
                                    ),
                                     SizedBox(width: width*0.03,),
                  
                            ],
                          ),
                          

                          Row(
                            children: [
                              SizedBox(width: width*0.03,),
                            
                             Expanded(
                                    flex: 1,
                                    
                                    child: SizedBox(
                                      width: Responsive.isMobile(context)? width*0.6 : width*0.15,
                                      height: 90,
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                         child: TextFormField(
                                                   keyboardType: TextInputType.phone,
                                                   textInputAction: TextInputAction.next,
                                                   cursorColor: Colors.black,
                                                   onSaved: (text) {},
                                                   decoration: InputDecoration(
                                                    focusedBorder:UnderlineInputBorder(
                                                         borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                         
                                                        ),
                                                        
                                                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                    
                                                     labelText: "Phone Number",
                                                     labelStyle: TextStyle(
                                                         color: kLabelColor,
                                                         fontSize: 15,
                                                        ),
                                    
                                                     prefixIcon: Padding(
                                                       padding: const EdgeInsets.all(kDefaultPadding),
                                                       child: Icon(Icons.phone , color: kPrimaryColor, size: 18),
                                                     ),
                                                   ),
                                                 ),
                                       ),
                                     ),
                              ),
                              SizedBox(width: width*0.08),
                  
                                    Expanded(
                                    flex: 1,
                                    
                                    child: SizedBox(
                                      width: Responsive.isMobile(context)? width*0.6 : width*0.15,
                                      height: 90,
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
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
                                                  return kPrimaryColor;
                                                return kPrimaryColor;
                                                },
                                              ), 
                                                side: MaterialStateProperty.all(BorderSide(
                                                  color: kPrimaryColor,
                                                  width: 1.5,
                                                  style: BorderStyle.solid))
                                                ),
                                          onPressed: (){
                                            pickFile();
                                            
                                          },
                                          child: Text("file", style: TextStyle(color: Colors.white),)
                                          )

                                       ),
                                     ),
                              ),
                                     SizedBox(width: width*0.03,),
                  
                            ],
                          ),




                                  ],
                                ),

                              

                            ): 

                            Container()










                  
                            ],
                          ))
                          
                          ),
                           
                         Expanded(
                          flex: 2,
                           child: 
                           i==1? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                              
                               ElevatedButton(
                                  onPressed: () => buttonCarouselController.nextPage(
                                    duration: Duration(milliseconds: 300), curve: Curves.linear),
                                    style: ElevatedButton.styleFrom(
                                          minimumSize: Size(100, 50)),
                                                 child: Text('Next'),
                                               
                               ),
                               SizedBox(width: 12),
                             ],
                           ): i==3? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               SizedBox(width: 12),
                               ElevatedButton(
                                                 onPressed: () => buttonCarouselController.previousPage(
                                        duration: Duration(milliseconds: 300), curve: Curves.linear),
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(100, 50),
                                        ),
                                                 child: Text('Previous'),
                                               ),
                             ],
                           ):
                            Row(
                            
                            children: [
                              SizedBox(width: 12),
                                  ElevatedButton(
                                             onPressed: () => buttonCarouselController.previousPage(
                                    duration: Duration(milliseconds: 300), curve: Curves.linear),
                                    style: ElevatedButton.styleFrom(
                                          minimumSize: Size(100, 50)),
                                          
                                             child: Text('Previous'),
                                           ),
                                           SizedBox(width: width*0.435),
                                  ElevatedButton(
                                             onPressed: () => buttonCarouselController.nextPage(
                            duration: Duration(milliseconds: 300), curve: Curves.linear),
                            style: ElevatedButton.styleFrom(
                                          minimumSize: Size(100, 50)),
                                             child: Text('Next'),
                                           ),
                                           
                                         
                            ],
                                               )
                         ),
                      ],
                    ),
                  )
                ),

              ],
            ),
          );
        },
          );
        }).toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: false,
            aspectRatio: 2,
            height: height,
           
          ),
          
        ),
      ),
      
     
    ]
  );
  
}
 String _fileText= "";

void pickFile() async{
  FilePickerResult result = await FilePicker.platform.pickFiles(
     type: FileType.custom,
  allowedExtensions: ['jpg', 'jpeg', 'png', 'webp'],
);
if(result!=null && result.files.single.path!=null ){
  PlatformFile file=result.files.first;
  print(file.name);
  print(file.bytes);
  print(file.size);
  print(file.extension);
  print(file.path);

File _file= File(result.files.single.path);
setState(() {
  _fileText= _file.path;
});
}else{
  //User canceld the picker
}

/* String selectedDirectory = await FilePicker.platform.getDirectoryPath();
print(selectedDirectory);

if (selectedDirectory == null) {
  // User canceled the picker
}
String outputFile = await FilePicker.platform.saveFile(
  dialogTitle: 'Please select an output file:',
  fileName: 'output-file.pdf',
);

if (outputFile == null) {
  // User canceled the picker
}
*/
}
 
 
}



