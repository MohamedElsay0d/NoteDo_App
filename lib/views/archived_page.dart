import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Archived'),
            SizedBox(width: 8),
            Icon(
              Ionicons.ios_archive,
              // color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
