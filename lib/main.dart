import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';
import 'package:flutter_web/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'agriBots',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: GoogleFonts.getTextTheme('Noto Sans')),
      home: HomeScreen(),
    );
  }
}
