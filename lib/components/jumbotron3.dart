import 'package:flutter/material.dart';
import 'package:flutter_web/components/main_button.dart';
import 'package:flutter_web/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class Jumbotron3 extends StatelessWidget {
  const Jumbotron3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: isMobile(context) ? size.height * 0.20 : size.height * 0.50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pricing.png"),
            fit: BoxFit.fill,
          ),
        ));
  }
}
