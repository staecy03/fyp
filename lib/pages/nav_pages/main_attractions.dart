import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mansau_sabah/models/guidebook.dart';
import 'package:mansau_sabah/models/spot.dart';
import 'package:mansau_sabah/components.dart/my_spot_tile.dart';
import 'package:mansau_sabah/pages/spot_page.dart';

class MainAttractionPage extends StatelessWidget {
  final String districtName;
  final String imagePath;
  final SpotCategory category;

  const MainAttractionPage({
    super.key,
    required this.districtName,
    required this.imagePath,
    required this.category,
  });

  List<Spot> _filterSpotsByCategory(List<Spot> allSpots) {
    return allSpots.where((spot) => spot.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Guidebook>(
        builder: (context, guidebook, child) {
          final List<Spot> filteredSpots =
              _filterSpotsByCategory(guidebook.menu);

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    districtName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                backgroundColor: Colors.teal,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(12.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final spot = filteredSpots[index];
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
                    childCount: filteredSpots.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

class DistrictDetailPage extends StatelessWidget {
  final String districtName;
  final String imagePath;
  final List<String> places;

  const DistrictDetailPage({
    Key? key,
    required this.districtName,
    required this.imagePath,
    required this.places,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(districtName),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Places to visit in $districtName',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.place, color: Colors.teal),
                  title: Text(places[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}*/
