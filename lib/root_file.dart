import 'package:flutter/material.dart';
import 'package:food_api/pages/account_page.dart';
import 'package:food_api/pages/favorites_page.dart';
import 'package:food_api/pages/help_page.dart';
import 'package:food_api/pages/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  final screens = [
    HomePage(),
    Favorites(),
    Account(),
    HelpPage(),
  ];

  int index = 0;
  final items = <Widget>[
    Icon(
      FontAwesomeIcons.home,
      size: 30,
    ),
    const Icon(
      FontAwesomeIcons.heart,
      size: 30,
    ),
    const Icon(
      FontAwesomeIcons.user,
      size: 30,
    ),
    const Icon(
      FontAwesomeIcons.question,
      size: 30,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: Color.fromRGBO(39, 89, 110, 1.0),
          backgroundColor: Colors.transparent,
          height: 60,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
