import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:WeCare/home_screen.dart';

class CovidVaccineScreen extends StatelessWidget {
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
      home: const MyCovidVaccineScreen(title: 'Covid Vaccine'),
    );
  }
}

class MyCovidVaccineScreen extends StatefulWidget {
  const MyCovidVaccineScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyCovidVaccineScreen> createState() => MyCovidVaccineScreenState();
}

class MyCovidVaccineScreenState extends State<MyCovidVaccineScreen> {
  final List<Map<String, dynamic>> infoArr = [
    {
      'title': 'Pfizer',
      'img': 'assets/vaccineCovidPfizer.jpg',
      'info':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },
    {
      'title': 'Janssen',
      'img': 'assets/vaccineCovidJanssen.jpg',
      'info':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },
    {
      'title': 'NovaVax',
      'img': 'assets/vaccineCovidNovaVax.jpg',
      'info':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },
    {
      'title': 'Moderna',
      'img': 'assets/vaccineCovidModerna.jpg',
      'info':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },
    {
      'title': 'CanSino',
      'img': 'assets/vaccineCovidCanSino.jpg',
      'info':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    }
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
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.1),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            viewportFraction: 1,
                            height: MediaQuery.of(context).size.height * 0.8),
                        items: infoArr.map((e) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      blurStyle: BlurStyle.normal)
                                ],
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.transparent,
                                    width: 3,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black38,
                                                    blurRadius: 10,
                                                    spreadRadius: 2,
                                                    blurStyle: BlurStyle.normal)
                                              ]),
                                          child: CircleAvatar(
                                              radius: 100,
                                              backgroundImage: AssetImage(
                                                '${e['img']}',
                                              )))),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          margin: EdgeInsets.all(15),
                                          child: ListView(children: [
                                            Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(20),
                                                child: Text('${e['title']}',
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            Container(
                                              alignment: Alignment.topCenter,
                                              padding: EdgeInsets.all(20),
                                              child: Text(
                                                '${e['info']}',
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            )
                                          ])))
                                ]),
                          );
                        }).toList(),
                      ))
                ],
              )),
        )));
  }
}
