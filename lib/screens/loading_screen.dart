import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState () {
    super.initState();
    getLocation();
  }

  // Function to get the location of the phone
  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    if (kDebugMode) {
      print(location.latitude);
    }
    if (kDebugMode) {
      print(location.longitude);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
