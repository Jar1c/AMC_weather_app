import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather.dart'; // Adjust the import path to your weather model file

void main() {
  group('Weather.fromJson', () {
    test('should correctly parse a valid JSON response from OpenWeatherMap', () {
      // 1. Arrange: A realistic JSON sample for Manila from OpenWeatherMap
      const String manilaJsonSample = '''
      {
        "coord": {
          "lon": 120.9822,
          "lat": 14.6042
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 31.91,
          "feels_like": 38.91,
          "temp_min": 30.94,
          "temp_max": 32.21,
          "pressure": 1009,
          "humidity": 70
        },
        "visibility": 10000,
        "wind": {
          "speed": 3.6,
          "deg": 110
        },
        "clouds": {
          "all": 75
        },
        "dt": 1683857386,
        "sys": {
          "type": 1,
          "id": 8160,
          "country": "PH",
          "sunrise": 1683839903,
          "sunset": 1683886400
        },
        "timezone": 28800,
        "id": 1701668,
        "name": "Manila",
        "cod": 200
      }
      ''';

      // 2. Act: Parse the JSON string and create a Weather object
      final Map<String, dynamic> jsonData = jsonDecode(manilaJsonSample);
      final weather = Weather.fromJson(jsonData);

      // 3. Assert: Verify that the object was created with the correct data
      expect(weather, isA<Weather>());
      expect(weather.city, 'Manila');
      expect(weather.temperature, 31.91);
      expect(weather.humidity, 70);
      expect(weather.windSpeed, 3.6);
    });
  });
}
