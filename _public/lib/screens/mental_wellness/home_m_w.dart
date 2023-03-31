import 'package:flutter/material.dart';
//import 'package:news/constants.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:news/constants.dart';
import 'package:news/responsive.dart';
import 'package:get/get.dart';

import '../../controllers/MenuController.dart';
//import 'package:news/responsive.dart';

class HomeScreenMw extends StatelessWidget {
  HomeScreenMw({
    Key key,
  }) : super(key: key);
  final MenuControllerN myController = Get.put(MenuControllerN());
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
            Row(children: [
              Column(children: [
                SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? width / 1.15
                      : (width / 2),
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
                                  ? width / 1.5
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
                    child: RichText(
                      text: TextSpan(
                          text: 'CPR Steps !\n\n',
                          style: TextStyle(
                            color: kDarkBlackColor,
                            fontSize: 40,
                          ),
                          children: [
                            TextSpan(
                                text: '1-',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30,
                                ),
                                children: [
                                  TextSpan(
                                      text: ' Check for responsiveness.\n',
                                      style: TextStyle(
                                        color: kDarkBlackColor,
                                        fontSize: 25,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: '2-',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 30,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      ' Call for emergency services.\n',
                                                  style: TextStyle(
                                                    color: kDarkBlackColor,
                                                    fontSize: 25,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                        text: '3-',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 30,
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  ' Perform chest compressions.\n',
                                                              style: TextStyle(
                                                                color:
                                                                    kDarkBlackColor,
                                                                fontSize: 25,
                                                              ),
                                                              children: [
                                                                TextSpan(
                                                                    text: '4-',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontSize:
                                                                          30,
                                                                    ),
                                                                    children: [
                                                                      TextSpan(
                                                                          text:
                                                                              ' Open airway and give rescue breaths.\n',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                kDarkBlackColor,
                                                                            fontSize:
                                                                                25,
                                                                          ),
                                                                          children: [
                                                                            TextSpan(
                                                                                text: '5-',
                                                                                style: TextStyle(
                                                                                  color: Colors.red,
                                                                                  fontSize: 30,
                                                                                ),
                                                                                children: [
                                                                                  TextSpan(
                                                                                      text: ' Continue cycles of chest compressions and rescue breaths.\n',
                                                                                      style: TextStyle(
                                                                                        color: kDarkBlackColor,
                                                                                        fontSize: 25,
                                                                                      ),
                                                                                      children: [
                                                                                        TextSpan(
                                                                                            text: '6-',
                                                                                            style: TextStyle(
                                                                                              color: Colors.red,
                                                                                              fontSize: 30,
                                                                                            ),
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: ' Follow instructions from emergency services.\n',
                                                                                                style: TextStyle(
                                                                                                  color: kDarkBlackColor,
                                                                                                  fontSize: 25,
                                                                                                ),
                                                                                              )
                                                                                            ])
                                                                                      ])
                                                                                ])
                                                                          ])
                                                                    ])
                                                              ])
                                                        ])
                                                  ])
                                            ])
                                      ])
                                ]),
                          ]),
                    ),
                  ),
                )
            ]),
            if (Responsive.isMobile(context)) SizedBox(height: 40),
            if (Responsive.isMobile(context))
              Column(
                children: [
                  SizedBox(
                    width: width / 1.2,
                    height: height,
                    child: Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 4),
                        child: RichText(
                          text: TextSpan(
                              text: 'CPR Steps !\n\n',
                              style: TextStyle(
                                color: kDarkBlackColor,
                                fontSize: 20,
                              ),
                              children: [
                                TextSpan(
                                    text: '1-',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: ' Check for responsiveness.\n',
                                          style: TextStyle(
                                            color: kDarkBlackColor,
                                            fontSize: 15,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: '2-',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20,
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          ' Call for emergency services.\n',
                                                      style: TextStyle(
                                                        color: kDarkBlackColor,
                                                        fontSize: 15,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                            text: '3-',
                                                            style: TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 20,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                  text:
                                                                      ' Perform chest compressions.\n',
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        kDarkBlackColor,
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                  children: [
                                                                    TextSpan(
                                                                        text:
                                                                            '4-',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.red,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                        children: [
                                                                          TextSpan(
                                                                              text: ' Open airway and give rescue breaths.\n',
                                                                              style: TextStyle(
                                                                                color: kDarkBlackColor,
                                                                                fontSize: 15,
                                                                              ),
                                                                              children: [
                                                                                TextSpan(
                                                                                    text: '5-',
                                                                                    style: TextStyle(
                                                                                      color: Colors.red,
                                                                                      fontSize: 20,
                                                                                    ),
                                                                                    children: [
                                                                                      TextSpan(
                                                                                          text: ' Continue cycles of chest compressions and rescue breaths.\n',
                                                                                          style: TextStyle(
                                                                                            color: kDarkBlackColor,
                                                                                            fontSize: 15,
                                                                                          ),
                                                                                          children: [
                                                                                            TextSpan(
                                                                                                text: '6-',
                                                                                                style: TextStyle(
                                                                                                  color: Colors.red,
                                                                                                  fontSize: 20,
                                                                                                ),
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: ' Follow instructions from emergency services.\n',
                                                                                                    style: TextStyle(
                                                                                                      color: kDarkBlackColor,
                                                                                                      fontSize: 15,
                                                                                                    ),
                                                                                                  )
                                                                                                ])
                                                                                          ])
                                                                                    ])
                                                                              ])
                                                                        ])
                                                                  ])
                                                            ])
                                                      ])
                                                ])
                                          ])
                                    ]),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ));
  }
}
