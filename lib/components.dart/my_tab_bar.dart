//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mansau_sabah/models/spot.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key, 
    required this.tabController,
    });
 
   List<Tab> _buildCategoryTabs() {
    return SpotCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
   }


  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: TabBar(controller: tabController,
      tabs: _buildCategoryTabs(),
      ),
    );
  }
}