
import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/http/stub/file_decoder_stub.dart';


import '../responsive.dart';
import 'constants.dart';
import 'dropdownmenu.dart';
import 'left_side.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'dart:typed_data';
import 'dart:io';


 Future<void> createAlbum(String name, String qty, String description, String priceDH, List fileInfo) async {
  Uint8List fileBin = fileInfo[0];
  String extension = fileInfo[1];
  //Setup firebase storage
  final storageRef = FirebaseStorage.instance.ref();
  String finalFileName = Uuid().v4() + "." + extension;
  final imagesRef = storageRef.child(finalFileName);
  try {
    await imagesRef.putData(fileBin, SettableMetadata(
    contentType: "image/$extension",
  ));
  } catch(err) {
    print("Unable to upload file!");
  }
  final link = await imagesRef.getDownloadURL();
  print("Your link good sir: $link");
  Response response;
  Dio dio = Dio();
  var URL ="https://prairie-lying-bass.glitch.me";
  try {
  response = await dio.post("$URL/api/v0/products/", data: {
    "name": name, 
    "qty": qty,
    "description": description,
    "priceDH": priceDH,
    "pictureLink": link});
    print("post response is $response");
  } catch (err) {
  print("exception caught on line 22 - 29 : $err");
  }
} 


class Album {
  final String name;
  final String description;
  final String qty;
  final String priceDH;
  final String pictureLink;

 
  Album({ this.name, this.description, this.qty, this.priceDH, this.pictureLink});
 
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['name'],
      description: json['description'],
      qty: json['qty'],
      priceDH: json['priceDH'],
      pictureLink: json['pictureLink']
    );
  }
}

class AddMedecine extends StatefulWidget {
   AddMedecine({superkey});
  @override

  State<AddMedecine> createState() => _AddMedecineState();
}
 

// Future<void> _uploadFile() async {}

class _AddMedecineState extends State<AddMedecine> {

  TextEditingController nameController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceDHController = TextEditingController();

