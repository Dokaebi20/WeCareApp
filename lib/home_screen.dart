import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
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
      home: const MyUserHomeScreen(title: 'Home'),
    );
  }
}

class MyUserHomeScreen extends StatefulWidget {
  const MyUserHomeScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyUserHomeScreen> createState() => MyUserHomeScreenState();
}

class MyUserHomeScreenState extends State<MyUserHomeScreen> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  final List<Map<String, dynamic>> assetArr = [
    {"img": 'assets/vaccineCovidIcon.png', "title": "Covid-19 Vacine "},
    {
      "img": 'assets/vaccineCertificateIcon.png',
      "title": "Vaccine Certificate"
    },
    {"img": 'assets/vaccineNewsIcon.png', "title": "Vaccine News"},
    {"img": 'assets/vaccineRegisterIcon.png', "title": "Vaccine Register"},
    {"img": 'assets/vaccineTicketIcon.png', "title": "Vaccine Ticket "},
    {"img": 'assets/vaccinePlaceIcon.png', "title": "Vaccine Place "},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 62, 80),
          shadowColor: Colors.transparent,
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image(image: AssetImage('assets/accountIcon.png')))
          ],
          title: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )),
        ),
        body: SafeArea(
          child: Container(
              color: Color.fromARGB(255, 0, 62, 80),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/wave.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.all(30),
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 254, 244, 232),
                                border: Border.all(
                                    color: Colors.transparent,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black,
                                              width: 3,
                                              style: BorderStyle.solid))),
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Hi, .....',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                                    child: Container(
                                      width: 300,
                                      height: 50,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                  style: BorderStyle.solid),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          300)),
                                              primary: Color.fromARGB(
                                                  255, 197, 218, 230)),
                                          child: Text(
                                            "Account",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )),
                                    ))
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.transparent,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10)),
                            child: GridView.count(
                                mainAxisSpacing: 45,
                                crossAxisCount: 3,
                                children: assetArr.map((e) {
                                  return Container(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image(
                                                      width: 80,
                                                      height: 75,
                                                      image: AssetImage(
                                                          '${e['img']}')))),
                                          Container(
                                            width: 75,
                                            child: Text('${e['title']}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15)),
                                          )
                                        ]),
                                  );
                                }).toList()),
                          ))
                    ],
                  )
                ],
              )),
        ));
  }
}
