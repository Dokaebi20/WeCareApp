import 'dart:async';
import 'dart:html';
import 'dart:isolate';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ug44/home_screen.dart';
import 'package:ug44/main.dart';
import 'package:ug44/vaccine_certificate.dart';
import 'package:ug44/vaccine_ticket.dart';
import 'package:ug44/rate_us.dart';

class UserAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account',
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
      home: const MyUserAccountScreen(title: 'Account'),
    );
  }
}

class MyUserAccountScreen extends StatefulWidget {
  const MyUserAccountScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyUserAccountScreen> createState() => MyUserAccountScreenState();
}

class MyUserAccountScreenState extends State<MyUserAccountScreen> {
  var userName = 'User';
  var noHP = '+621234567890';
  var isEditable = false;
  var setDate;
  final _noHPController = TextEditingController();

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  final List<Map<String, dynamic>> assetArr = [
    {
      "img": 'assets/vaccineCertificateIcon.png',
      "title": "Vaccine Certificate",
      "ref": VaccineCertificateScreen()
    },
    {
      "img": 'assets/vaccineTicketIcon.png',
      "title": "Vaccine Ticket ",
      "ref": VaccineTicketScreen()
    },
    {
      "img": 'assets/rateUsIcon.png',
      "title": "Rate Us ",
      "ref": RateUsScreen()
    },
  ];
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
                      padding: EdgeInsets.all(20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Column(children: [
                                      Container(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              alignment: Alignment.topCenter,
                                              child: Image.asset(
                                                  'assets/accountIcon.png')),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              alignment: Alignment.center,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${userName}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                  Text(
                                                    '${noHP}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )
                                                ],
                                              )),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            alignment: Alignment.centerLeft,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isEditable = true;
                                                    _noHPController.text =
                                                        noHP.substring(3);
                                                  });
                                                },
                                                child: Image(
                                                    image: AssetImage(
                                                        'assets/pencilEditIcon.png'))),
                                            height: 20,
                                          )
                                        ],
                                      )),
                                    ]))),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Scan QR Code',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        Image.asset(
                                          'assets/QRCode.png',
                                          width: 120,
                                          height: 120,
                                        )
                                      ]),
                                )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  child: ListView(
                                      children: isEditable
                                          ? [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: (20)),
                                                height: 50,
                                                child: TextField(
                                                  controller: _noHPController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  maxLength: 11,
                                                  inputFormatters: <
                                                      TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp(r'[0-9]')),
                                                  ],
                                                  decoration: InputDecoration(
                                                      counterText: '',
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8),
                                                      border: InputBorder.none,
                                                      labelText: 'No Hp.',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .transparent))),
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 94, 154, 182),
                                                        width: 4,
                                                        style:
                                                            BorderStyle.solid)),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: (20)),
                                                height: 50,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8),
                                                      border: InputBorder.none,
                                                      labelText: 'E-MAIL',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .transparent))),
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 94, 154, 182),
                                                        width: 4,
                                                        style:
                                                            BorderStyle.solid)),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                height: 50,
                                                child: TextField(
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8),
                                                      border: InputBorder.none,
                                                      labelText: 'PASSWORD',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .transparent))),
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 94, 154, 182),
                                                        width: 4,
                                                        style:
                                                            BorderStyle.solid)),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                height: 50,
                                                child: TextField(
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8),
                                                      border: InputBorder.none,
                                                      labelText:
                                                          'CONFIRM PASSWORD',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .transparent))),
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 94, 154, 182),
                                                        width: 4,
                                                        style:
                                                            BorderStyle.solid)),
                                              )
                                            ]
                                          : assetArr.map((e) {
                                              return InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    e['ref']));
                                                  },
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black54,
                                                                  offset: Offset
                                                                      .zero,
                                                                  blurRadius:
                                                                      10,
                                                                  spreadRadius:
                                                                      2,
                                                                  blurStyle:
                                                                      BlurStyle
                                                                          .normal),
                                                            ],
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Row(children: [
                                                          Image.asset(
                                                            '${e['img']}',
                                                            width: 50,
                                                            height: 50,
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.675,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "${e["title"]}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          )
                                                        ]),
                                                      )));
                                            }).toList()),
                                )),
                            Expanded(
                                flex: 2,
                                child: isEditable
                                    ? Container(
                                        alignment: Alignment.topCenter,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      fixedSize: Size(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          50),
                                                      primary: Color.fromARGB(
                                                          255, 94, 154, 182),
                                                      side: BorderSide(
                                                          width: 3,
                                                          color: Colors
                                                              .transparent),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                  child: Center(
                                                      child: Text(
                                                    "Accept",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (noHP != null) {
                                                        noHP =
                                                            '+62${_noHPController.text}';
                                                        isEditable = false;
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    "Successfully Registered!")));
                                                      }
                                                    });
                                                  }),
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      fixedSize: Size(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          50),
                                                      primary: Color.fromARGB(
                                                          255, 94, 154, 182),
                                                      side: BorderSide(
                                                          width: 3,
                                                          color: Colors
                                                              .transparent),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                  child: Center(
                                                      child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )),
                                                  onPressed: () {
                                                    setState(() {
                                                      isEditable = false;
                                                    });
                                                    ;
                                                  })
                                            ]))
                                    : Container(
                                        margin: EdgeInsets.only(top: 10),
                                        alignment: Alignment.topCenter,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: Size(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.8,
                                                    50),
                                                primary: Color.fromARGB(
                                                    255, 94, 154, 182),
                                                side: BorderSide(
                                                    width: 3,
                                                    color: Colors.transparent),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            child: Center(
                                                child: Text(
                                              "Sign Out",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            )),
                                            onPressed: () {
                                              Timer(Duration(milliseconds: 200),
                                                  () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen()));
                                              });
                                            })))
                          ]))
                ],
              )),
        ));
  }
}
