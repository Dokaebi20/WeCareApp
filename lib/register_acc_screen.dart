import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:WeCare/main.dart';

class RegisterAccScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Account',
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
                    children: [
                      Expanded(
                          flex: 4,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: ListView(
                                shrinkWrap: true,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 50,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          border: InputBorder.none,
                                          labelText: 'FULL NAME',
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
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 50,
                                    child: TextField(
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
                                            color: Color.fromARGB(
                                                255, 94, 154, 182),
                                            width: 4,
                                            style: BorderStyle.solid)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    alignment: Alignment.center,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          setDate != null
                                              ? Text(
                                                  "${setDate.day.toString()}-${setDate.month.toString()}-${setDate.year.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18))
                                              : Text(
                                                  "Choose Your Date of Birth",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                          IconButton(
                                            iconSize: 30,
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
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: (20)),
                                    height: 50,
                                    child: TextField(
                                      maxLength: 11,
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
                                          labelText: 'No Hp.',
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
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: (20)),
                                    height: 50,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          counterText: '',
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          border: InputBorder.none,
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
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 50,
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          border: InputBorder.none,
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
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 50,
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          border: InputBorder.none,
                                          labelText: 'CONFIRM PASSWORD',
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
                                ],
                              ))),
                      Expanded(
                          flex: 1,
                          child: Container(
                              alignment: Alignment.topCenter,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                          50),
                                      primary:
                                          Color.fromARGB(255, 94, 154, 182),
                                      side: BorderSide(
                                          width: 3, color: Colors.transparent),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: Center(
                                      child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Successfully Registered!")));
                                    Timer(Duration(seconds: 2), () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    });
                                  })))
                    ],
                  )
                ],
              ))),
    );
  }
}
