import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notedo_app/json/drawer_items_json.dart';
import 'package:notedo_app/widgets/drawer_sections.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 24),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              border: Border.all(
                  width: 20,
                  color: Colors.black.withOpacity(0.2),
                  strokeAlign: BorderSide.strokeAlignOutside),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              LineIcons.bloggerB,
              size: 90,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'NoteDo App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          Text(
            'Version 1.0.0',
            style: TextStyle(),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Column(
              children: [
                Sections(
                  listLength: sectionOneList.length,
                  listOfContent: sectionOneList,
                ),
                Sections(
                  listLength: sectionTwoList.length,
                  listOfContent: sectionTwoList,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            width: double.infinity,
            height: 60,
            color: Colors.red,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Icon(FontAwesome.sign_out, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
