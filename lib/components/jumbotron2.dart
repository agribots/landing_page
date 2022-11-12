import 'package:flutter/material.dart';
import 'package:flutter_web/components/main_button.dart';
import 'package:flutter_web/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class Jumbotron2 extends StatelessWidget {
  const Jumbotron2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 40),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(right: !isMobile(context) ? 40 : 0),
              child: Column(
                mainAxisAlignment: !isMobile(context)
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                crossAxisAlignment: !isMobile(context)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: <Widget>[
                  if (isMobile(context))
                    Image.asset(
                      'assets/images/logo-trans.png',
                      height: size.height * 0.08,
                    ),
                  RichText(
                      textAlign: !isMobile(context)
                          ? TextAlign.start
                          : TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'About Us',
                            style: GoogleFonts.notoSans(
                                fontSize: isDesktop(context) ? 48 : 28,
                                fontWeight: FontWeight.w800,
                                color: kPrimaryColor)),
                      ])),
                  Text(
                    'Precisely control and monitor your farm from anywhere',
                    textAlign:
                        !isMobile(context) ? TextAlign.start : TextAlign.center,
                    style: GoogleFonts.notoSans(
                        fontSize: isDesktop(context) ? 32 : 18,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We are a team based in Bangkok dedicated to making farming more efficient. \n\nWe install a network of devices to monitor soil moisture, temperature, humidity and light - and automatically make fine adjustments as needed.",
                    textAlign:
                        isMobile(context) ? TextAlign.center : TextAlign.start,
                    style: TextStyle(
                        fontSize: isDesktop(context) ? 16 : 16,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            )),
            if (isDesktop(context) || isTab(context))
              Expanded(
                  // <a href="http://www.freepik.com">Designed by pch.vector / Freepik</a>
                  child: Image.asset(
                'assets/images/logo-trans.png',
                height: size.height * 0.7,
              ))
          ],
        ));
  }
}
