import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:news/constants.dart';

class MapScreen extends StatefulWidget {
  final String selectedCity;
  final Map<String, dynamic> latLong;
  MapScreen({Key key, @required this.selectedCity, @required this.latLong})
      : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  BitmapDescriptor pharmacyMarker;
  Location _location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _currentLocation;
  GoogleMapController _mapController;
  Marker _currentLocationMarker;

  List<PharmacyData> _pharmacyList = [];
  Future<List<PharmacyData>> _retPharmaciesList() async {
    final response = await http.get(
      Uri.parse(
          'http://localhost:5000/api/v0/pharmacies/getByCity/${widget.selectedCity}'),
    );
    pharmacyMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/pharmacy_marker.png',
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
    _checkLocationPermission();
    //_getPharmaciesList();
  }

  Future<void> _checkLocationPermission() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    _currentLocation = await _location.getLocation();
    setState(() {
      _currentLocationMarker = Marker(
          markerId: MarkerId('currentLocation'),
          position:
              LatLng(_currentLocation.latitude, _currentLocation.longitude),
          infoWindow: InfoWindow(title: 'Current Location'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: FutureBuilder(
            future: _retPharmaciesList(),
            builder: (BuildContext context,
                AsyncSnapshot<List<PharmacyData>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                _pharmacyList = snapshot.data;

                return GoogleMap(
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.latLong['latitude'],
                        widget.latLong['longitude']),
                    zoom: 12.0,
                  ),
                  markers: Set<Marker>.from(
                      _pharmacyList.map((pharmacyData) => Marker(
                            markerId: MarkerId(pharmacyData.id),
                            position: LatLng(
                                pharmacyData.latitude, pharmacyData.longitude),
                            onTap: () {},
                            infoWindow: InfoWindow(
                              title: pharmacyData.name,
                              snippet: pharmacyData.pharmacyAddressLN1 +
                                  '\n' +
                                  pharmacyData.pharmacyAddressLN2,
                            ),
                            icon: pharmacyMarker,
                          ))),
                  myLocationEnabled: true, // Enable the my location button
                  myLocationButtonEnabled: true,
                  // Enable the my location button
                );
              } else {
                return Center(
                  child: Text('Failed to load pharmacies list.'),
                );
              }
            },
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (_currentLocation != null) {
                _mapController.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: LatLng(_currentLocation.latitude,
                            _currentLocation.longitude),
                        zoom: 12.0)));
              }
            },
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.my_location),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        ),
      ],
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
    //Map<String, double> geoLoc = {};
    //(json['geoLoc'] as Map<String, dynamic>).forEach((key, value) {
    //  geoLoc[key] = double.parse(value);
    //  //print(double.parse(value).runtimeType);
    //});
    //(json['city'] == cityValue || json['city'] == stateValue);
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
