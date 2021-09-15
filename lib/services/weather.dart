import '../services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '3e32d16e9151ed82f714b5ae1568e40a';
const String openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper helper = NetworkHelper(
        url:
            '$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var data = await helper.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
