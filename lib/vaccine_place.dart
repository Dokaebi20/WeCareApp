import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:WeCare/home_screen.dart';

class VaccinePlaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaccine Place',
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
      home: const MyVaccinePlaceScreen(title: 'Vaccine Place'),
    );
  }
}

class MyVaccinePlaceScreen extends StatefulWidget {
  const MyVaccinePlaceScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyVaccinePlaceScreen> createState() => MyVaccinePlaceScreenState();
}

class MyVaccinePlaceScreenState extends State<MyVaccinePlaceScreen> {
  var var4PlaceLoc;
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
          child: Container(
              alignment: Alignment.center,
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
                      height: 550,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.05),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  blurStyle: BlurStyle.normal)
                            ],
                            border: Border.all(
                                color: Colors.transparent,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton<String>(
                                                dropdownColor: Color.fromARGB(
                                                    215, 255, 255, 255),
                                                hint: Text(
                                                  'Vaccine Location',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                                isExpanded: true,
                                                value: var4PlaceLoc,
                                                icon: const Icon(
                                                  Icons.arrow_downward,
                                                  color: Colors.black,
                                                ),
                                                elevation: 16,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    var4PlaceLoc = newValue!;
                                                  });
                                                },
                                                items: <String>[
                                                  'RS Dr. Kariadi',
                                                  'RS Elizabeth',
                                                  'RS Panti Wilasa'
                                                ].map<DropdownMenuItem<String>>(
                                                    (value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ))))),
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: var4PlaceLoc ==
                                                  'RS Dr. Kariadi'
                                              ? Image.asset(
                                                  'assets/vaccineLocationRSKariadi.jpg',
                                                )
                                              : (var4PlaceLoc == 'RS Elizabeth'
                                                  ? Image.asset(
                                                      'assets/vaccineLocationRSElizabeth.jpg')
                                                  : (var4PlaceLoc ==
                                                          'RS Elizabeth'
                                                      ? Image.asset(
                                                          'assets/vaccineLocationRSElizabeth.jpg')
                                                      : Image.asset(
                                                          'assets/vaccineLocationRSKariadi.jpg'))))))
                            ]),
                      ))
                ],
              )),
        ));
  }
}
