import 'package:flutter/material.dart';
import 'package:mansau_sabah/models/map_marker.dart';

class SpotDetailPage extends StatelessWidget {
  final MapMarker mapMarker;

  const SpotDetailPage({super.key, required this.mapMarker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mapMarker.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(mapMarker.image),
            SizedBox(height: 16),
            Text(
              mapMarker.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              mapMarker.address,
              style: TextStyle(color: Colors.grey[700], fontSize: 18),
            ),
            SizedBox(height: 20),
            // Add more information here about the spot
            Text(
              'Additional details about ${mapMarker.title} will go here.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Go back to the map page or another page if needed
                Navigator.pop(context);
              },
              child: Text('Back to Map'),
            ),
          ],
        ),
      ),
    );
  }
}
