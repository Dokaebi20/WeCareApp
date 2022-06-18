import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ug44/home_screen.dart';
import 'package:ug44/register_acc_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: "Aldrich"),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 3000),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
            child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(
                    'assets/SplashScreen.png',
                  ),
                  fit: BoxFit.fill,
                ))));
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyLoginScreen(title: ''),
    );
  }
}

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyLoginScreen> createState() => MyLoginScreenState();
}

class MyLoginScreenState extends State<MyLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 0, 62, 80),
      child: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
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
              child: Image.asset(
                'assets/icon.png',
                width: 300,
                height: 300,
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'E-MAIL',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Color.fromARGB(255, 94, 154, 182),
                                  width: 4,
                                  style: BorderStyle.solid)),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Color.fromARGB(255, 94, 154, 182),
                                  width: 4,
                                  style: BorderStyle.solid)),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserHomeScreen()));
                            },
                            child: Container(
                              child: Image.asset(
                                "assets/loginIcon.png",
                                width: 100,
                                height: 100,
                              ),
                            )),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't Have Account? ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterAccScreen()));
                                  },
                                  child: Text("Register Account",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 94, 154, 182),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )))
                            ],
                          ),
                        ),
                      ],
                    )))
          ],
        )
      ]),
    ));
  }
}
