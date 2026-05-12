import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  static const String apiKey = '4f438a841d96bfdb774d939f1841e95c';

  // 🔥 Challenge 1 (Lat/Lon)
  Future<Weather> fetchWeatherByLatLon(double lat, double lon) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric');

    final res = await http.get(url);

    if (res.statusCode == 200) {
      return Weather.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  // 🔥 Challenge 2 (City → Lat/Lon → Weather)
  Future<Weather> fetchWeatherByCity(String city) async {

    // Step 1: Geocoding
    final geoUrl = Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=$apiKey');

    final geoRes = await http.get(geoUrl);

    if (geoRes.statusCode != 200) {
      throw Exception("City not found");
    }

    final geoData = jsonDecode(geoRes.body);

    final lat = geoData[0]['lat'];
    final lon = geoData[0]['lon'];

    // Step 2: Weather
    return fetchWeatherByLatLon(lat, lon);
  }
}