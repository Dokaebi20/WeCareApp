import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ug44/main.dart';

class RegisterAccScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Account',
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
      home: const MyRegisterAccScreen(title: 'Register Account'),
    );
  }
}

class MyRegisterAccScreen extends StatefulWidget {
  const MyRegisterAccScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyRegisterAccScreen> createState() => MyRegisterAccScreenState();
}

class MyRegisterAccScreenState extends State<MyRegisterAccScreen> {
  var setDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 62, 80),
        shadowColor: Colors.transparent,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
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
              child: Stack(
                children: [
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/wave.png',
                        fit: BoxFit.fitWidth,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 100),
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 50,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          labelText: 'NAMA LENGKAP',
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent))),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 94, 154, 182),
                                            width: 4,
                                            style: BorderStyle.solid)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 50,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          labelText: 'NIK',
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent))),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 94, 154, 182),
                                            width: 4,
                                            style: BorderStyle.solid)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                    height: 50,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          labelText: 'E-MAIL',
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent))),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 94, 154, 182),
                                            width: 4,
                                            style: BorderStyle.solid)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 50,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          labelText: 'PASSWORD',
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent))),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 94, 154, 182),
                                            width: 4,
                                            style: BorderStyle.solid)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          setDate != null
                                              ? Text(
                                                  "${setDate.day.toString()}-${setDate.month.toString()}-${setDate.year.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18))
                                              : Text(
                                                  "Choose Your Date of Birth",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                          IconButton(
                                            iconSize: 20,
                                            icon: Icon(
                                              Icons.calendar_today,
                                              color: Colors.white,
                                            ),
                                            tooltip: 'Tap to open date picker',
                                            onPressed: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1901, 8),
                                                lastDate: DateTime(2101),
                                              ).then((value) {
                                                if (value != null) {
                                                  setState(() {
                                                    setDate = value;
                                                  });
                                                }
                                              });
                                            },
                                          ),
                                        ]),
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 25),
                                      height: 50,
                                      width: 125,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
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
                                            "Sign Up",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )),
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Successfully Registered!")));
                                            Timer(Duration(seconds: 2), () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen()));
                                            });
                                          }))
                                ],
                              )))
                    ],
                  )
                ],
              ))),
    );
  }
}
