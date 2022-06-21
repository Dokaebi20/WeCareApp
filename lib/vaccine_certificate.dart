import 'dart:async';
import 'dart:html';
import 'dart:isolate';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ug44/home_screen.dart';
import 'package:ug44/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class VaccineCertificateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Vaccine',
      scrollBehavior:
          ScrollConfiguration.of(context).copyWith(scrollbars: false),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyVaccineCertificateScreen(title: 'Covid Vaccine'),
    );
  }
}

class MyVaccineCertificateScreen extends StatefulWidget {
  const MyVaccineCertificateScreen({Key? key, required this.title})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyVaccineCertificateScreen> createState() =>
      MyVaccineCertificateScreenState();
}

class MyVaccineCertificateScreenState
    extends State<MyVaccineCertificateScreen> {
  final List<Map<String, dynamic>> certificateArr = [
    {
      'image': 'assets/vaccineCertificateExample.jpg',
      'isOpen': true,
      'token': utf8.encode(Random().nextDouble().toString())
    },
    {
      'image': 'assets/vaccineCertificateExample.jpg',
      'isOpen': true,
      'token': utf8.encode(Random().nextDouble().toString())
    },
    {
      'image': 'assets/vaccineCertificateExample.jpg',
      'isOpen': true,
      'token': utf8.encode(Random().nextDouble().toString())
    },
  ];
  var counter_ = 1;

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserHomeScreen()));
          }),
          backgroundColor: Color.fromARGB(255, 0, 62, 80),
          shadowColor: Colors.transparent,
          title: Center(
              child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: SafeArea(
            child: Expanded(
          child: Container(
              color: Color.fromARGB(255, 0, 62, 80),
              padding: EdgeInsets.all(0),
              child: Stack(
                children: [
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/wave.png',
                        fit: BoxFit.fitWidth,
                      )),
                  Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.1),
                      child: ListView(
                        children: certificateArr.map((e) {
                          return InkWell(
                              onTap: () {
                                e['isOpen']
                                    ? e['isOpen'] = false
                                    : e['isOpen'] = true;
                              },
                              onLongPress: () {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Vaccine Certificated #${certificateArr.indexWhere((el) => el['token'] == e['token'])} Have Been Saved to Your Local Storage")));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.transparent,
                                          width: 1,
                                          style: BorderStyle.solid)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: Text(
                                        'Vaccine #${counter_++}',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ))
                                    ],
                                  )));
                        }).toList(),
                      ))
                ],
              )),
        )));
  }
}