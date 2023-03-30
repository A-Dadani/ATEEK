import 'package:flutter/material.dart';
import 'package:news/constants.dart';
import 'package:news/screens/map/maps.dart';
import 'package:news/screens/maps/my_state.dart';
import 'package:get/get.dart';
import 'package:news/responsive.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/* import 'package:news/controllers/MenuController.dart';

import 'package:news/screens/main/components/side_menu.dart';
import 'package:news/screens/main/components/header.dart'; */

import 'package:news/screens/pharmacies_list/pharmacies_list.dart';
//import 'package:news/screens/medicines/globals.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool pharmacyIsVisible = false;
  String pharmacyMed;
  String countryValue;
  String stateValue;
  String cityValue;
  Set<Marker> _markers = {};

  final MyController myController = Get.put(MyController());
  AnimationController _animationController;

  Animation<Offset> _slideAnimation2;

  final CarouselController buttonCarouselController = CarouselController();

  GoogleMapController mapController;
  var list = <String>['1', '2'];
  LatLng _center;

  String _address = '';
  Map<String, dynamic> _latLong;

  Future<void> _getLatLongFromAddress() async {
    /* final apiKey = 'AIzaSyBTUpBUtgu25pJI0woosMuUX9pBJ4qqynI'; */
    final endpoint =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$_address&key=AIzaSyBTUpBUtgu25pJI0woosMuUX9pBJ4qqynI';
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'];

      if (results.isNotEmpty) {
        final result = results[0];
        if (result.containsKey('geometry')) {
          final geometry = result['geometry'];
          if (geometry.containsKey('location')) {
            final location = geometry['location'];
            setState(() {
              _latLong = {
                'latitude': location['lat'],
                'longitude': location['lng'],
              };
            });
          } else {
            setState(() {
              _latLong = null;
            });
          }
        } else {
          setState(() {
            _latLong = null;
          });
        }
      } else {
        setState(() {
          _latLong = null;
        });
      }
    } else {
      setState(() {
        _latLong = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _slideAnimation2 = Tween<Offset>(
      begin: Offset(0.7, 1.0),
      end: Offset(0, -2),
    ).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          // Set opacity to 1 when animation is playing
          _opacity = 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!Responsive.isMobile(context)) SizedBox(width: width * 0.06),
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: width / 2.5,
                        child: Column(children: [
                          CarouselSlider(
                            items: list.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Column(
                                      children: [
                                        //SizedBox(height: height * 0.04),
                                        Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.white,
                                            ),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                1.25,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.1,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: i == '1'
                                                      ? Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.04),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        kDefaultPadding),
                                                                child: Text(
                                                                  "Pharmacies' location !",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        25,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                'assets/video_page.gif',
                                                                height: height,
                                                                width: width,
                                                              )),
                                                            ),
                                                            Expanded(
                                                              flex: 7,
                                                              child: Container(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                4,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            SelectState(
                                                                              style: TextStyle(),
                                                                              onCountryChanged: (value) {
                                                                                setState(() {
                                                                                  countryValue = value;
                                                                                });
                                                                              },
                                                                              onStateChanged: (value) {
                                                                                setState(() {
                                                                                  stateValue = value;
                                                                                });
                                                                              },
                                                                              onCityChanged: (value) {
                                                                                setState(() {
                                                                                  cityValue = value;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ],
                                                                        )),

                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                        child:
                                                                            Text(
                                                                          "We will get you all the nearby working pharmacies",
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontFamily:
                                                                                'Raleway',
                                                                            height:
                                                                                1.5,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    //SizedBox(height: 12),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          if (countryValue !=
                                                                              null) {
                                                                            buttonCarouselController.nextPage(
                                                                                duration: Duration(milliseconds: 300),
                                                                                curve: Curves.linear);
                                                                            pharmacyIsVisible =
                                                                                true;

                                                                            if (cityValue !=
                                                                                null) {
                                                                              _address = ' $countryValue, $stateValue, $cityValue';
                                                                            } else if (stateValue !=
                                                                                null) {
                                                                              _address = ' $countryValue, $stateValue';
                                                                            } else {
                                                                              _address = ' $countryValue';
                                                                            }

                                                                            if (cityValue ==
                                                                                null) {
                                                                              cityValue = stateValue;
                                                                              if (stateValue == null) {
                                                                                cityValue = countryValue;
                                                                              }
                                                                            }

                                                                            print('country selected is $_address');
                                                                            _getLatLongFromAddress();
                                                                            _animationController.forward();
                                                                            if (_latLong !=
                                                                                null) {
                                                                              _center = LatLng(
                                                                                _latLong['latitude'].toDouble(),
                                                                                _latLong['longitude'].toDouble(),
                                                                              );
                                                                            }
                                                                          }
                                                                        },
                                                                        style: ElevatedButton.styleFrom(
                                                                            minimumSize:
                                                                                Size(100, 50)),
                                                                        child: Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: SizedBox(
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 2),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : i == '2'
                                                          ? Column(
                                                              children: [
                                                                if (_latLong !=
                                                                    null)
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Latitude: ${_latLong['latitude']}'),
                                                                      Text(
                                                                          'Longitude: ${_latLong['longitude']}'),
                                                                      SizedBox(
                                                                          height:
                                                                              20),
                                                                      Container(
                                                                          height:
                                                                              350,
                                                                          child:
                                                                              MapScreen(
                                                                            selectedCity:
                                                                                cityValue,
                                                                            latLong:
                                                                                _latLong,
                                                                          )),
                                                                    ],
                                                                  ),
                                                                SizedBox(
                                                                  width: 100,
                                                                  height: 50,
                                                                  child:
                                                                      Scaffold(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    floatingActionButton:
                                                                        FloatingActionButton
                                                                            .large(
                                                                      onPressed: () => buttonCarouselController.previousPage(
                                                                          duration: Duration(
                                                                              milliseconds:
                                                                                  300),
                                                                          curve:
                                                                              Curves.linear),
                                                                      backgroundColor:
                                                                          kPrimaryColor,
                                                                      //shape: BeveledRectangleBorder(),
                                                                      child: Icon(
                                                                          Icons
                                                                              .refresh_outlined),
                                                                    ),
                                                                    floatingActionButtonLocation:
                                                                        FloatingActionButtonLocation
                                                                            .centerDocked,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : Container(),
                                                ),
                                              ],
                                            )),
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
                              aspectRatio: 16 / 9,
                              height: height / 1.1,
                              scrollPhysics: NeverScrollableScrollPhysics(),
                            ),
                          ),
                        ]),
                      ),
                      (_opacity == 1.0)
                          ? SizedBox(width: width * 0.1)
                          : SizedBox(width: width * 0.04),
                      (_opacity == 1.0)
                          ? Opacity(
                              // Wrap the second SlideTransition with Opacity
                              opacity: _opacity,
                              child: Expanded(
                                  child: SizedBox(
                                      width: width / 4,
                                      child: Pharmacies(
                                        selectedCity: cityValue,
                                      ))),
                            )
                          : SizedBox(
                              child: Image.asset('assets/images/Home_pic.png'),
                              width: width / 2.5,
                              height: height / 1.1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        if (Responsive.isMobile(context))
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Column(children: [
                  CarouselSlider(
                    items: list.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Center(
                            child: Column(
                              children: [
                                //SizedBox(height: height * 0.04),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    height: MediaQuery.of(context).size.height /
                                        1.2,
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: i == '1'
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.04),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            vertical:
                                                                kDefaultPadding),
                                                        child: Text(
                                                          "Pharmacies' location !",
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Center(
                                                          child: Image.asset(
                                                        'assets/video_page.gif',
                                                        height: height,
                                                        width: width,
                                                      )),
                                                    ),
                                                    Expanded(
                                                      flex: 7,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    1.25,
                                                                child: Column(
                                                                  children: [
                                                                    SelectState(
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                      onCountryChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          countryValue =
                                                                              value;
                                                                        });
                                                                      },
                                                                      onStateChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          stateValue =
                                                                              value;
                                                                        });
                                                                      },
                                                                      onCityChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          cityValue =
                                                                              value;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ],
                                                                )),

                                                            Expanded(
                                                              flex: 2,
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        kDefaultPadding),
                                                                child: Text(
                                                                  "We will get you all the nearby working pharmacies",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontFamily:
                                                                        'Raleway',
                                                                    height: 1.5,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            //SizedBox(height: 12),
                                                            Expanded(
                                                              flex: 1,
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
                                                                  if (countryValue !=
                                                                      null) {
                                                                    buttonCarouselController.nextPage(
                                                                        duration: Duration(
                                                                            milliseconds:
                                                                                300),
                                                                        curve: Curves
                                                                            .linear);
                                                                    pharmacyIsVisible =
                                                                        true;

                                                                    if (cityValue !=
                                                                        null) {
                                                                      _address =
                                                                          ' $countryValue, $stateValue, $cityValue';
                                                                    } else if (stateValue !=
                                                                        null) {
                                                                      _address =
                                                                          ' $countryValue, $stateValue';
                                                                    } else {
                                                                      _address =
                                                                          ' $countryValue';
                                                                    }

                                                                    if (cityValue ==
                                                                        null) {
                                                                      cityValue =
                                                                          stateValue;
                                                                      if (stateValue ==
                                                                          null) {
                                                                        cityValue =
                                                                            countryValue;
                                                                      }
                                                                    }

                                                                    print(
                                                                        'country selected is $_address');
                                                                    _getLatLongFromAddress();

                                                                    if (_latLong !=
                                                                        null) {
                                                                      _center =
                                                                          LatLng(
                                                                        _latLong['latitude']
                                                                            .toDouble(),
                                                                        _latLong['longitude']
                                                                            .toDouble(),
                                                                      );
                                                                    }
                                                                  }
                                                                },
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        minimumSize: Size(
                                                                            100,
                                                                            50)),
                                                                child: Text(
                                                                    'Confirm'),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      2),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : i == '2'
                                                  ? Column(
                                                      children: [
                                                        if (_latLong != null)
                                                          Column(
                                                            children: [
                                                              Text(
                                                                  'Latitude: ${_latLong['latitude']}'),
                                                              Text(
                                                                  'Longitude: ${_latLong['longitude']}'),
                                                              SizedBox(
                                                                  height: 20),
                                                              Container(
                                                                  height: 400,
                                                                  child:
                                                                      MapScreen(
                                                                    selectedCity:
                                                                        cityValue,
                                                                    latLong:
                                                                        _latLong,
                                                                  )),
                                                            ],
                                                          ),
                                                        SizedBox(
                                                          width: 100,
                                                          height: 50,
                                                          child: Scaffold(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            floatingActionButton:
                                                                FloatingActionButton
                                                                    .large(
                                                              onPressed: () => buttonCarouselController.previousPage(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .linear),
                                                              backgroundColor:
                                                                  kPrimaryColor,
                                                              //shape: BeveledRectangleBorder(),
                                                              child: Icon(Icons
                                                                  .refresh_outlined),
                                                            ),
                                                            floatingActionButtonLocation:
                                                                FloatingActionButtonLocation
                                                                    .endTop,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                        ),
                                      ],
                                    )),
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
                      aspectRatio: 16 / 9,
                      height: height,
                      scrollPhysics: NeverScrollableScrollPhysics(),
                    ),
                  ),
                ]),
                SizedBox(height: kDefaultPadding / 4),
                if (pharmacyIsVisible) Pharmacies(selectedCity: cityValue),
              ],
            ),
          ),
      ],
    );
  }
}
