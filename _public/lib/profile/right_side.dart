import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../constants.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_network/image_network.dart';

import '../responsive.dart';
import 'global.dart';
import 'package:http/http.dart' as http;

List<Medicines> _medicines = [];
class Medicines {
  final String pictureLink; 
  final String productID;
  final String name;
  final String description;
  final String priceDH;
  final String ownerID;
  final String qty;

  Medicines({
    @required this.pictureLink, 
    @required this.productID,
    @required this.name,
    @required this.description,
    @required this.priceDH,
    @required this.ownerID,
    @required this.qty,
  });

 
}

Future<String> GetPharmacyID()async{
  Response response;
  Dio dio = Dio();
  var URL ="https://prairie-lying-bass.glitch.me";
  response = await dio.get("$URL/api/v0/pharmacies/getOwnID");
  print("pharmacy name is: $response");
  return response.data['ID'].toString();
}

// -------------------------------------------------








Future<void> patchState(bool isGarde)async{
  Response response;
 
  Dio dio = Dio();
  var URL ="https://prairie-lying-bass.glitch.me";

  // response = await dio.get("$URL/api/v0/auth/authStatus");
  // print("Response :: ${response.headers.toString()}");
 try {
  // First request, and save cookies (CookieManager do it).
  response = await dio.patch("$URL/api/v0/pharmacies/", data: {"isGarde": isGarde});
  print("post response is $response");
  // authStatus = await dio.get("$URL/api/v0/auth/authStatus");
  // print("get response $authStatus");
  //response = await dio.get("https://google.com/");
  //print("google response is $response");
 } catch (err) {
  print("exception caught on line 22 - 29 : $err");
 }
}

Future<bool> getState()async{
  Response response;
 
  Dio dio = Dio();
  var URL ="https://prairie-lying-bass.glitch.me";
 try {
  response = await dio.get("$URL/api/v0/pharmacies/getDutyStatus");
  print("get response $response");
 } catch (err) {
  print("exception caught on line 22 - 29 : $err");
 }
 return response.data['isGarde'];
}



class Album {
  final bool isGarde;

 
  Album({ this.isGarde});
 
  factory Album.fromJson(Map<bool, bool> json) {
    return Album(
      isGarde: json['isGarde'],
     
    );
  }
}


class RightSide extends StatefulWidget {
  const RightSide({superkey});

  @override
  State<RightSide> createState() => RrightSideState();
}

class RrightSideState extends State<RightSide> {
  
  

  bool status = false;
  @override
  void initState() {
    super.initState();
    // Call the function to get the medicines list
    _getMedicines();
  }
  Future <void> _getMedicines() async {
    try {
      final pharmacyID= await GetPharmacyID();
      final response = await http.get(Uri.parse(
          'https://prairie-lying-bass.glitch.me/api/v0/pharmacies/$pharmacyID/allProducts'));
      if (response.statusCode == 200) {
      try {
        
       setState(() {
         final List<dynamic> data = jsonDecode(response.body);
          _medicines = data
              .map((item) => Medicines(
                    pictureLink: item['pictureLink'], 
                    productID: item['productID'],
                    name: item['name'],
                    description: item['description'],
                    priceDH: item['priceDH'],
                    ownerID: item['ownerID'],
                    qty: item['qty'],
                  ))
              .toList();
       });
      } catch (error) {
        print(error);
      }
    }
    if (response.statusCode != 200) {
      throw Exception('Failed to load pharmacies list');
    }
    
    } catch (err) {
      print(err);
      print('hello');
    }
    print("med : $_medicines");
    return _medicines;
    
  }
  @override

  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;

