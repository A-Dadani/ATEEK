import 'package:flutter/material.dart';
//import 'package:news/constants.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:news/constants.dart';
import 'package:news/responsive.dart';
import 'package:news/screens/maps/my_state.dart';
import 'package:get/get.dart';
//import 'package:news/responsive.dart';

class HomeScreenMw extends StatelessWidget {
  HomeScreenMw({
    Key key,
  }) : super(key: key);
  final MyController myController = Get.put(MyController());
  final List<String> imagesList = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
        flex: 2,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0, // Fixed height of the video
              child: WebView(
                initialUrl: 'https://www.youtube.com/embed/N2TdpMYXK58&ab',
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      "CPR intructions !",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: !Responsive.isDesktop(context) ? width : (width / 2),
                    child: CarouselSlider(
                      items: imagesList.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Image.asset(
                                image,
                                fit: BoxFit.contain,
                                width: !Responsive.isDesktop(context)
                                    ? width
                                    : (width / 1.5),
                                height: !Responsive.isDesktop(context)
                                    ? (height / 4)
                                    : height / 1.5,
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        initialPage: 0,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: false,
                        autoPlayAnimationDuration: Duration(milliseconds: 1000),
                        aspectRatio: 16 / 9,
                        height: !Responsive.isDesktop(context)
                            ? (height / 3)
                            : height / 1.1,
                      ),
                    ),
                  ),
                ]),
                if (Responsive.isDesktop(context))
                  SizedBox(
                    width: width * 0.04,
                  ),
                if (Responsive.isDesktop(context))
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: Text(
                        "Steps for CPR First Aid:\n\n1. Check for responsiveness\n2. Call for emergency services\n3. Perform chest compressions\n4. Open airway and give rescue breaths\n5. Continue cycles of chest compressions and rescue breaths\n6. Follow instructions from emergency services",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ));
  }
}
