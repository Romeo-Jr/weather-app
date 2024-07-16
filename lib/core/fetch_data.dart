// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_models.dart';



Future<WeatherData> fetchWeather(String q) async {
  final url = Uri.parse('http://api.weatherapi.com/v1/forecast.json');
  final params = {
    'key': dotenv.env['API_KEY'],
    'q': q,
    // Add other optional parameters as needed (e.g., days, aqi)
  };

  final uriWithParams = url.replace(queryParameters: params);
  final response = await http.get(uriWithParams);

  if (response.statusCode == 200) {
    return WeatherData.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception ('Invalid Place name');
  }
}