    return Expanded(
      flex: 7,
      child: Container(
        margin: Responsive.isDesktop(context)? EdgeInsets.only(top: 20, right: 10, bottom: 20) :  EdgeInsets.only(top: 5,left: 90, right: 10, bottom: 5),
        decoration: const BoxDecoration(
           gradient: LinearGradient(
              colors: <Color>[
                kLabelColor,
            kBgColor,
             // yellow sun
          
           // blue sky
    ],
            ),
          //  color: Color.fromARGB(250, 250, 250, 250),
          borderRadius: BorderRadius.all(Radius.circular(35)),
        ),
        child: Column(
          children: [
            appBar(),
            Expanded(
              
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                }, scrollbars: false),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                       SizedBox(height:2, width: width*0.4, 
                       child: const DecoratedBox(
                      decoration:  BoxDecoration(
                      // color: Color.fromARGB(255, 246, 248, 247),
                      ),
                    ), ),
                    SizedBox(height: height*0.08,),
                      medicine(),
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

  Container medicine() {
     double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.green,
      // height: 400,
      child: Column(
        children: [
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(width: 2),
                Container(

                  child: Responsive.isDesktop(context)? 
                  Card(
                
                      shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(
                        Radius.circular(30),
                       
                      ),
                      
                      ),
                      color: Colors.white,
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      child: Column(
                        
                        children: [
                           Text(
                                       "🗈 Note!",
                                       
                                       style: TextStyle(
                           
                           color: Colors.red,
                           fontSize: Responsive.isDesktop(context)? 24: 15,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'assets/fonts/Raleway-SemiBold.ttf'
                                       ),
                                     ),
                                     
                                     Text("You have to set your\n daily night shift status",
                                     style: TextStyle(
                           
                           color: kDarkBlackColor,
                           fontSize: Responsive.isDesktop(context)? 15: 10,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'assets/fonts/Raleway-SemiBold.ttf'
                                       ),
                                    
                                       ),
                        ],
                      ),
                    ),
                  ):Container(),
                ),
             
             
               
                SizedBox(width: width*0.4),
                
                 Column(
                   children: [
                     Text("Night Shift Status ",
                     style: TextStyle(
                         color: kDarkBlackColor,
                         fontSize: Responsive.isDesktop(context)? 18: 13,
                         fontWeight: FontWeight.bold,
                          fontFamily: 'assets/fonts/Raleway-SemiBold.ttf'
                       ),),
                       SizedBox(height: height*0.02,),
                       

                        FutureBuilder<bool>(
          future: getState(),
    // ignore: missing_return
         builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
                // Handle error
            } else {
                bool status = snapshot.data;
                return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                            FlutterSwitch(
                                width: Responsive.isDesktop(context)? width*0.12: width*0.28,
                                height: Responsive.isDesktop(context)? height*0.07: height*0.08,
                                valueFontSize: 25.0,
                                toggleSize: 45.0,
                                
                                borderRadius: 30.0,
                                padding: 8.0,
                                showOnOff: true,
                                onToggle: (isGarde) async {
                                    await patchState(isGarde);
                                    setState(() {
                                      
                                        status = isGarde;
                                    });

                                  
                                },
                                value: status,
                                activeText: Text('On duty', style: TextStyle(fontSize: Responsive.isDesktop(context)?20 : 0),).data,
                                inactiveText: Text('Inactive', style: TextStyle(fontSize: Responsive.isDesktop(context)?20 : 0),).data,
                                activeColor: kPrimaryColor,
                                // thumbColor: Colors.white,
                                inactiveColor: Colors.red,
                            ),
                            SizedBox(width: width*0.020),
                        ],
                );
            }
        } else {
            return CircularProgressIndicator();
        }
    },
),
                   ],
                 ),
                   
              ],
            ),
          
          
          Container(
            decoration: const BoxDecoration(
           gradient: LinearGradient(
              colors: <Color>[
                kLabelColor,
            kBgColor, // yellow sun
          
           // blue sky
    ],
            ),
          //  color: Color.fromARGB(250, 250, 250, 250),
        ),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            
            child: Column(
              children: [
                SizedBox(height:height*0.1),
                Row(
                  children: [
                    SizedBox(width: 2),
                    Icon(Icons.list_alt_rounded, color: kDarkBlackColor),
                    SizedBox(width: 20),
                   
                     Text(
                      "Your Medicines' List",
                      
                      style: TextStyle(
                        
                        color: kDarkBlackColor,
                        fontSize: Responsive.isDesktop(context)? 24: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'assets/fonts/Raleway-SemiBold.ttf'
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height*0.04,),
         
  
  
      StaggeredGrid.count(
        crossAxisCount: Responsive.isMobile(context)? 1: Responsive.isTablet(context)? 2: 3,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
        axisDirection: AxisDirection.down,
        children: [
         ..._medicines.map(
                              (medicine)=>
             Container(
              margin: const EdgeInsets.only(
                  top: 10, left: 27, right: 27, bottom: 15),
              child: Material(
                elevation: 10,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                            title: SizedBox(
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Text(
                                  medicine.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text("Quantity: "),
                                Text(
                                  medicine.qty,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),

                        ),
                        Container(
                          height: 200,
                          margin: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                            bottom: 0,
                          ),
                          child: ImageNetwork(
                            image: medicine.pictureLink,
                            height: height*0.25,
                            width: width*0.25,
                            fitWeb: BoxFitWeb.fill,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(24)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Text(
                            medicine.description,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              // letterSpacing: 1.1,
                            ),
                          ),
                        ),
                        
                        SizedBox(height: height*0.04,),
                      ],
                    )),
              ),
            )
          ).toList()
        ],
      )
    
  

        ],
      ),
    );
  }

  Container appBar(
     {dynamic backgroundColor= kLabelColor}
    
  ) {
    
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
   
    return Container(
      height: 50,
      
      margin: const EdgeInsets.only(
        top: 5,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
       
    //        gradient: LinearGradient(
    //           colors: <Color>[
    //             kLabelColor,
    //         kBgColor, // yellow sun
          
    //        // blue sky
    // ],
    //         ),
           
        
          color: kPrimaryColor,
           borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
           
    // gradient: LinearGradient(
    //   colors: [kDarkBlackColor, kPrimaryColor, kDarkBlackColor])
  
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Row(
             // ignore: prefer_const_literals_to_create_immutables
             children: [
             
               Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                
                
                child: Text(
                  "Medicine Platform",
                  style: TextStyle(
                    fontSize: Responsive.isDesktop(context)? 30: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'assets/fonts/Raleway-SemiBold.ttf'
                  ),
                ),
                       ),
                       
             ],
           ),
        ],
      ),
    );
  }
}
