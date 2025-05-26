import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mansau_sabah/models/map_marker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mansau_sabah/pages/spot_page.dart';

//import 'package:mansau_sabah/pages/spot_map_detail.dart';

const MAPBOX_ACCESS_TOKEN =
    'sk.eyJ1Ijoic3RhZWN5IiwiYSI6ImNtOGJ4N20yaDFvanAya3F1enhoc2VpejEifQ.bwLEhwWrL6oUQoZbnk41Ig';
const MAPBOX_STYLE = 'mapbox/outdoors-v12';
const MARKER_COLOR = Color.fromARGB(255, 73, 42, 193);
const MARKER_SIZE_EXPANDED = 55.0;
const MARKER_SIZE_SHRINKED = 35.0;

final _myLocation = LatLng(5.9844, 116.0773);

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  late final AnimationController _animationController;
  int _selectedIndex = 0;
  LatLng _searchedLocation = _myLocation;
  TextEditingController _searchController = TextEditingController();

  Future<void> _searchPlace(String query) async {
    final url = Uri.parse(
        'https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json?access_token=$MAPBOX_ACCESS_TOKEN');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['features'].isNotEmpty) {
        final firstResult = data['features'][0];
        final double lng = firstResult['center'][0];
        final double lat = firstResult['center'][1];

        setState(() {
          _searchedLocation = LatLng(lat, lng);
        });
      }
    }
  }

  List<Marker> _buildMarkers() {
    final markerList = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      markerList.add(
        Marker(
          height: MARKER_SIZE_EXPANDED,
          width: MARKER_SIZE_SHRINKED,
          point: mapItem.location,
          child: GestureDetector(
            onTap: () {
              _selectedIndex = i;
              setState(() {
                _pageController.animateToPage(i,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.elasticOut);
              });
            },
            child: _LocationMarker(
              selected: _selectedIndex == i,
            ),
          ),
        ),
      );
    }
    return markerList;
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildMarkers();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sabah Map'),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(Icons.filter_alt_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 16,
              initialZoom: 13,
              initialCenter: _searchedLocation,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                additionalOptions: {
                  'accessToken': MAPBOX_ACCESS_TOKEN,
                  'id': MAPBOX_STYLE,
                },
              ),
              MarkerLayer(markers: _markers),
              MarkerLayer(markers: [
                Marker(
                  height: 60,
                  width: 60,
                  point: _searchedLocation,
                  child: _MyLocationMarker(_animationController),
                ),
              ]),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search district...",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => _searchPlace(_searchController.text),
                  ),
                ),
                onSubmitted: _searchPlace,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mapMarkers.length,
                itemBuilder: (context, index) {
                  final item = mapMarkers[index];
                  return _MapItemDetails(
                    mapMarker: item,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class _LocationMarker extends StatelessWidget {
  // ignore: unused_element
  const _LocationMarker({super.key, this.selected = false});
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final size = selected ? MARKER_SIZE_EXPANDED : MARKER_SIZE_SHRINKED;
    return Center(
      child: AnimatedContainer(
        height: size,
        width: size,
        duration: const Duration(milliseconds: 400),
        child: Image.asset('assets/pin.png'),
      ),
    );
  }
}

class _MyLocationMarker extends AnimatedWidget {
  const _MyLocationMarker(Animation<double> animation, {Key? key})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final value = (listenable as Animation<double>).value;
    final size = 50.0;
    return Center(
      child: Stack(
        children: [
          Center(
            child: Container(
                height: size * value,
                width: size * value,
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 15, 108, 51).withOpacity(0.5),
                  shape: BoxShape.circle,
                )),
          ),
          Center(
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: MARKER_COLOR,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapItemDetails extends StatelessWidget {
  const _MapItemDetails({
    // ignore: unused_element
    super.key,
    required this.mapMarker,
  });

  final MapMarker mapMarker;

  @override
  Widget build(BuildContext context) {
    final _styleTitle = TextStyle(
        color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold);
    final _styleAddress = TextStyle(color: Colors.grey[800], fontSize: 14);
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(mapMarker.image),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          mapMarker.title,
                          style: _styleTitle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          mapMarker.address,
                          style: _styleAddress,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpotPage(spot: mapMarker.spot),
                    ),
                  );
                },
                child: Text("More Info"),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
