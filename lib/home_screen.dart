import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ug44/covid_vaccine.dart';
import 'package:ug44/user_account_screen.dart';
import 'package:ug44/user_account_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ug44/vaccine_certificate.dart';
import 'package:ug44/vaccine_news.dart';
import 'package:ug44/vaccine_place.dart';
import 'package:ug44/vaccine_register.dart';
import 'package:ug44/vaccine_ticket.dart';
import 'package:ug44/vaccine_certificate.dart';

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
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
    {
      "img": 'assets/vaccineCovidIcon.png',
      "title": "Covid-19 Vacine ",
      "ref": CovidVaccineScreen()
    },
    {
      "img": 'assets/vaccineCertificateIcon.png',
      "title": "Vaccine Certificate",
      "ref": VaccineCertificateScreen()
    },
    {
      "img": 'assets/vaccineNewsIcon.png',
      "title": "Vaccine News",
      "ref": VaccineNewsScreen()
    },
    {
      "img": 'assets/vaccineRegisterIcon.png',
      "title": "Vaccine Register",
      "ref": VaccineRegisterScreen()
    },
    {
      "img": 'assets/vaccineTicketIcon.png',
      "title": "Vaccine Ticket ",
      "ref": VaccineTicketScreen()
    },
    {
      "img": 'assets/vaccinePlaceIcon.png',
      "title": "Vaccine Place ",
      "ref": VaccinePlaceScreen()
    },
  ];
  @override
  Widget build(BuildContext context) {
    ValueNotifier width_ = ValueNotifier(MediaQuery.of(context).size.width);
    width_.addListener(() {
      print(width_.value);
    });
    print(width_.value);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 62, 80),
          shadowColor: Colors.transparent,
          actions: [
            Padding(
                padding: EdgeInsetsDirectional.only(
                    end: MediaQuery.of(context).size.width * 0.05),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserAccountScreen()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  spreadRadius: 2,
                                  blurRadius: 10)
                            ]),
                        child: CircleAvatar(
                          radius: 23,
                          backgroundImage: AssetImage('assets/accountIcon.png'),
                        ))))
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
                        flex: 2,
                        child: Container(
                            margin: EdgeInsetsDirectional.only(top: 15),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                scrollDirection: Axis.vertical,
                                autoPlayInterval: Duration(milliseconds: 3250),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.easeOut,
                                viewportFraction: 1,
                                autoPlay: true,
                                height: 250,
                              ),
                              items: [
                                'assets/pakaiMaskerCover3.jpg',
                                'assets/pakaiMaskerCover2.jpg',
                                'assets/pakaiMaskerCover.jpg'
                              ].map((i) {
                                return Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 20,
                                        spreadRadius: 3,
                                        blurStyle: BlurStyle.normal)
                                  ]),
                                  margin: EdgeInsets.only(top: 15),
                                  width:
                                      MediaQuery.of(context).size.width * 0.875,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                              Color.fromARGB(50, 76, 175, 79),
                                              BlendMode.color),
                                          child: Image(
                                            image: AssetImage(i),
                                            fit: BoxFit.fill,
                                          ))),
                                );
                              }).toList(),
                            )),
                      ),
                      Expanded(
                          flex: 5,
                          child: Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.transparent,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: GridView.count(
                                    shrinkWrap: false,
                                    mainAxisSpacing: 25,
                                    crossAxisCount: width_.value >= 550 ? 4 : 3,
                                    children: assetArr.map((e) {
                                      return Container(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .black54,
                                                                offset:
                                                                    Offset.zero,
                                                                blurRadius: 10,
                                                                spreadRadius: 2,
                                                                blurStyle:
                                                                    BlurStyle
                                                                        .normal),
                                                          ]),
                                                      child: InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        ((context) =>
                                                                            e['ref'])));
                                                          },
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              child: Image(
                                                                  width: 80,
                                                                  height: 75,
                                                                  image: AssetImage(
                                                                      '${e['img']}')))))),
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
                                    }).toList())),
                          ))
                    ],
                  )
                ],
              )),
        ));
  }
}
