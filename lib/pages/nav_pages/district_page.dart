//import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:mansau_sabah/components.dart/my_sliver_app_bar.dart';
import 'package:mansau_sabah/components.dart/my_spot_tile.dart';
import 'package:mansau_sabah/components.dart/my_tab_bar.dart';
//import 'package:mansau_sabah/components.dart/my_tab_bar.dart';
import 'package:mansau_sabah/models/guidebook.dart';
import 'package:mansau_sabah/models/spot.dart';
import 'package:mansau_sabah/pages/spot_page.dart';
import 'package:provider/provider.dart';
//import 'package:mansau_sabah/models/guidebook.dart';
//import 'package:mansau_sabah/models/spot.dart';
//import 'package:flutter/services.dart';
//import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
//import 'package:flutter/cupertino.dart';

class DistrictPage extends StatefulWidget {
  const DistrictPage({super.key});

  @override
  State<DistrictPage> createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: SpotCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //sort out and return a list of food items that belong to a specific category
  List<Spot> _filterMenuByCategory(SpotCategory category, List<Spot> fullMenu) {
    return fullMenu.where((spot) => spot.category == category).toList();
  }

  //return list of foods in given category
  List<Widget> getSpotInThisCategory(List<Spot> fullMenu) {
    return SpotCategory.values.map((category) {
      //get category menu
      List<Spot> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual spot
          final spot = categoryMenu[index];

          //return food tile UI
          return SpotTile(
            spot: spot,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SpotPage(spot: spot),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(
          "Districts to visit",
          style: GoogleFonts.dmSerifDisplay(color: Colors.white),
        ),
        backgroundColor: Colors.teal.shade600,
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: MyTabBar(tabController: _tabController)),
      ),*/
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
              title: MyTabBar(
                tabController: _tabController,
              ),
              child: Text('.'))
        ],
        body: Consumer<Guidebook>(
          builder: (context, guidebook, child) => TabBarView(
            controller: _tabController,
            children: getSpotInThisCategory(guidebook.menu),
          ),
        ),
      ),
      /*body: Consumer<Guidebook>(
        builder: (context, guidebook, child) => TabBarView(
          controller: _tabController,
          children: getSpotInThisCategory(guidebook.menu),
        ),
      ),*/
    );
  }
}
