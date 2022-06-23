import 'dart:async';
import 'dart:html';
import 'dart:isolate';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ug44/home_screen.dart';
import 'package:ug44/main.dart';

class VaccineNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaccine News',
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
      home: const MyVaccineNewsScreen(title: 'Vaccine News'),
    );
  }
}

class MyVaccineNewsScreen extends StatefulWidget {
  const MyVaccineNewsScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyVaccineNewsScreen> createState() => MyVaccineNewsScreenState();
}

class MyVaccineNewsScreenState extends State<MyVaccineNewsScreen> {
  var isSearch = false;
  var searchController_ = TextEditingController();
  var searchController_2 = '';

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  final List<Map<String, dynamic>> newsArr = [
    {
      'isClick': false,
      'title': '10 Varian Corona Terbaru. No 11 Buat Netizen....',
      'info':
          '     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\n     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },
    {
      'isClick': false,
      'title': 'Berbagai Teori Konspirasi Mengenai Corona',
      'info':
          '     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\n     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },
    {
      'isClick': false,
      'title': '10 Fakta Virus Corona Menurut Berbagai Profesor',
      'info':
          '     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\n     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },
    {
      'isClick': false,
      'title': '10 Negara Terbaik Dalam Menangani Pandemi Corona',
      'info':
          '     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\n     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },
    {
      'isClick': false,
      'title':
          'Profesor dari US Memprediksi Bahwa Pandemi  Virus Corona Akan Berlangsung Selama 3 Periode ',
      'info':
          '     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\n     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
                padding: EdgeInsetsDirectional.only(
                    end: MediaQuery.of(context).size.width * 0.05),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        if (isSearch) {
                          isSearch = false;
                          searchController_.text = '';
                        } else {
                          isSearch = true;
                        }
                      });
                    },
                    child: isSearch ? Icon(Icons.cancel) : Icon(Icons.search)))
          ],
          leading: BackButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserHomeScreen()));
          }),
          backgroundColor: Color.fromARGB(255, 0, 62, 80),
          shadowColor: Colors.transparent,
          title: Center(
              child: isSearch
                  ? TextField(
                      controller: searchController_,
                      onChanged: (value) {
                        setState(() {
                          searchController_2 = value;
                          print(searchController_2);
                          print(searchController_.text);
                          // print(newsArr.where((el) =>
                          //     (el['title'].indexOf(searchController_.text) !=
                          //         0)));
                          newsArr.forEach((el) {
                            print(el['title'].toLowerCase().indexOf(
                                    searchController_.text.toLowerCase()) !=
                                -1);
                            print(el['title']);
                          });
                        });
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white54)),
                          hintText: 'Berita Vaksin',
                          hintStyle: TextStyle(color: Colors.white54)))
                  : Text(
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
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.05),
                      child: ListView(
                        children: (isSearch
                                ? newsArr.where((el) =>
                                    el['title'].toLowerCase().indexOf(
                                        searchController_2.toLowerCase()) !=
                                    (-1))
                                : newsArr)
                            .map((e) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  newsArr.forEach((el) {
                                    el['title'] == e['title']
                                        ? null
                                        : el['isClick'] = false;
                                  });
                                  e['isClick']
                                      ? e['isClick'] = false
                                      : e['isClick'] = true;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20),
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.transparent,
                                        width: 1,
                                        style: BorderStyle.solid)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          alignment: Alignment.topCenter,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  topLeft: Radius.circular(20)),
                                              child: Image.asset(
                                                'assets/vaccineNewsImg.jpg',
                                                fit: BoxFit.fitHeight,
                                              ))),
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: Text(
                                            '${e['title']}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.justify,
                                          )),
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: Text('oleh Admin',
                                              style: TextStyle(fontSize: 15))),
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: Text('22/06/2022',
                                              style: TextStyle(fontSize: 15))),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: e['isClick']
                                            ? Text(
                                                '${e['info']}',
                                                style: TextStyle(fontSize: 15),
                                                textAlign: TextAlign.justify,
                                              )
                                            : null,
                                      )
                                    ]),
                              ));
                        }).toList(),
                      ))
                ],
              )),
        ));
  }
}
