import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news/constants.dart';
import 'package:news/responsive.dart';
import 'package:get/get.dart';
import '../../controllers/MenuController.dart';


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
              /* if (!Responsive.isDesktop(context)) SizedBox(width: 40), */
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? width / 1.1
                          : width / 3,
                      height: !Responsive.isDesktop(context)
                          ? height * 0.5
                          : height * 0.7,
                      child: Flexible(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          color: Colors.white,
                          child: CarouselSlider(
                            items: imagesList.map((image) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Column(
                                    children: [
                                      (Responsive.isDesktop(context))
                                          ? Text(
                                              '\nSteps illustration',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily:
                                                    'assets/fonts/Raleway-Medium.ttf',
                                                fontSize: Responsive.isDesktop(
                                                        context)
                                                    ? 35
                                                    : 20,
                                              ),
                                            )
                                          : Text(
                                              'Steps illustration',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily:
                                                    'assets/fonts/Raleway-Medium.ttf',
                                                fontSize: Responsive.isDesktop(
                                                        context)
                                                    ? 35
                                                    : 20,
                                              ),
                                            ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Flexible(
                                        child: AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: Image.asset(
                                            image,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
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
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 1000),
                              aspectRatio: 16 / 9,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: width * 0.3,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      color: Colors.white,
                      child: Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding,
                              horizontal: kDefaultPadding),
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: '\t\t\t 🚨 CPR Steps \n\n',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontFamily:
                                          'assets/fonts/Raleway-Medium.ttf',
                                      fontSize: 35,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '1.',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                          ),
                                          children: [
                                            TextSpan(
                                                text:
                                                    ' Check for responsiveness.\n\n',
                                                style: TextStyle(
                                                  color: kDarkBlackColor,
                                                  fontSize: 18,
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text: '2.',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 18,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                ' Call for emergency services.\n\n',
                                                            style: TextStyle(
                                                              color:
                                                                  kDarkBlackColor,
                                                              fontSize: 18,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                  text: '3.',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                  children: [
                                                                    TextSpan(
                                                                        text:
                                                                            ' Perform chest compressions.\n\n',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              kDarkBlackColor,
                                                                          fontSize:
                                                                              18,
                                                                        ),
                                                                        children: [
                                                                          TextSpan(
                                                                              text: '4.',
                                                                              style: TextStyle(
                                                                                color: Colors.red,
                                                                                fontSize: 18,
                                                                              ),
                                                                              children: [
                                                                                TextSpan(
                                                                                    text: ' Open airway and give rescue breaths.\n\n',
                                                                                    style: TextStyle(
                                                                                      color: kDarkBlackColor,
                                                                                      fontSize: 18,
                                                                                    ),
                                                                                    children: [
                                                                                      TextSpan(
                                                                                          text: '5.',
                                                                                          style: TextStyle(
                                                                                            color: Colors.red,
                                                                                            fontSize: 18,
                                                                                          ),
                                                                                          children: [
                                                                                            TextSpan(
                                                                                                text: ' Continue cycles of chest compressions and \n\t rescue breaths.\n\n',
                                                                                                style: TextStyle(
                                                                                                  color: kDarkBlackColor,
                                                                                                  fontSize: 18,
                                                                                                ),
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                      text: '6.',
                                                                                                      style: TextStyle(
                                                                                                        color: Colors.red,
                                                                                                        fontSize: 18,
                                                                                                      ),
                                                                                                      children: [
                                                                                                        TextSpan(
                                                                                                          text: ' Follow instructions from emergency services.\n',
                                                                                                          style: TextStyle(
                                                                                                            color: kDarkBlackColor,
                                                                                                            fontSize: 18,
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
                                maxLines: null,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ]),
            if (Responsive.isMobile(context) || Responsive.isTablet(context))
              SizedBox(height: 40),
            if (Responsive.isMobile(context) || Responsive.isTablet(context))
              Column(
                children: [
                  SizedBox(
                    width: 500,
                    height: height * 0.55,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      color: Colors.white,
                      child: Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 4),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width * 0.04,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '\t\t\t 🚨 CPR Steps \n\n',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontFamily:
                                          'assets/fonts/Raleway-Medium.ttf',
                                      fontSize: 30,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '1.',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15,
                                          ),
                                          children: [
                                            TextSpan(
                                                text:
                                                    ' Check for responsiveness.\n\n',
                                                style: TextStyle(
                                                  color: kDarkBlackColor,
                                                  fontSize: 15,
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text: '2.',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 15,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                ' Call for emergency services.\n\n',
                                                            style: TextStyle(
                                                              color:
                                                                  kDarkBlackColor,
                                                              fontSize: 15,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                  text: '3.',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                  children: [
                                                                    TextSpan(
                                                                        text:
                                                                            ' Perform chest compressions.\n\n',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              kDarkBlackColor,
                                                                          fontSize:
                                                                              15,
                                                                        ),
                                                                        children: [
                                                                          TextSpan(
                                                                              text: '4.',
                                                                              style: TextStyle(
                                                                                color: Colors.red,
                                                                                fontSize: 15,
                                                                              ),
                                                                              children: [
                                                                                TextSpan(
                                                                                    text: ' Open airway and give rescue breaths.\n\n',
                                                                                    style: TextStyle(
                                                                                      color: kDarkBlackColor,
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                    children: [
                                                                                      TextSpan(
                                                                                          text: '5.',
                                                                                          style: TextStyle(
                                                                                            color: Colors.red,
                                                                                            fontSize: 15,
                                                                                          ),
                                                                                          children: [
                                                                                            TextSpan(
                                                                                                text: ' Continue cycles of chest \n\t compressions and rescue breaths.\n\n',
                                                                                                style: TextStyle(
                                                                                                  color: kDarkBlackColor,
                                                                                                  fontSize: 15,
                                                                                                ),
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                      text: '6.',
                                                                                                      style: TextStyle(
                                                                                                        color: Colors.red,
                                                                                                        fontSize: 15,
                                                                                                      ),
                                                                                                      children: [
                                                                                                        TextSpan(
                                                                                                          text: ' Follow instructions from emergency\n\t services.\n',
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
                                maxLines: null,
                                softWrap: true,
                              ),
                            ],
                          ),
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
