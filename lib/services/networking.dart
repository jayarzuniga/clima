import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class NetworkHelper {

  NetworkHelper(this.weatherUrl){
    networkUrl = Uri.parse(weatherUrl);
  }

  final String weatherUrl;
  late final Uri networkUrl;

  Future getData() async {
    http.Response res = await http.get(networkUrl);

    if (res.statusCode == 200) {
      String data = res.body;

      return jsonDecode(data);

    } else {
      if (kDebugMode) {
        print(res.statusCode);
      }
    }
  }
}