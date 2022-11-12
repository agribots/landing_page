import 'package:flutter/material.dart';
import 'package:flutter_web/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (!isMobile(context)) ? DesktopFooter() : MobileFooter();
  }
}

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({
    Key key,
  }) : super(key: key);

  _openLink(String link) async {
    try {
      await launchUrl(Uri.parse(link));
    } catch (e) {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'All Right Reserved © 2022',
            style: TextStyle(fontSize: 10),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              NavItem(
                title: 'Twitter',
                tapEvent: () {
                  _openLink('https://twitter.com/yohanderose');
                },
              ),
              NavItem(
                title: 'Linkedin',
                tapEvent: () {
                  _openLink('https://www.linkedin.com/company/agribots-farm/');
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class MobileFooter extends StatelessWidget {
  const MobileFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        children: <Widget>[
          Text(
            'All Right Reserved',
            style: TextStyle(fontSize: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NavItem(
                title: 'Twitter',
                tapEvent: () {},
              ),
              NavItem(
                title: 'Facebook',
                tapEvent: () {},
              ),
              NavItem(
                title: 'Linkedin',
                tapEvent: () {},
              ),
              NavItem(
                title: 'Instagram',
                tapEvent: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({Key key, @required this.title, @required this.tapEvent})
      : super(key: key);

  final String title;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      hoverColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: TextStyle(color: kPrimaryColor, fontSize: 12),
        ),
      ),
    );
  }
}