  Future<List> _selectFile() async {
    //Read file picked by the user
    final result = await FilePicker.platform.pickFiles(type: FileType.any);
    List file;
    if (result != null) {
      file = [result.files.first.bytes, result.files.first.extension];
    }
    return file;
  }

  
  


   
  @override
  Widget build(BuildContext context) {
    List fileInfo;
    
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return 
       Expanded(
         flex: 7,
         child: Container(
          margin: Responsive.isDesktop(context)? const EdgeInsets.only(
          
                 top: 10, left: 0, right: 27, bottom: 15): const EdgeInsets.only(
          
                 top: 10, left: 60, right: 0, bottom: 15) ,
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
          Responsive.isDesktop(context)?
          Image.asset('images/Asset 6.png', height: height*0.4, width: width*0.35
                  ): const SizedBox(),
          SingleChildScrollView(
            child: SizedBox(
              height: Responsive.isDesktop(context)? height*1.4: height*1.4,
              width: Responsive.isDesktop(context)? width*0.4: width*0.85,
              child: Card
              (
                margin: const EdgeInsets.all(40),
                      shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))

                      ),
                      color: Colors.white,
                child: Column(children: [
                  SizedBox(height: height*0.08,),
                  Center(
                              child: RichText(text:  TextSpan(
                                children:[
                                  TextSpan(
                                    text: 'Add medecine',
                                    style: TextStyle(fontWeight: FontWeight.w600,
                                    decorationColor: kPrimaryColor,
                                    color: kDarkBlackColor,
                                    fontSize: Responsive.isDesktop(context)? 30.0: 25,
                                    fontFamily: 'assets/fonts/Raleway-SemiBold.ttf')
                                  )
                                ])),
                            ),
                            SizedBox(height: height*0.02, ),
                             Center(
                              child: RichText(text: TextSpan(
                                children:[
                                  TextSpan(
                                    text: 'Fill the form to add medecines to your stock',
                                    style: TextStyle(fontWeight: FontWeight.w600,
                                    decorationColor: Colors.red,
                                    color: Colors.red,
                                    fontSize: Responsive.isDesktop(context)? 13.0: 10,
                                    fontFamily: 'assets/fonts/Raleway-SemiBold.ttf')
                                  )
                                ])),
                            ),
                            SizedBox(height: height*0.04, ),
                            
              
                            SizedBox(width: width*0.02,),
                            SizedBox(
                                            width: Responsive.isMobile(context)? width*0.5 : width*0.25,
                                            height: 90,
                                           
                                             child: Padding(
                                               padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                               child: TextFormField(
                                                controller: nameController,
                                                         keyboardType: TextInputType.name,
                                                         textInputAction: TextInputAction.next,
                                                         cursorColor: Colors.black,
                                                         onSaved: (text) {},
                                                         decoration: InputDecoration(
                                                          focusedBorder:const UnderlineInputBorder(
                                                               borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
                                                               
                                                              ),
                                                              
                                                           enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                          
                                                           labelText: "Medicine Name",
                                                           labelStyle: const TextStyle(
                                                               color: kLabelColor,
                                                               fontSize: 15,
                                                              ),
                                          
                                                           prefixIcon: const Padding(
                                                             padding: EdgeInsets.all(kDefaultPadding),
                                                             child: Icon(Icons.medication_outlined , color: kPrimaryColor, size: 18),
                                                           ),
                                                         ),
                                                       ),
                                             ),
                                           ),
                                           SizedBox(width: width*0.02,),
                                            
              
                                           SizedBox(
                                            width: Responsive.isMobile(context)? width*0.5 : width*0.25,
                                            height: 90,
                                             child: Padding(
                                               padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                               
                                               child: TextFormField(
                                                controller: qtyController ,
                                                         keyboardType: TextInputType.name,
                                                         textInputAction: TextInputAction.next,
                                                         cursorColor: Colors.black,
                                                         onSaved: (text) {},
                                                         decoration: InputDecoration(
                                                          focusedBorder:const UnderlineInputBorder(
                                                               borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
                                                               
                                                              ),
                                                              
                                                           enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                          
                                                           labelText: "Quantity",
                                                           labelStyle: const TextStyle(
                                                               color: kLabelColor,
                                                               fontSize: 15,
                                                              ),
                                          
                                                           prefixIcon: const Padding(
                                                             padding: EdgeInsets.all(kDefaultPadding),
                                                             child: Icon(Icons.production_quantity_limits , color: kPrimaryColor, size: 18,),
                                                           ),
                                                         ),
                                                       ),
                                             ),
                                            ),
                                             SizedBox(
                                            width: Responsive.isMobile(context)? width*0.5 : width*0.25,
                                            height: 90,
                                             child: Padding(
                                               padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                               
                                               child: TextFormField(
                                                controller: descriptionController,
                                                         keyboardType: TextInputType.name,
                                                         textInputAction: TextInputAction.next,
                                                         cursorColor: Colors.black,
                                                         onSaved: (text) {},
                                                         decoration: InputDecoration(
                                                          focusedBorder:const UnderlineInputBorder(
                                                               borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
                                                               
                                                              ),
                                                              
                                                           enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                          
                                                           labelText: "Description",
                                                           labelStyle: const TextStyle(
                                                               color: kLabelColor,
                                                               fontSize: 15,
                                                              ),
                                          
                                                           prefixIcon: const Padding(
                                                             padding: EdgeInsets.all(kDefaultPadding),
                                                             child: Icon(Icons.description_outlined , color: kPrimaryColor, size: 18,),
                                                           ),
                                                         ),
                                                       ),
                                             ),
                                            ),
            
                                             SizedBox(
                                            width: Responsive.isMobile(context)? width*0.5 : width*0.25,
                                            height: 90,
                                             child: Padding(
                                               padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                               
                                               child: TextFormField(
                                                controller: priceDHController,
                                                         keyboardType: TextInputType.name,
                                                         textInputAction: TextInputAction.next,
                                                         cursorColor: Colors.black,
                                                         onSaved: (text) {},
                                                         decoration: InputDecoration(
                                                          focusedBorder:const UnderlineInputBorder(
                                                               borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
                                                               
                                                              ),
                                                              
                                                           enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width:1.5, color: kPrimaryColor)),
                                                          
                                                           labelText: "PriceDH",
                                                           labelStyle: const TextStyle(
                                                               color: kLabelColor,
                                                               fontSize: 15,
                                                              ),
                                          
                                                           prefixIcon: const Padding(
                                                             padding: EdgeInsets.all(kDefaultPadding),
                                                             child: Icon(Icons.price_change_outlined , color: kPrimaryColor, size: 18,),
                                                           ),
                                                         ),
                                                       ),
                                             ),
                                            ),
            
                                             SizedBox(
                                      width: Responsive.isMobile(context)? width*0.5 : width*0.25,
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
                                                  // ignore: curly_braces_in_flow_control_structures
                                                  return kLabelColor;
                                                return kLabelColor;
                                                },
                                              ), 
                                                // ignore: prefer_const_constructors
                                                side: MaterialStateProperty.all(BorderSide(
                                                  color: kLabelColor,
                                                  width: 1.5,
                                                  style: BorderStyle.solid))
                                                ),
                                          onPressed: (){
                                             setState(() async{
                                              fileInfo = await _selectFile();
                                              //Indicate that file has been uploaded
                                             });
                                          },

                                          child: Text("Medicine Picture", style: TextStyle(color: Colors.white),)
                                          )
                                          
                                       ),
                                         ),
            
                                           
            
                                           SizedBox(height: height*0.02,),
            
                                            SizedBox(
                                                     width: Responsive.isMobile(context)? width*0.5 : Responsive.isTablet(context)? width*0.5: width*0.25,
                                                    height: height*0.08,
                                                    child: Hero(
                                                      tag: "Add",
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                             RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                     
                                                      
                                                      )
                                                    ),
                                                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                                      ),
                                                        onPressed: () {
                                                           setState(() async{
                                                      await createAlbum(nameController.text.toString(), qtyController.text.toString(), descriptionController.text.toString(), priceDHController.text.toString(), fileInfo);
                                                      nameController.clear();
                                                       qtyController.clear();
                                                       descriptionController.clear();
                                                       priceDHController.clear();
                                                      
                                                    });
                                                           
                                                        },
                                                        child: const Text(
                                                          "Add",
                                                        ),
                                                      ),
                                                    ),
                                    ),
                ],),
              ),
            ),
          )
        ],
         ),
         
         ),);
    
  }
}