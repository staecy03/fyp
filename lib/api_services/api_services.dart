import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mansau_sabah/api_services/models/place_from_coordinates.dart';

import '../constants.dart';
import 'models/get_coordinates_from_placeId.dart';
import 'models/get_places.dart';
import 'models/nearby_search_model.dart';

class ApiServices {
  Future<PlaceFromCoordinates> placeFromCoordinates(
      double lat, double lng) async {
    Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=${Constants.gcpKey}');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return PlaceFromCoordinates.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('API ERROR: placeFromCoordinates');
    }
  }
  
  Future<GetPlaces> getPlaces (String placeName) async{
    Uri url = Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=${Constants.gcpKey}');
    var response = await http.get(url);

    if(response.statusCode == 200){
      return GetPlaces.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('API ERROR: getPlaces');
    }
  }

  Future<GetCoordinatesFromPlaceId> getCoordinatesFromPlaceId (String placeId) async{
    Uri url = Uri.parse('https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=${Constants.gcpKey}');
    var response = await http.get(url);

    if(response.statusCode == 200){
      return GetCoordinatesFromPlaceId.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('API ERROR: getPlaces');
    }
  }



  Future<NearBySearchModel> getNearbySearch (double lat, double lng, String text) async{
    Uri url = Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=1000&types=$text&key=${Constants.gcpKey}');
    var response = await http.get(url);

    print('Response: ${jsonDecode(response.body)}');
    if(response.statusCode == 200){

      return NearBySearchModel.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('API ERROR: getNearbySearch');
    }
  }







}



