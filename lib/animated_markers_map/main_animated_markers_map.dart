import 'package:flutter/material.dart';
import 'package:mansau_sabah/pages/nav_pages/map_page.dart';

class MainAnimatedMarkersMap extends StatelessWidget {
  const MainAnimatedMarkersMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData.light(), child: MapPage(),);
  }
}

