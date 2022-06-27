import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:WeCare/home_screen.dart';

class VaccineRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vacine Register',
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
      home: const MyVaccineRegisterDart(title: 'Vaccine Register'),
    );
  }
}

class MyVaccineRegisterDart extends StatefulWidget {
  const MyVaccineRegisterDart({Key? key, required this.title})
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
  State<MyVaccineRegisterDart> createState() => MyVaccineRegisterDartState();
}

class MyVaccineRegisterDartState extends State<MyVaccineRegisterDart> {
  TextEditingController _nikController = TextEditingController();
  var var4VaccineLocation;
  var var4VaccineDate;

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    _nikController.text = '3370306462861794';
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
                  Column(children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.1),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  height: 50,
                                  child: TextField(
                                    enabled: false,
                                    controller: _nikController,
                                    maxLength: 16,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    decoration: InputDecoration(
                                        counterText: '',
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        border: InputBorder.none,
                                        labelText: 'NIK',
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent))),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 94, 154, 182),
                                          width: 4,
                                          style: BorderStyle.solid)),
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        vertical: 5),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton<String>(
                                          dropdownColor:
                                              Color.fromARGB(215, 0, 62, 80),
                                          hint: Text(
                                            'Vaccine Location',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          isExpanded: true,
                                          value: var4VaccineLocation,
                                          icon: const Icon(
                                            Icons.arrow_downward,
                                            color: Colors.white,
                                          ),
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              var4VaccineLocation = newValue!;
                                            });
                                          },
                                          items: <String>[
                                            'RS Dr. Kariadi',
                                            'RS Elizabeth',
                                            'RS Panti Wilasa'
                                          ].map<DropdownMenuItem<String>>(
                                              (value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    )),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        vertical: 5),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton<String>(
                                          dropdownColor:
                                              Color.fromARGB(215, 0, 62, 80),
                                          hint: Text(
                                            'Vaccine Date',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          isExpanded: true,
                                          value: var4VaccineDate,
                                          icon: const Icon(
                                            Icons.arrow_downward,
                                            color: Colors.white,
                                          ),
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              var4VaccineDate = newValue!;
                                            });
                                          },
                                          items: <String>[
                                            '27/06/2022',
                                            '29/06/2022',
                                            '01/07/2022'
                                          ].map<DropdownMenuItem<String>>(
                                              (value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ))
                              ]),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.8,
                                      50),
                                  primary: Color.fromARGB(255, 94, 154, 182),
                                  side: BorderSide(
                                      width: 3, color: Colors.transparent),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Center(
                                  child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Successfully Registered!")));
                                Timer(Duration(seconds: 2), () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserHomeScreen()));
                                });
                              }),
                        ))
                  ]),
                ],
              )),
        ));
  }
}
