//principais imports
import 'package:flutter/material.dart';

//imports adicionais
import 'package:custom_splash/custom_splash.dart';

//imports externos
import 'home.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CustomSplash(
      imagePath: 'images/giphy3.gif',
      backGroundColor: Colors.amber,
      animationEffect: 'top-down',
      logoSize: 250,
      home: Home(),
      // customFunction: duringSplash,
      duration: 4000,
      type: CustomSplashType.StaticDuration,
      // outputAndHome: op,
    ),
    theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.amberAccent),
  ));
}
