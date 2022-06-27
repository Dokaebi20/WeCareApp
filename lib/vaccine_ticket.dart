import 'dart:async';
import 'dart:math';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:WeCare/home_screen.dart';

class VaccineTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaccine Certificate',
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
      home: const MyVaccineTicketScreen(title: 'Vaccine Certificate'),
    );
  }
}

class MyVaccineTicketScreen extends StatefulWidget {
  const MyVaccineTicketScreen({Key? key, required this.title})
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
  State<MyVaccineTicketScreen> createState() => MyVaccineTicketScreenState();
}

class MyVaccineTicketScreenState extends State<MyVaccineTicketScreen> {
  var timeEmail = 0;
  var timeSMS = 0;
  final List<Map<String, dynamic>> ticketArr = [
    {
      'img': 'assets/vaccineTicketExample.jpg',
      'isOpen': false,
      'token': Random().nextDouble() * 2
    },
    {
      'img': 'assets/vaccineTicketExample.jpg',
      'isOpen': false,
      'token': Random().nextDouble() * 2
    },
    {
      'img': 'assets/vaccineTicketExample.jpg',
      'isOpen': false,
      'token': Random().nextDouble() * 2
    },
  ];

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
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.00),
                      child: ListView(
                        children: ticketArr.map((e) {
                          return InkWell(
                              onTap: () {},
                              child: Expanded(
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      height: e['isOpen'] ? null : null,
                                      padding: EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black54,
                                                spreadRadius: 3,
                                                blurRadius: 10,
                                                blurStyle: BlurStyle.normal)
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.transparent,
                                              width: 1,
                                              style: BorderStyle.solid)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              child: Text(
                                                'Ticket #${ticketArr.indexWhere((el) => el['token'] == e['token']) + 1}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Container(
                                            decoration: DottedDecoration(
                                                linePosition: LinePosition.top,
                                                color: Colors.black,
                                                strokeWidth: 3),
                                            margin: EdgeInsets.only(top: 10),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image(
                                                  image:
                                                      AssetImage('${e['img']}'),
                                                  fit: BoxFit.fitWidth,
                                                )),
                                          ),
                                          Container(
                                            decoration: DottedDecoration(
                                                linePosition: LinePosition.top,
                                                color: Colors.black,
                                                strokeWidth: 3),
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            fixedSize: Size(
                                                                MediaQuery.of(context)
                                                                        .size
                                                                        .width *
                                                                    0.325,
                                                                50),
                                                            primary:
                                                                Color.fromARGB(
                                                                    255,
                                                                    94,
                                                                    154,
                                                                    182),
                                                            side: BorderSide(
                                                                width: 3,
                                                                color: Colors
                                                                    .transparent),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        20))),
                                                        child: Center(
                                                            child: Text(
                                                          "Sent Via E-Mail",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15),
                                                        )),
                                                        onPressed: () {
                                                          if (timeEmail == 0) {
                                                            timeEmail = 15;
                                                            Timer.periodic(
                                                                Duration(
                                                                    seconds: 1),
                                                                (timer) {
                                                              timeEmail == 0
                                                                  ? timer
                                                                      .cancel()
                                                                  : timeEmail--;
                                                            });
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text("Ticket Have Been Sent to Your E-Mail")));
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text("Wait $timeEmail seconds")));
                                                          }
                                                          ;
                                                        }),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            fixedSize: Size(
                                                                MediaQuery.of(context)
                                                                        .size
                                                                        .width *
                                                                    0.325,
                                                                50),
                                                            primary:
                                                                Color.fromARGB(
                                                                    255,
                                                                    94,
                                                                    154,
                                                                    182),
                                                            side: BorderSide(
                                                                width: 3,
                                                                color: Colors
                                                                    .transparent),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        20))),
                                                        child: Center(
                                                            child: Text(
                                                          "Send Via SMS ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15),
                                                        )),
                                                        onPressed: () {
                                                          if (timeSMS == 0) {
                                                            timeSMS = 90;
                                                            Timer.periodic(
                                                                Duration(
                                                                    seconds: 1),
                                                                (timer) {
                                                              timeSMS == 0
                                                                  ? timer
                                                                      .cancel()
                                                                  : timeSMS--;
                                                            });
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text("Ticket Have Been Sent to Your SMS")));
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text("Wait $timeSMS seconds")));
                                                          }
                                                          ;
                                                        }),
                                                  )
                                                ]),
                                          )
                                        ],
                                      ))));
                        }).toList(),
                      ))
                ],
              )),
        )));
  }
}
