import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';


class Location {

  //Settings of the GEOLOCATOR before initialization
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 100,
  );

  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try{
      Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);

      latitude = position.latitude;
      longitude = position.longitude;

    }catch (e){
      if (kDebugMode) {
        print(e);
      }
    }
  }
}