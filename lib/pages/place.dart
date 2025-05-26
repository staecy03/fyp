//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  String name;
  String id;
  LatLng position;

  Place({required this.id, required this.name, required this.position});

  factory Place.fromJson(Map<String, dynamic> json) {
    final id = json['id'].toString();
    final name = json['tags']?['name'] ?? "Unnamed Place";
    final lat = (json['lat'] as num?)?.toDouble() ?? 0.0;
    final lon = (json['lon'] as num?)?.toDouble() ?? 0.0;
    final position = LatLng(lat, lon);
    return Place(id: id, name: name, position: position);
  }
}


/*class Place {
  String name;
  String id;
  LatLng position; // Changed to LatLng

  Place({required this.id, required this.name, required this.position});

  factory Place.fromJson(Map<String, dynamic> json) {
    final id = json['id'].toString();
    final name = json['tags'] != null && json['tags']['name'] != null ? json['tags']['name'].toString() : "Unnamed Place"; //Improved null safety
    final lat = (json['lat'] is num) ? json['lat'].toDouble() : 0.0; //Improved type handling
    final lon = (json['lon'] is num) ? json['lon'].toDouble() : 0.0; //Improved type handling
    final position = LatLng(lat, lon);
    return Place(id: id, name: name, position: position);
  }
}

class LatLng {
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);

  @override
  String toString() {
    return 'LatLng(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatLng &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

}*/


/*class Place {
  String name;
  String id;
  String position;
  Place({required this.id, required this.name, required this.position});
  factory Place.fromJson(Map<String, dynamic> json) {
    final id = json['id'].toString();
    final name = json['tags']['name'] ?? "Unnamed Place";
    final lat = json['lat']?.toDouble() ?? 0.0;
    final lon = json['lon']?.toDouble() ?? 0.0;
    final position = LatLng(lat, lon);
    return Place(id: id, name: name, position: position);
  }
}*/
