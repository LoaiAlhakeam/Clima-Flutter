import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    getWeather();
    return Scaffold();
  }
}

void getLocation() async {
  Location location = Location();
  await location.getCurrentLocation();

  print("latitude = " + location.latitude.toString());
  print("longitude = " + location.longitude.toString());
}

void getWeather() async {
  Uri url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=3e32d16e9151ed82f714b5ae1568e40a');
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print(response.statusCode);
  }
}
