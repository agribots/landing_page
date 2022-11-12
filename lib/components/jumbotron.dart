import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/components/main_button.dart';
import 'package:flutter_web/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class Jumbotron extends StatelessWidget {
  Jumbotron({
    Key key,
    @required this.itemScrollController,
  }) : super(key: key);

  ItemScrollController itemScrollController;

  _sendMail(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: isMobile(context) ? size.height * 0.65 : size.height * 0.6,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/dark-farm.png"),
            fit: BoxFit.cover,
          ),
        ),
        // margin: EdgeInsets.symmetric(vertical: 4, horizontal: 40),
        child: Row(
          children: <Widget>[
            Expanded(
              child: BlurryContainer(
                blur: 3,
                elevation: 0,
                color: Colors.transparent,
                padding: const EdgeInsets.all(8),
                // borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding: EdgeInsets.only(right: !isMobile(context) ? 40 : 0),
                  margin: EdgeInsets.all(20),
                  child: Center(
                      child: Container(
                    margin: isMobile(context)
                        ? EdgeInsets.all(12)
                        : EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: !isMobile(context)
                          ? MainAxisAlignment.center
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
                                  text: 'Farming Reimagined',
                                  style: GoogleFonts.notoSans(
                                      fontSize: isDesktop(context) ? 42 : 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightGreen)),
                            ])),
                        Text(
                          'The final IoT solution for delicate crops',
                          textAlign: !isMobile(context)
                              ? TextAlign.start
                              : TextAlign.center,
                          style: GoogleFonts.notoSans(
                              fontSize: isDesktop(context) ? 36 : 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Container(
                          constraints: isMobile(context)
                              ? null
                              : BoxConstraints(
                                  maxWidth: size.width * 0.7,
                                  //maximum width set to 100% of width
                                ),
                          child: Text(
                            "Autonomous robots that improve plant health and yield while reducing environmental impact.",
                            textAlign: isMobile(context)
                                ? TextAlign.center
                                : TextAlign.start,
                            style: TextStyle(
                                fontSize: isDesktop(context) ? 22 : 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 16),
                        Wrap(
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            MainButton(
                              title: 'Get In Touch',
                              color: kPrimaryColor,
                              tapEvent: () {
                                _sendMail(
                                    'yohanderose@gmail.com',
                                    'AgriBots Inquiry',
                                    'Hello, we are curious about...');
                              },
                            ),
                            SizedBox(width: 10),
                            MainButton(
                              title: 'About Us',
                              color: kSecondaryColor,
                              tapEvent: () {
                                itemScrollController.scrollTo(
                                    curve: Curves.easeInOut,
                                    index: 1,
                                    duration: Duration(milliseconds: 500));
                              },
                            ),
                            SizedBox(width: 10),
                            MainButton(
                              title: 'Pricing',
                              color: kSecondaryColor,
                              tapEvent: () {
                                itemScrollController.scrollTo(
                                    curve: Curves.easeInOut,
                                    index: 2,
                                    duration: Duration(
                                      milliseconds: 700,
                                    ));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                ),
              ),
            ),
            // if (isDesktop(context) || isTab(context))
            //   Expanded(
            //       // <a href="http://www.freepik.com">Designed by pch.vector / Freepik</a>
            //       child: Image.asset(
            //     'assets/images/logo-trans.png',
            //     height: size.height * 0.7,
            //   ))
          ],
        ));
  }
}
