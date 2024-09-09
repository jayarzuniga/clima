import 'package:clima/services/networking.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String apiKey = '36e94121d059ae358b36c7585e6999d2';

  @override
  void initState () {
    super.initState();
    getLocationData();
  }

  // Function to get the location of the phone
  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    double latitude = location.latitude;
    double longitude = location.longitude;

    NetworkHelper networkHelper =
      NetworkHelper("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");

    var weatherData = await networkHelper.getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
