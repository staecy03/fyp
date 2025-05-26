import 'package:flutter/material.dart';
import 'package:mansau_sabah/models/spot.dart';
import 'package:mansau_sabah/pages/nav_pages/main_attractions.dart'; // for SpotCategory enum

class CardDistrict extends StatelessWidget {
  const CardDistrict({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Explore Sabah")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDistrictCard(
            context,
            title: 'Kota Kinabalu',
            imagePath: 'assets/gayaStreet.JPG',
            category: SpotCategory.KotaKinabalu,
          ),
          _buildDistrictCard(
            context,
            title: 'Penampang',
            imagePath: 'assets/kdca.jpg',
            category: SpotCategory.Penampang,
          ),
          _buildDistrictCard(
            context,
            title: 'Papar',
            imagePath: 'assets/kawang.jpg',
            category: SpotCategory.Papar,
          ),
          _buildDistrictCard(
            context,
            title: 'Tuaran',
            imagePath: 'assets/lotud.jpg',
            category: SpotCategory.Tuaran,
          ),
        ],
      ),
    );
  }

  Widget _buildDistrictCard(BuildContext context,
      {required String title,
      required String imagePath,
      required SpotCategory category}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MainAttractionPage(
              districtName: title,
              imagePath: imagePath,
              category: category,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.black.withOpacity(0.4),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:mansau_sabah/models/spot.dart';
import 'district_detail_page.dart'; // <-- create this file later

class CardDistrict extends StatelessWidget {
  final List<Map<String, dynamic>> districts = [
    {
      'name': 'Kota Kinabalu',
      'image': 'assets/gayaStreet.JPG',
      'places': ['Tanjung Aru Beach', 'Signal Hill', 'Jesselton Point'],
    },
    {
      'name': 'Penampang',
      'image': 'assets/kdca.jpg',
      'places': ['KDCA Cultural Village', 'Donggongon Market'],
    },
    {
      'name': 'Papar',
      'image': 'assets/kawang.jpg',
      'places': ['Desa Dairy Farm', 'Poring Hot Springs', 'Sabah Tea Garden'],
    },
    {
      'name': 'Tuaran',
      'image': 'assets/lotud.jpg',
      'places': ['Tawau Hills Park', 'Teck Guan Cocoa Museum'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mansau Sabah - Main Menu'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: districts.length,
        itemBuilder: (context, index) {
          final district = districts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DistrictDetailPage(
                    districtName: district['name'],
                    imagePath: district['image'],
                    category: SpotCategory.KotaKinabalu,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 15),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      district['image'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 180,
                    ),
                  ),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      district['name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}*/

/*class CardDistrict extends StatelessWidget {
  final List<Map<String, String>> districts = [
    {
      'name': 'Kota Kinabalu',
      'image': 'assets/gayaStreet.JPG',
    },
    {
      'name': 'Penampang',
      'image': 'assets/kdca.jpg',
    },
    {
      'name': 'Papar',
      'image': 'assets/kawang.jpg',
    },
    {
      'name': 'Tuaran',
      'image': 'assets/lotud.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mansau Sabah - Main Menu'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: districts.length,
        itemBuilder: (context, index) {
          final district = districts[index];
          return GestureDetector(
            onTap: () {
              // TODO: Navigate or do something on tap
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on ${district['name']}')),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 15),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      district['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 180,
                    ),
                  ),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      district['name']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 2, color: Colors.black)],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}*/
