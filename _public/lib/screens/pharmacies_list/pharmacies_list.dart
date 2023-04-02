import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/screens/medicines/medicines_list.dart';
import '../../../constants.dart';
import 'package:news/screens/home/components/sidebar_container.dart';
/* import 'package:news/screens/medicines/medicine_screen.dart';
import 'package:news/screens/pharmacies_list/pharmacies.dart'; */

class Pharmacies extends StatefulWidget {
  final String selectedCity;
  Pharmacies({Key key, @required this.selectedCity}) : super(key: key);

  @override
  _PharmaciesState createState() => _PharmaciesState();
}

class _PharmaciesState extends State<Pharmacies> {
  List<PharmacyData> _pharmacyList = [];
  Future<List<PharmacyData>> _retPharmaciesList() async {
    final response = await http.get(
      Uri.parse(
          'localhost:5000/api/v0/pharmacies/getByCity/${widget.selectedCity}'),
    );
    if (response.statusCode == 200) {
      try {
        final jsonData =
            jsonDecode(response.body) as List; //print(response.body);
        //print(jsonData);
        _pharmacyList = jsonData
            .map((pharmacyData) => PharmacyData.fromJson(pharmacyData))
            .toList();
      } catch (error) {
        print(error);
      }
    }
    if (response.statusCode != 200) {
      throw Exception('Failed to load pharmacies list');
    }
    return _pharmacyList;
  }

  @override
  void initState() {
    super.initState();
    //_getPharmaciesList();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILDING WIDGET");
    return SidebarContainer(
      title: RichText(text: TextSpan(text:'Nearby Pharmacies', style: TextStyle(fontSize: 30, color: kDarkBlackColor))),
      child: FutureBuilder(
        future: _retPharmaciesList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PharmacyData>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a progress indicator while the data is being loaded.
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            _pharmacyList = snapshot.data;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _pharmacyList
                  .map((pharmacyData) => Pharmacy(
                      title: RichText(
                        text: TextSpan(
                          text: pharmacyData.name,
                          style: TextStyle(
                              color: kDarkBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                          children: [
                            TextSpan(
                                text: '\nNight Shift: ',
                                style: TextStyle(
                                    color: kDarkBlackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                children: [
                                  TextSpan(
                                    text: (pharmacyData.enGarde)
                                        ? ' On Duty'
                                        : ' Inactive',
                                    style: TextStyle(
                                        color: (pharmacyData.enGarde)
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 17),
                                  )
                                ]),
                          ],
                        ),
                      ),
                      onPress: () async {
                        // Handle successful response

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Medicines(
                              selectedPharmacy: pharmacyData.id,
                              selectedCity: widget.selectedCity,
                            ),
                          ),
                        );
                      }))
                  .toList(),
            );
          } else {
            // Display an error message if the data failed to load.
            return Center(
              child: Text('Failed to load pharmacies list.'),
            );
          }
        },
      ),
    );
  }
}

class PharmacyData {
  final String id;
  final String pharmacyAddressLN1;
  final String pharmacyAddressLN2;
  final String ownerID;
  final bool enGarde;
  final String city;
  final String name;
  final String phoneNo;
  final String countryCode;
  final String postalCode;
  final double latitude;
  final double longitude;

  PharmacyData(
      {@required this.id,
      @required this.pharmacyAddressLN1,
      @required this.pharmacyAddressLN2,
      @required this.ownerID,
      @required this.enGarde,
      @required this.city,
      @required this.name,
      @required this.phoneNo,
      @required this.countryCode,
      @required this.postalCode,
      @required this.latitude,
      @required this.longitude});

  factory PharmacyData.fromJson(Map<String, dynamic> json) {
    return PharmacyData(
        id: json['ID'],
        pharmacyAddressLN1: json['pharmacyAddressLN1'],
        pharmacyAddressLN2: json['pharmacyAddressLN2'],
        ownerID: json['ownerID'],
        enGarde: json['enGarde'],
        city: json['city'],
        name: json['name'],
        phoneNo: json['phoneNo'],
        countryCode: json['countryCode'],
        postalCode: json['postalCode'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }
}

class Pharmacy extends StatelessWidget {
  final RichText title;
  final VoidCallback onPress;

  const Pharmacy({
    Key key,
    @required this.title,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
      child: TextButton.icon(
        onPressed: onPress,
        icon: Icon(
          Icons.local_pharmacy,
          color: kDarkBlackColor,
          size: 30,
        ), // Add the pharmacy icon here
        label: title,
      ),
    );
  }
}
