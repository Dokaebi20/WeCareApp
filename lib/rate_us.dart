import 'dart:async';
import 'dart:html';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ug44/home_screen.dart';
import 'package:ug44/main.dart';
import 'package:ug44/user_account_screen.dart';
import 'package:ug44/vaccine_certificate.dart';
import 'package:ug44/vaccine_ticket.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rate Us',
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
      home: const MyRateUsScreen(title: 'Rate Us'),
    );
  }
}

class MyRateUsScreen extends StatefulWidget {
  const MyRateUsScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyRateUsScreen> createState() => MyRateUsScreenState();
}

class MyRateUsScreenState extends State<MyRateUsScreen> {
  var ratingStar;

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
                MaterialPageRoute(builder: (context) => UserAccountScreen()));
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
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: MediaQuery.of(context).size.height * 0.1),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      RatingBar.builder(
                                        initialRating: 0,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          setState(() {
                                            ratingStar = rating;
                                          });
                                        },
                                      ),
                                      Container(
                                        child: Text(
                                          ratingStar == null
                                              ? '0'
                                              : '$ratingStar',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ])),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    transformAlignment: Alignment.center,
                                    padding: EdgeInsets.all(15),
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Colors.transparent,
                                            width: 1,
                                            style: BorderStyle.solid)),
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 99,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Insert Your FeedBack'),
                                    ))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              50),
                                          primary:
                                              Color.fromARGB(255, 94, 154, 182),
                                          side: BorderSide(
                                              width: 3,
                                              color: Colors.transparent),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      child: Center(
                                          child: Text(
                                        "Send",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                      onPressed: ratingStar != null
                                          ? () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Successfully Send!")));

                                              Timer(Duration(seconds: 2), () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UserHomeScreen()));
                                              });
                                            }
                                          : () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Required to fill the rating")));
                                            }),
                                )),
                          ]))
                ],
              )),
        ));
  }
}
