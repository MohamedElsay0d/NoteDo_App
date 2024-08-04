import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:line_icons/line_icons.dart';

List sectionOneList = [
  {
    "icon": LineIcons.bloggerB,
    "text": "Notes",
    "color": Colors.blue[700],
  },
  {
    "icon": LineIcons.list,
    "text": "Todos",
    "color": Colors.green,
  },
  {
    "icon": Ionicons.ios_calculator,
    "text": "Calculator",
    "color": const Color(0xFFFCAA26),
  },
  {
    "icon": MaterialIcons.g_translate,
    "text": "Translate",
    "color": const Color.fromARGB(255, 255, 0, 0),
  },
];

List sectionTwoList = [
  {
    "icon": FontAwesome.share_alt_square,
    "text": "Share app",
    "color": Colors.blue[700],
    "route": const Scaffold(
      body: Center(
        child: Text('Share Screen'),
      ),
    ),
  },
  {
    "icon": Ionicons.ios_help,
    "text": "Help & Feedback",
    "color": Colors.green,
    "route": const Scaffold(
      body: Center(
        child: Text('Help & Feedback Screen'),
      ),
    ),
  },
];
