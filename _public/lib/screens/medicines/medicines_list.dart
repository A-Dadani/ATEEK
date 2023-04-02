import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/constants.dart';
import 'package:news/controllers/MenuController.dart';
import 'package:get/get.dart';
import 'package:news/responsive.dart';
import 'package:news/screens/main/components/side_menu.dart';
import 'package:news/screens/main/components/header.dart';
import 'package:news/screens/home/components/sidebar_container.dart';
import 'package:news/screens/pharmacies_list/pharmacies_list.dart';
import 'package:image_network/image_network.dart';

class Medicine {
  final String pictureLink;
  final String productID;
  final String name;
  final String description;
  final String priceDH;
  final String ownerID;
  final String qty;

  Medicine({
    @required this.pictureLink,
    @required this.productID,
    @required this.name,
    @required this.description,
    @required this.priceDH,
    @required this.ownerID,
    @required this.qty,
  });
}

class Medicines extends StatefulWidget {
  final String selectedPharmacy;
  final String selectedCity;

  Medicines(
      {Key key,
      @required this.selectedPharmacy,
      @required this.selectedCity // added this line
      })
      : super(key: key);

  @override
  _MedicinesState createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  final MenuControllerN _controller = Get.put(MenuControllerN());
  List<Medicine> _medicines = [];

  @override
  void initState() {
    super.initState();
    // Call the function to get the medicines list
    _getMedicines();
  }

  Future<void> _getMedicines() async {
    try {
      final URL = "localhost:5000";
      final response = await http.get(Uri.parse(
          '$URL/api/v0/pharmacies/${widget.selectedPharmacy}/allProducts'));
      if (response.statusCode == 200) {
        setState(() {
          // Parse the response and update the medicines list
          final List<dynamic> data = jsonDecode(response.body);
          _medicines = data
              .map((item) => Medicine(
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
      } else {
        throw Exception('Failed to load medicines');
      }
    } catch (err) {
      print(err);
      print('hello');
    }
  }

  @override
  Widget build(BuildContext context) {
     double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
        key: _controller.scaffoldkey,
        drawer: SideMenu(),
        body: SingleChildScrollView(
            child: Column(children: [
          Header(),
          Container(
              padding: EdgeInsets.all(kDefaultPadding),
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              child: SafeArea(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        ..._medicines
                            .map(
                              (medicine) => SizedBox(
                                width: 390,
                                child: SidebarContainer(
                                  title: RichText(text:
                                   TextSpan(text:
                                  medicine.name, style: TextStyle(fontSize: 20, color: kDarkBlackColor),
                                  children: [TextSpan(text: ' (${medicine.priceDH}DHs)', style: TextStyle(fontSize: 15, color: Colors.grey[800]))])),
                                  child: Column(
                                    children: [
                                      Container(
                                                        height: 200,
                                                        margin: const EdgeInsets.only(
                                                          top: 10,
                                                          left: 10,
                                                          right: 10,
                                                          bottom: 0,
                                                        ),
                                                        child: ImageNetwork( //
                                                          image: medicine.pictureLink,
                                                          width: 330,
                                                          height: 200,
                                                          fitWeb: BoxFitWeb.fill,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          
                                                          borderRadius: const BorderRadius.all(
                                Radius.circular(24)),
                                                        ),
                                                      ),
                                      SizedBox(height: 10),
                                    
                                      Text(medicine.description, style: TextStyle(fontSize: 17,),),
                                      SizedBox(height: height*0.04,),
                                       Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              height: height*0.07,
                              child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.production_quantity_limits_outlined),
                              label: Text("Add to Cart"),
                              
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                              textStyle: TextStyle(fontSize: 15),
                              
                              ),

                              
                            ),
                            ),
                             SizedBox(height: height*0.04,),

                          ],
                        ),
                                      
                                      
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),

                  if (!Responsive.isMobile(context)) SizedBox(width: 7),
                  // Sidebar
                  if (!Responsive.isMobile(context))
                    Expanded(
                      child: Column(
                        children: [
                          Pharmacies(
                            selectedCity: widget.selectedCity,
                          ),
                          SizedBox(height: kDefaultPadding),
                          //RecentPosts(),
                        ],
                      ),
                    ),
                ],
              )))
        ])));
  }
}
