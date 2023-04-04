import 'package:file_picker/file_picker.dart';

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news/responsive.dart';
import 'package:news/constants.dart';
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class CarouselDemo extends StatefulWidget {
  @override
  State<CarouselDemo> createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  final CarouselController buttonCarouselController = CarouselController();
  final formKey = GlobalKey<FormState>();
  GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  Set<Marker> _markers = {};
  void _onMapTap(LatLng location) {
    print(
        "Tapped location - Latitude: ${location.latitude}, Longitude: ${location.longitude}");
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(location.toString()),
          position: location,
        ),
      );
    });
  }

  Uint8List _selectedFile;

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      print(result.files.first.bytes);
      setState(() {
        //_selectedFile = File(result.files.first.bytes);
      });
    }
  }

  Future<void> _uploadFile() async {
    //if (_selectedFile == null) {
    //  return;
    //}
//
    //final url = Uri.parse('https://prairi-lying-bass.glitch.me/api/v0/auth/signup');
    //final request = http.MultipartRequest('POST', url);
    //// request.fields['name'] = 'nmnm';
    //final fileStream = http.ByteStream(_selectedFile.openRead());
    //final fileLength = await _selectedFile.length();
    //final fileName = path.basename(_selectedFile.path);
//
    //final multipartFile = http.MultipartFile(
    //  'userAvatar',
    //  fileStream,
    //  fileLength,
    //  filename: fileName,
    //);
    //final multipartFile0 = http.MultipartFile(
    //  'legalDocs',
    //  fileStream,
    //  fileLength,
    //  filename: fileName,
    //);
//
//
//
    //request.files.add(multipartFile);
    //request.files.add(multipartFile0);
//
    //final response = await request.send();
    //if (response.statusCode == 201) {
    //  print('File uploaded successfully!');
    //} else {
    //  print('File upload failed with status ${response.statusCode}.');
    //}
  }

  Future<void> postData() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://localhost:5000/api/v0/auth/signup'));

    // Add a text field to the request
    request.fields['email'] = 'John Doe';
    request.fields['password'] = 'John Doe';
    request.fields['firstName'] = 'John Doe';
    request.fields['lastName'] = 'John Doe';
    request.fields['pharmacyPhoneNO'] = 'John Doe';
    request.fields['latGeoLoc'] = 'John Doe';
    request.fields['longGeoLoc'] = 'John Doe';
    request.fields['pharmacyName'] = 'John Doe';
    request.fields['pharmacyAddressLN1'] = 'John Doe';
    request.fields['pharmacyAddressLN2'] = 'John Doe';
    request.fields['city'] = 'John Doe';
    request.fields['postalCode'] = 'John Doe';
    request.fields['countryCode'] = 'John Doe';

    // Add an image to the request
    // var imageFile = File('path/to/image.jpg');
    // request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    // // Add multiple files to the request
    // List<File> files = [File('path/to/file1.pdf'), File('path/to/file2.pdf')];
    // for (var file in files) {
    //   request.files.add(await http.MultipartFile.fromPath('files[]', file.path));
    // }

    // Send the request
    var response = await request.send();

    // Get the response as a string
    var responseString = await response.stream.bytesToString();

    // Decode the JSON response
    var jsonResponse = jsonDecode(responseString);

    // Print the response
    print(jsonResponse);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: [1, 2, 3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: height * 0.04),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                width: Responsive.isDesktop(context)
                                    ? width * 0.6
                                    : width * 0.9,
                                height: Responsive.isDesktop(context)
                                    ? height * 0.95
                                    : height * 1.75,
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 16,
                                          child: Container(
                                              child: Column(
                                            children: [
                                              Text(
                                                '$i/3',
                                                style: TextStyle(
                                                    fontSize:
                                                        Responsive.isDesktop(
                                                                context)
                                                            ? 16.0
                                                            : 12),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: Responsive.isDesktop(
                                                            context)
                                                        ? 100
                                                        : 60,
                                                    height:
                                                        Responsive.isDesktop(
                                                                context)
                                                            ? 15
                                                            : 10,
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        color: kPrimaryColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        50),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        50)),
                                                        border: Border.all(
                                                          color: kPrimaryColor,
                                                          width: 2,
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  //Center(child: SizedBox(width: 3,)),

                                                  SizedBox(
                                                    width: Responsive.isDesktop(
                                                            context)
                                                        ? 100
                                                        : 60,
                                                    height:
                                                        Responsive.isDesktop(
                                                                context)
                                                            ? 15
                                                            : 10,
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        color: i == 2 || i == 3
                                                            ? kPrimaryColor
                                                            : Colors.white,
                                                        border: Border.all(
                                                          color: kPrimaryColor,
                                                          width: 2,
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  //Center(child: SizedBox(width: 3,)),

                                                  SizedBox(
                                                      width:
                                                          Responsive.isDesktop(
                                                                  context)
                                                              ? 100
                                                              : 60,
                                                      height:
                                                          Responsive.isDesktop(
                                                                  context)
                                                              ? 15
                                                              : 10,
                                                      child: DecoratedBox(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: i == 3
                                                              ? kPrimaryColor
                                                              : Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          50),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          50)),
                                                          border: Border.all(
                                                            color:
                                                                kPrimaryColor,
                                                            width: 2,
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              SizedBox(height: height * 0.02),
                                              i == 1
                                                  ? SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Center(
                                                              child: Image.asset(
                                                                  'assets/images/favicon.png',
                                                                  width: width *
                                                                      0.04,
                                                                  height:
                                                                      height *
                                                                          0.06)),
                                                          SizedBox(
                                                              height: height *
                                                                  0.02),
                                                          Center(
                                                            child: RichText(
                                                                text: TextSpan(
                                                                    children: [
                                                                  TextSpan(
                                                                      text:
                                                                          'Regestration Form',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          decorationColor:
                                                                              kPrimaryColor,
                                                                          fontSize: Responsive.isDesktop(context)
                                                                              ? 25.0
                                                                              : 20,
                                                                          fontFamily:
                                                                              'assets/fonts/Raleway-SemiBold.ttf'))
                                                                ])),
                                                          ),
                                                          SizedBox(
                                                              height: height *
                                                                  0.07),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                width: width *
                                                                    0.03,
                                                              ),
                                                              RichText(
                                                                  text: TextSpan(
                                                                      children: [
                                                                    TextSpan(
                                                                        text:
                                                                            'Personal Information:',
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w600,
                                                                            fontSize: Responsive.isDesktop(context)
                                                                                ? 15.0
                                                                                : 13,
                                                                            color:
                                                                                kPrimaryColor,
                                                                            fontFamily:
                                                                                'assets/fonts/Raleway-SemiBold.ttf'))
                                                                  ])),
                                                            ],
                                                          ),
                                                          Responsive.isDesktop(
                                                                  context)
                                                              ? Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.03,
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          SizedBox(
                                                                        width: Responsive.isMobile(context)
                                                                            ? width *
                                                                                0.6
                                                                            : width *
                                                                                0.15,
                                                                        height:
                                                                            90,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                          child:
                                                                              TextFormField(
                                                                            keyboardType:
                                                                                TextInputType.name,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            cursorColor:
                                                                                Colors.black,
                                                                            onSaved:
                                                                                (text) {},
                                                                            decoration:
                                                                                InputDecoration(
                                                                              focusedBorder: UnderlineInputBorder(
                                                                                borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                              ),
                                                                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                              labelText: "First Name",
                                                                              labelStyle: TextStyle(
                                                                                color: kLabelColor,
                                                                                fontSize: 15,
                                                                              ),
                                                                              prefixIcon: Padding(
                                                                                padding: const EdgeInsets.all(kDefaultPadding),
                                                                                child: Icon(Icons.person, color: kPrimaryColor, size: 18),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: width *
                                                                            0.08),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          SizedBox(
                                                                        width: Responsive.isMobile(context)
                                                                            ? width *
                                                                                0.6
                                                                            : width *
                                                                                0.13,
                                                                        height:
                                                                            90,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                          child:
                                                                              TextFormField(
                                                                            keyboardType:
                                                                                TextInputType.name,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            cursorColor:
                                                                                Colors.black,
                                                                            onSaved:
                                                                                (text) {},
                                                                            decoration:
                                                                                InputDecoration(
                                                                              focusedBorder: UnderlineInputBorder(
                                                                                borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                              ),
                                                                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                              labelText: "Last Name",
                                                                              labelStyle: TextStyle(
                                                                                color: kLabelColor,
                                                                                fontSize: 15,
                                                                              ),
                                                                              prefixIcon: Padding(
                                                                                padding: const EdgeInsets.all(kDefaultPadding),
                                                                                child: Icon(
                                                                                  Icons.person,
                                                                                  color: kPrimaryColor,
                                                                                  size: 18,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.03,
                                                                    )
                                                                  ],
                                                                )
                                                              : Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.02,
                                                                    ),
                                                                    SizedBox(
                                                                      width: Responsive.isMobile(
                                                                              context)
                                                                          ? width *
                                                                              0.6
                                                                          : width *
                                                                              0.15,
                                                                      height:
                                                                          90,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                        child:
                                                                            TextFormField(
                                                                          keyboardType:
                                                                              TextInputType.name,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          cursorColor:
                                                                              Colors.black,
                                                                          onSaved:
                                                                              (text) {},
                                                                          decoration:
                                                                              InputDecoration(
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                            labelText:
                                                                                "First Name",
                                                                            labelStyle:
                                                                                TextStyle(
                                                                              color: kLabelColor,
                                                                              fontSize: 15,
                                                                            ),
                                                                            prefixIcon:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(kDefaultPadding),
                                                                              child: Icon(Icons.person, color: kPrimaryColor, size: 18),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: Responsive.isMobile(
                                                                              context)
                                                                          ? width *
                                                                              0.6
                                                                          : width *
                                                                              0.13,
                                                                      height:
                                                                          90,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                        child:
                                                                            TextFormField(
                                                                          keyboardType:
                                                                              TextInputType.name,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          cursorColor:
                                                                              Colors.black,
                                                                          onSaved:
                                                                              (text) {},
                                                                          decoration:
                                                                              InputDecoration(
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                            labelText:
                                                                                "Last Name",
                                                                            labelStyle:
                                                                                TextStyle(
                                                                              color: kLabelColor,
                                                                              fontSize: 15,
                                                                            ),
                                                                            prefixIcon:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(kDefaultPadding),
                                                                              child: Icon(
                                                                                Icons.person,
                                                                                color: kPrimaryColor,
                                                                                size: 18,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.01,
                                                                    )
                                                                  ],
                                                                ),
                                                          Responsive.isDesktop(
                                                                  context)
                                                              ? Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.03,
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          SizedBox(
                                                                        width: Responsive.isMobile(context)
                                                                            ? width *
                                                                                0.6
                                                                            : width *
                                                                                0.15,
                                                                        height:
                                                                            90,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                          child:
                                                                              TextFormField(
                                                                            keyboardType:
                                                                                TextInputType.emailAddress,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            cursorColor:
                                                                                Colors.black,
                                                                            onSaved:
                                                                                (text) {},
                                                                            decoration:
                                                                                InputDecoration(
                                                                              focusedBorder: UnderlineInputBorder(
                                                                                borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                              ),
                                                                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                              labelText: "Email",
                                                                              labelStyle: TextStyle(
                                                                                color: kLabelColor,
                                                                                fontSize: 15,
                                                                              ),
                                                                              prefixIcon: Padding(
                                                                                padding: const EdgeInsets.all(kDefaultPadding),
                                                                                child: Icon(Icons.email, color: kPrimaryColor, size: 18),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: width *
                                                                            0.08),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          SizedBox(
                                                                        width: Responsive.isMobile(context)
                                                                            ? width *
                                                                                0.6
                                                                            : width *
                                                                                0.13,
                                                                        height:
                                                                            90,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                          child:
                                                                              TextFormField(
                                                                            keyboardType:
                                                                                TextInputType.visiblePassword,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            cursorColor:
                                                                                Colors.black,
                                                                            onSaved:
                                                                                (text) {},
                                                                            decoration:
                                                                                InputDecoration(
                                                                              focusedBorder: UnderlineInputBorder(
                                                                                borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                              ),
                                                                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                              labelText: "Password",
                                                                              labelStyle: TextStyle(
                                                                                color: kLabelColor,
                                                                                fontSize: 15,
                                                                              ),
                                                                              prefixIcon: Padding(
                                                                                padding: const EdgeInsets.all(kDefaultPadding),
                                                                                child: Icon(
                                                                                  Icons.lock,
                                                                                  color: kPrimaryColor,
                                                                                  size: 18,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: width *
                                                                            0.03)
                                                                  ],
                                                                )
                                                              : Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.03,
                                                                    ),
                                                                    SizedBox(
                                                                      width: Responsive.isMobile(
                                                                              context)
                                                                          ? width *
                                                                              0.6
                                                                          : width *
                                                                              0.15,
                                                                      height:
                                                                          90,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                        child:
                                                                            TextFormField(
                                                                          keyboardType:
                                                                              TextInputType.emailAddress,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          cursorColor:
                                                                              Colors.black,
                                                                          onSaved:
                                                                              (text) {},
                                                                          decoration:
                                                                              InputDecoration(
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                            labelText:
                                                                                "Email",
                                                                            labelStyle:
                                                                                TextStyle(
                                                                              color: kLabelColor,
                                                                              fontSize: 15,
                                                                            ),
                                                                            prefixIcon:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(kDefaultPadding),
                                                                              child: Icon(Icons.email, color: kPrimaryColor, size: 18),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: width *
                                                                            0.08),
                                                                    SizedBox(
                                                                      width: Responsive.isMobile(
                                                                              context)
                                                                          ? width *
                                                                              0.6
                                                                          : width *
                                                                              0.13,
                                                                      height:
                                                                          90,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                        child:
                                                                            TextFormField(
                                                                          keyboardType:
                                                                              TextInputType.visiblePassword,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          cursorColor:
                                                                              Colors.black,
                                                                          onSaved:
                                                                              (text) {},
                                                                          decoration:
                                                                              InputDecoration(
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                            labelText:
                                                                                "Password",
                                                                            labelStyle:
                                                                                TextStyle(
                                                                              color: kLabelColor,
                                                                              fontSize: 15,
                                                                            ),
                                                                            prefixIcon:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(kDefaultPadding),
                                                                              child: Icon(
                                                                                Icons.lock,
                                                                                color: kPrimaryColor,
                                                                                size: 18,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: width *
                                                                            0.03)
                                                                  ],
                                                                ),
                                                          Responsive.isDesktop(
                                                                  context)
                                                              ? Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.03,
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          SizedBox(
                                                                        width: Responsive.isMobile(context)
                                                                            ? width *
                                                                                0.6
                                                                            : width *
                                                                                0.15,
                                                                        height:
                                                                            90,
                                                                        child: Padding(
                                                                            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                            child: ElevatedButton(
                                                                                style: ButtonStyle(
                                                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(50.0),
                                                                                    )),
                                                                                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                                                      (Set<MaterialState> states) {
                                                                                        if (states.contains(MaterialState.pressed)) return kPrimaryColor;
                                                                                        return kPrimaryColor;
                                                                                      },
                                                                                    ),
                                                                                    side: MaterialStateProperty.all(BorderSide(color: kPrimaryColor, width: 1.5, style: BorderStyle.solid))),
                                                                                onPressed: _selectFile,
                                                                                child: Text(
                                                                                  "choose a picture",
                                                                                  style: TextStyle(color: Colors.white),
                                                                                ))),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: width *
                                                                            0.08),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          SizedBox(
                                                                        width: Responsive.isMobile(context)
                                                                            ? width *
                                                                                0.6
                                                                            : width *
                                                                                0.13,
                                                                        height:
                                                                            90,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                          child:
                                                                              TextFormField(
                                                                            keyboardType:
                                                                                TextInputType.visiblePassword,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            cursorColor:
                                                                                Colors.black,
                                                                            onSaved:
                                                                                (text) {},
                                                                            decoration:
                                                                                InputDecoration(
                                                                              focusedBorder: UnderlineInputBorder(
                                                                                borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                              ),
                                                                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                              labelText: "Confirm Password",
                                                                              labelStyle: TextStyle(
                                                                                color: kLabelColor,
                                                                                fontSize: 15,
                                                                              ),
                                                                              prefixIcon: Padding(
                                                                                padding: const EdgeInsets.all(kDefaultPadding),
                                                                                child: Icon(
                                                                                  Icons.lock,
                                                                                  color: kPrimaryColor,
                                                                                  size: 18,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.03,
                                                                    ),
                                                                  ],
                                                                )
                                                              : Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.03,
                                                                    ),
                                                                    SizedBox(
                                                                      width: Responsive.isMobile(
                                                                              context)
                                                                          ? width *
                                                                              0.6
                                                                          : width *
                                                                              0.15,
                                                                      height:
                                                                          90,
                                                                      child: Padding(
                                                                          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                          child: ElevatedButton(
                                                                              style: ButtonStyle(
                                                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                  )),
                                                                                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                                                    (Set<MaterialState> states) {
                                                                                      if (states.contains(MaterialState.pressed)) return kPrimaryColor;
                                                                                      return kPrimaryColor;
                                                                                    },
                                                                                  ),
                                                                                  side: MaterialStateProperty.all(BorderSide(color: kPrimaryColor, width: 1.5, style: BorderStyle.solid))),
                                                                              onPressed: _selectFile,
                                                                              child: Text(
                                                                                "choose a picture",
                                                                                style: TextStyle(color: Colors.white),
                                                                              ))),
                                                                    ),
                                                                    SizedBox(
                                                                        width: width *
                                                                            0.08),
                                                                    SizedBox(
                                                                      width: Responsive.isMobile(
                                                                              context)
                                                                          ? width *
                                                                              0.6
                                                                          : width *
                                                                              0.13,
                                                                      height:
                                                                          90,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                        child:
                                                                            TextFormField(
                                                                          keyboardType:
                                                                              TextInputType.visiblePassword,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          cursorColor:
                                                                              Colors.black,
                                                                          onSaved:
                                                                              (text) {},
                                                                          decoration:
                                                                              InputDecoration(
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                            labelText:
                                                                                "Confirm Password",
                                                                            labelStyle:
                                                                                TextStyle(
                                                                              color: kLabelColor,
                                                                              fontSize: 15,
                                                                            ),
                                                                            prefixIcon:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(kDefaultPadding),
                                                                              child: Icon(
                                                                                Icons.lock,
                                                                                color: kPrimaryColor,
                                                                                size: 18,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.03,
                                                                    ),
                                                                  ],
                                                                ),
                                                        ],
                                                      ),
                                                    )
                                                  : i == 2
                                                      ? SingleChildScrollView(
                                                          child: Container(
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                    height:
                                                                        height *
                                                                            0.07),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.03,
                                                                    ),
                                                                    RichText(
                                                                        text: TextSpan(
                                                                            children: [
                                                                          TextSpan(
                                                                              text: 'Pharmacy Information:',
                                                                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0, color: kPrimaryColor, fontFamily: 'assets/fonts/Raleway-SemiBold.ttf'))
                                                                        ])),
                                                                  ],
                                                                ),
                                                                Responsive.isDesktop(
                                                                        context)
                                                                    ? Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                SizedBox(
                                                                              width: Responsive.isMobile(context) ? width * 0.6 : width * 0.15,
                                                                              height: 90,
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                                child: TextFormField(
                                                                                  keyboardType: TextInputType.name,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  cursorColor: Colors.black,
                                                                                  onSaved: (text) {},
                                                                                  decoration: InputDecoration(
                                                                                    focusedBorder: UnderlineInputBorder(
                                                                                      borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                    ),
                                                                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                    labelText: "Pharmacy Name",
                                                                                    labelStyle: TextStyle(
                                                                                      color: kLabelColor,
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                    prefixIcon: Padding(
                                                                                      padding: const EdgeInsets.all(kDefaultPadding),
                                                                                      child: Icon(Icons.local_pharmacy, color: kPrimaryColor, size: 18),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: width * 0.08),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                SizedBox(
                                                                              width: Responsive.isMobile(context) ? width * 0.6 : width * 0.13,
                                                                              height: 90,
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                                child: TextFormField(
                                                                                  keyboardType: TextInputType.streetAddress,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  cursorColor: Colors.black,
                                                                                  onSaved: (text) {},
                                                                                  decoration: InputDecoration(
                                                                                    focusedBorder: UnderlineInputBorder(
                                                                                      borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                    ),
                                                                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                    labelText: "Pharmacy adress line 1",
                                                                                    labelStyle: TextStyle(
                                                                                      color: kLabelColor,
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                    prefixIcon: Padding(
                                                                                      padding: const EdgeInsets.all(kDefaultPadding),
                                                                                      child: Icon(
                                                                                        Icons.add_location_alt,
                                                                                        color: kPrimaryColor,
                                                                                        size: 18,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          )
                                                                        ],
                                                                      )
                                                                    : Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                          SizedBox(
                                                                            width: Responsive.isMobile(context)
                                                                                ? width * 0.6
                                                                                : width * 0.15,
                                                                            height:
                                                                                90,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                              child: TextFormField(
                                                                                keyboardType: TextInputType.name,
                                                                                textInputAction: TextInputAction.next,
                                                                                cursorColor: Colors.black,
                                                                                onSaved: (text) {},
                                                                                decoration: InputDecoration(
                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                    borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                  ),
                                                                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                  labelText: "Pharmacy Name",
                                                                                  labelStyle: TextStyle(
                                                                                    color: kLabelColor,
                                                                                    fontSize: 15,
                                                                                  ),
                                                                                  prefixIcon: Padding(
                                                                                    padding: const EdgeInsets.all(kDefaultPadding),
                                                                                    child: Icon(Icons.local_pharmacy, color: kPrimaryColor, size: 18),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: width * 0.08),
                                                                          SizedBox(
                                                                            width: Responsive.isMobile(context)
                                                                                ? width * 0.6
                                                                                : width * 0.13,
                                                                            height:
                                                                                90,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                              child: TextFormField(
                                                                                keyboardType: TextInputType.streetAddress,
                                                                                textInputAction: TextInputAction.next,
                                                                                cursorColor: Colors.black,
                                                                                onSaved: (text) {},
                                                                                decoration: InputDecoration(
                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                    borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                  ),
                                                                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                  labelText: "Pharmacy adress line 1",
                                                                                  labelStyle: TextStyle(
                                                                                    color: kLabelColor,
                                                                                    fontSize: 15,
                                                                                  ),
                                                                                  prefixIcon: Padding(
                                                                                    padding: const EdgeInsets.all(kDefaultPadding),
                                                                                    child: Icon(
                                                                                      Icons.add_location_alt,
                                                                                      color: kPrimaryColor,
                                                                                      size: 18,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          )
                                                                        ],
                                                                      ),
                                                                Responsive.isDesktop(
                                                                        context)
                                                                    ? Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                SizedBox(
                                                                              width: Responsive.isMobile(context) ? width * 0.6 : width * 0.15,
                                                                              height: 90,
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                                child: TextFormField(
                                                                                  keyboardType: TextInputType.streetAddress,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  cursorColor: Colors.black,
                                                                                  onSaved: (text) {},
                                                                                  decoration: InputDecoration(
                                                                                    focusedBorder: UnderlineInputBorder(
                                                                                      borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                    ),
                                                                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                    labelText: "Pharmacy Adress line 2",
                                                                                    labelStyle: TextStyle(
                                                                                      color: kLabelColor,
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                    prefixIcon: Padding(
                                                                                      padding: const EdgeInsets.all(kDefaultPadding),
                                                                                      child: Icon(Icons.add_location_alt, color: kPrimaryColor, size: 18),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: width * 0.08),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                SizedBox(
                                                                              width: Responsive.isMobile(context) ? width * 0.6 : width * 0.13,
                                                                              height: 90,
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                                child: TextFormField(
                                                                                  keyboardType: TextInputType.visiblePassword,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  cursorColor: Colors.black,
                                                                                  onSaved: (text) {},
                                                                                  decoration: InputDecoration(
                                                                                    focusedBorder: UnderlineInputBorder(
                                                                                      borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                    ),
                                                                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                    labelText: "country",
                                                                                    labelStyle: TextStyle(
                                                                                      color: kLabelColor,
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                    prefixIcon: Padding(
                                                                                      padding: const EdgeInsets.all(kDefaultPadding),
                                                                                      child: Icon(
                                                                                        Icons.mail,
                                                                                        color: kPrimaryColor,
                                                                                        size: 18,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          )
                                                                        ],
                                                                      )
                                                                    : Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                          SizedBox(
                                                                            width: Responsive.isMobile(context)
                                                                                ? width * 0.6
                                                                                : width * 0.15,
                                                                            height:
                                                                                90,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                              child: TextFormField(
                                                                                keyboardType: TextInputType.streetAddress,
                                                                                textInputAction: TextInputAction.next,
                                                                                cursorColor: Colors.black,
                                                                                onSaved: (text) {},
                                                                                decoration: InputDecoration(
                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                    borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                  ),
                                                                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                  labelText: "Pharmacy Adress line 2",
                                                                                  labelStyle: TextStyle(
                                                                                    color: kLabelColor,
                                                                                    fontSize: 15,
                                                                                  ),
                                                                                  prefixIcon: Padding(
                                                                                    padding: const EdgeInsets.all(kDefaultPadding),
                                                                                    child: Icon(Icons.add_location_alt, color: kPrimaryColor, size: 18),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: width * 0.08),
                                                                          SizedBox(
                                                                            width: Responsive.isMobile(context)
                                                                                ? width * 0.6
                                                                                : width * 0.13,
                                                                            height:
                                                                                90,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                              child: TextFormField(
                                                                                keyboardType: TextInputType.visiblePassword,
                                                                                textInputAction: TextInputAction.next,
                                                                                cursorColor: Colors.black,
                                                                                onSaved: (text) {},
                                                                                decoration: InputDecoration(
                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                    borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                  ),
                                                                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                  labelText: "country",
                                                                                  labelStyle: TextStyle(
                                                                                    color: kLabelColor,
                                                                                    fontSize: 15,
                                                                                  ),
                                                                                  prefixIcon: Padding(
                                                                                    padding: const EdgeInsets.all(kDefaultPadding),
                                                                                    child: Icon(
                                                                                      Icons.mail,
                                                                                      color: kPrimaryColor,
                                                                                      size: 18,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          )
                                                                        ],
                                                                      ),
                                                                Responsive.isDesktop(
                                                                        context)
                                                                    ? Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                SizedBox(
                                                                              width: Responsive.isMobile(context) ? width * 0.6 : width * 0.15,
                                                                              height: 90,
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                                child: TextFormField(
                                                                                  keyboardType: TextInputType.name,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  cursorColor: Colors.black,
                                                                                  onSaved: (text) {},
                                                                                  decoration: InputDecoration(
                                                                                    focusedBorder: UnderlineInputBorder(
                                                                                      borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                    ),
                                                                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                    labelText: "City",
                                                                                    labelStyle: TextStyle(
                                                                                      color: kLabelColor,
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                    prefixIcon: Padding(
                                                                                      padding: const EdgeInsets.all(kDefaultPadding),
                                                                                      child: Icon(Icons.location_city, color: kPrimaryColor, size: 18),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: width * 0.08),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                SizedBox(
                                                                              width: Responsive.isMobile(context) ? width * 0.6 : width * 0.13,
                                                                              height: 90,
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                                child: TextFormField(
                                                                                  keyboardType: TextInputType.number,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  cursorColor: Colors.black,
                                                                                  onSaved: (text) {},
                                                                                  decoration: InputDecoration(
                                                                                    focusedBorder: UnderlineInputBorder(
                                                                                      borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                    ),
                                                                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                    labelText: "Postal Code",
                                                                                    labelStyle: TextStyle(
                                                                                      color: kLabelColor,
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                    prefixIcon: Padding(
                                                                                      padding: const EdgeInsets.all(kDefaultPadding),
                                                                                      child: Icon(
                                                                                        Icons.numbers_rounded,
                                                                                        color: kPrimaryColor,
                                                                                        size: 18,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                        ],
                                                                      )
                                                                    : Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                          SizedBox(
                                                                            width: Responsive.isMobile(context)
                                                                                ? width * 0.6
                                                                                : width * 0.15,
                                                                            height:
                                                                                90,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                              child: TextFormField(
                                                                                keyboardType: TextInputType.name,
                                                                                textInputAction: TextInputAction.next,
                                                                                cursorColor: Colors.black,
                                                                                onSaved: (text) {},
                                                                                decoration: InputDecoration(
                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                    borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                  ),
                                                                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                  labelText: "City",
                                                                                  labelStyle: TextStyle(
                                                                                    color: kLabelColor,
                                                                                    fontSize: 15,
                                                                                  ),
                                                                                  prefixIcon: Padding(
                                                                                    padding: const EdgeInsets.all(kDefaultPadding),
                                                                                    child: Icon(Icons.location_city, color: kPrimaryColor, size: 18),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: width * 0.08),
                                                                          SizedBox(
                                                                            width: Responsive.isMobile(context)
                                                                                ? width * 0.6
                                                                                : width * 0.13,
                                                                            height:
                                                                                90,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                              child: TextFormField(
                                                                                keyboardType: TextInputType.number,
                                                                                textInputAction: TextInputAction.next,
                                                                                cursorColor: Colors.black,
                                                                                onSaved: (text) {},
                                                                                decoration: InputDecoration(
                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                    borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                  ),
                                                                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                  labelText: "Postal Code",
                                                                                  labelStyle: TextStyle(
                                                                                    color: kLabelColor,
                                                                                    fontSize: 15,
                                                                                  ),
                                                                                  prefixIcon: Padding(
                                                                                    padding: const EdgeInsets.all(kDefaultPadding),
                                                                                    child: Icon(
                                                                                      Icons.numbers_rounded,
                                                                                      color: kPrimaryColor,
                                                                                      size: 18,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                Responsive.isDesktop(
                                                                        context)
                                                                    ? Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                SizedBox(
                                                                              width: Responsive.isMobile(context) ? width * 0.6 : width * 0.15,
                                                                              height: 90,
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                                child: TextFormField(
                                                                                  keyboardType: TextInputType.phone,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  cursorColor: Colors.black,
                                                                                  onSaved: (text) {},
                                                                                  decoration: InputDecoration(
                                                                                    focusedBorder: UnderlineInputBorder(
                                                                                      borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                    ),
                                                                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                    labelText: "Phone Number",
                                                                                    labelStyle: TextStyle(
                                                                                      color: kLabelColor,
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                    prefixIcon: Padding(
                                                                                      padding: const EdgeInsets.all(kDefaultPadding),
                                                                                      child: Icon(Icons.phone, color: kPrimaryColor, size: 18),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: width * 0.08),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                SizedBox(
                                                                              width: Responsive.isMobile(context) ? width * 0.6 : width * 0.15,
                                                                              height: 90,
                                                                              child: Padding(
                                                                                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                                  child: ElevatedButton(
                                                                                      style: ButtonStyle(
                                                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(50.0),
                                                                                          )),
                                                                                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                                                            (Set<MaterialState> states) {
                                                                                              if (states.contains(MaterialState.pressed)) return kPrimaryColor;
                                                                                              return kPrimaryColor;
                                                                                            },
                                                                                          ),
                                                                                          side: MaterialStateProperty.all(BorderSide(color: kPrimaryColor, width: 1.5, style: BorderStyle.solid))),
                                                                                      onPressed: _selectFile,
                                                                                      child: Text(
                                                                                        "file",
                                                                                        style: TextStyle(color: Colors.white),
                                                                                      ))),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                        ],
                                                                      )
                                                                    : Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                          SizedBox(
                                                                            width: Responsive.isMobile(context)
                                                                                ? width * 0.6
                                                                                : width * 0.15,
                                                                            height:
                                                                                90,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                              child: TextFormField(
                                                                                keyboardType: TextInputType.phone,
                                                                                textInputAction: TextInputAction.next,
                                                                                cursorColor: Colors.black,
                                                                                onSaved: (text) {},
                                                                                decoration: InputDecoration(
                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                    borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
                                                                                  ),
                                                                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0), borderSide: BorderSide(width: 1.5, color: kPrimaryColor)),
                                                                                  labelText: "Phone Number",
                                                                                  labelStyle: TextStyle(
                                                                                    color: kLabelColor,
                                                                                    fontSize: 15,
                                                                                  ),
                                                                                  prefixIcon: Padding(
                                                                                    padding: const EdgeInsets.all(kDefaultPadding),
                                                                                    child: Icon(Icons.phone, color: kPrimaryColor, size: 18),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: width * 0.08),
                                                                          SizedBox(
                                                                            width: Responsive.isMobile(context)
                                                                                ? width * 0.6
                                                                                : width * 0.15,
                                                                            height:
                                                                                90,
                                                                            child: Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                                                                                child: ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(50.0),
                                                                                        )),
                                                                                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                                                          (Set<MaterialState> states) {
                                                                                            if (states.contains(MaterialState.pressed)) return kPrimaryColor;
                                                                                            return kPrimaryColor;
                                                                                          },
                                                                                        ),
                                                                                        side: MaterialStateProperty.all(BorderSide(color: kPrimaryColor, width: 1.5, style: BorderStyle.solid))),
                                                                                    onPressed: _selectFile,
                                                                                    child: Text(
                                                                                      "file",
                                                                                      style: TextStyle(color: Colors.white),
                                                                                    ))),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.03,
                                                                          ),
                                                                        ],
                                                                      )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : Container(
                                                          child: Expanded(
                                                            flex: 8,
                                                            child: GoogleMap(
                                                              mapType: MapType
                                                                  .normal,
                                                              initialCameraPosition:
                                                                  CameraPosition(
                                                                target: _center,
                                                                zoom: 12,
                                                              ),
                                                              onMapCreated:
                                                                  (controller) {
                                                                mapController =
                                                                    controller;
                                                              },
                                                              markers: _markers,
                                                              onTap: _onMapTap,
                                                            ),
                                                          ),
                                                        )
                                            ],
                                          ))),
                                      Expanded(
                                          flex: 2,
                                          child: i == 1
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          buttonCarouselController
                                                              .nextPage(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .linear),
                                                      style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        )),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                                    kPrimaryColor),
                                                      ),
                                                      child: Text('Next'),
                                                    ),
                                                    SizedBox(width: 12),
                                                  ],
                                                )
                                              : i == 3
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(width: 12),
                                                        ElevatedButton(
                                                          onPressed: () => buttonCarouselController
                                                              .previousPage(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .linear),
                                                          style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                            )),
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                                        kPrimaryColor),
                                                          ),
                                                          child:
                                                              Text('Previous'),
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                width * 0.435),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            //                 Navigator.push(
                                                            // context,
                                                            //  MaterialPageRoute(builder: (context) =>  LoginScreen()));
                                                          },
                                                          style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                            )),
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                                        kPrimaryColor),
                                                          ),
                                                          child:
                                                              Text('Register'),
                                                        ),
                                                      ],
                                                    )
                                                  : Row(
                                                      children: [
                                                        SizedBox(width: 12),
                                                        ElevatedButton(
                                                          onPressed: () => buttonCarouselController
                                                              .previousPage(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .linear),
                                                          style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                            )),
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                                        kPrimaryColor),
                                                          ),
                                                          child:
                                                              Text('Previous'),
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                width * 0.435),
                                                        ElevatedButton(
                                                          onPressed: () =>
                                                              buttonCarouselController.nextPage(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .linear),
                                                          style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                            )),
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                                        kPrimaryColor),
                                                          ),
                                                          child: Text('Next'),
                                                        ),
                                                      ],
                                                    )),
                                    ],
                                  ),
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
                  aspectRatio: 2,
                  height: height,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
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
