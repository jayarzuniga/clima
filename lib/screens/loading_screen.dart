import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Settings of the GEOLOCATOR before initialization
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 100,
  );

  // Function to get the location of the phone
  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      if (kDebugMode) {
        print('Location permission denied');
      }
      return;
    }

    Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);

    if (kDebugMode) {
      print(position);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(

          onPressed: () {
            getLocation();
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent.shade700),
            minimumSize: WidgetStatePropertyAll(Size(150.0, 80.0)),
          ),


          child: const Text(
              'Get Location',
            style: TextStyle(
              fontSize: 30.0
            ),

          ),
        ),
      ),
    );
  }
}
