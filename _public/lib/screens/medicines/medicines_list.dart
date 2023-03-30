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

class Medicine {
  /* final String imageUrl; */
  final String productID;
  final String name;
  final String description;
  final String priceDH;
  final String ownerID;
  final String qty;

  Medicine({
    /* @required this.imageUrl, */
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
      final response = await http.get(Uri.parse(
          'https://prairie-lying-bass.glitch.me/api/v0/pharmacies/${widget.selectedPharmacy}/allProducts'));
      if (response.statusCode == 200) {
        setState(() {
          // Parse the response and update the medicines list
          final List<dynamic> data = jsonDecode(response.body);
          _medicines = data
              .map((item) => Medicine(
                    /* imageUrl: item['imageUrl'], */
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
                                  title: medicine.name,
                                  child: Column(
                                    children: [
                                      /* Image.network(medicine.imageUrl), */
                                      SizedBox(height: 10),
                                      Text(medicine.description),
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
