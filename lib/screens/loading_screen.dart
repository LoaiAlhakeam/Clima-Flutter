import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '3e32d16e9151ed82f714b5ae1568e40a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper helper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var data = await helper.getData();
  }
}

// var temp = jsonDecode(data)['main']['temp'];
// var id = jsonDecode(data)['weather'][0]['id'];
// var name = jsonDecode(data)['name'];
// print(temp);
// print(id);
// print(name);
