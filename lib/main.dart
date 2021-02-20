import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine_treatment/Entry/registration_page.dart';
import 'package:telemedicine_treatment/main_pages/home_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tele Health",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    displaySplash();
  }
  displaySplash(){
    Timer(Duration(seconds: 5),()async{
      Route route=MaterialPageRoute(builder: (_)=>HomePage());
      Navigator.pushReplacement(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo.jpg"),
              SizedBox(height: 20,),
              Text(
                "Herb-n-Wellness offers Immune Primary Care \n and Holistic  Healthcare Services Worldwide",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

