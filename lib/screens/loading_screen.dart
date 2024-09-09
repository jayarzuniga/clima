import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState () {
    super.initState();
    getLocation();
    getData();
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

  void getData() async {
    var latitude = 14.64;
    var longitude = 23.02;
    String apiKey = '36e94121d059ae358b36c7585e6999d2';

    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    // Await the response
    http.Response res = await http.get(url);

    jsonDecode(res.body);

    // Check if the response was successful
    if (res.statusCode == 200) {
      String data = res.body;

      double temperature = jsonDecode(data)['main']['temp'];
      int condition = jsonDecode(data)['weather'][0]['id'];
      String cityName = jsonDecode(data)['name'];

      if (kDebugMode) {
        print(cityName);
      }
    } else {
      if (kDebugMode) {
        print('Failed to load data: ${res.statusCode}');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
