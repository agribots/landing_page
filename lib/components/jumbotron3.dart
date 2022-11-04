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
                      'assets/images/logo.png',
                      height: size.height * 0.08,
                    ),
                  RichText(
                      textAlign: !isMobile(context)
                          ? TextAlign.start
                          : TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Farming Reimagined',
                            style: GoogleFonts.notoSans(
                                fontSize: isDesktop(context) ? 64 : 32,
                                fontWeight: FontWeight.w800,
                                color: kPrimaryColor)),
                      ])),
                  Text(
                    'Innovative IoT solutions for delicate crops',
                    textAlign:
                        !isMobile(context) ? TextAlign.start : TextAlign.center,
                    style: GoogleFonts.notoSans(
                        fontSize: isDesktop(context) ? 40 : 20,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Harness the latest hardware and software to autonomously improve plant health and yield, while reducing environmental impact.",
                    textAlign:
                        isMobile(context) ? TextAlign.center : TextAlign.start,
                    style: TextStyle(
                        fontSize: isDesktop(context) ? 16 : 16,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      MainButton(
                        title: 'Get Started',
                        color: kPrimaryColor,
                        tapEvent: () {},
                      ),
                      SizedBox(width: 10),
                      MainButton(
                        title: 'About Us',
                        color: kSecondaryColor,
                        tapEvent: () {},
                      )
                    ],
                  )
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
