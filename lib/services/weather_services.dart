// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import '../models/weather.dart';
// //
// //
// // class WeatherServices {
// //   static const String apiKey = "dbea7c72bb570865035c22e5732e29f2";
// //   static const String apiUrl = "https://api.openweathermap.org/data/2.5/weather";
// //
// // static Future<Weather> getWeather(String city) async {
// //   try {
// //     final String url = '$baseUrl?q=$city&appid=$apiKey&units=metrics';
// //     final http.Response response = await http.get(Uri.parse(url),
// //     headers: {'Content-Type': 'application/json'},
// //     );
// //
// //     if (response.statusCode == 200) {
// //       final Map<String, dynamic> data = jsonDecode(response.body);
// //       return Weather.fromJson(data);
// //     }
// //     else if (response.statusCode == 404) {
// //       throw Exception('City not found');
// //     }
// //     else {
// //       throw Exception('Failed to load weather data. Status ${response.statusCode}');
// //     }
// //
// //   }
// //
// //   catch(e) {
// //     throw Exception('Error fetching weather data: $e');
// //   }
// // }
// // }
//
// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/weather.dart';
//
//
// class WeatherService {
//   static const String apiKey = "dbea7c72bb570865035c22e5732e29f2";
//   static const String apiUrl = "https://api.openweathermap.org/data/2.5/weather";
//
//   static Future<Weather> getWeather(String cityName) async {
//     try {
//       final String url ='$apiUrl?q=$cityName&appid=$apiKey&units=metrics';
//       final http.Response response = await http.get(Uri.parse(url),
//         headers: {'Content-Type': 'application/json'},
//       );
//
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = jsonDecode(response.body);
//         return Weather.fromJson(data);
//       }
//       else if (response.statusCode ==404) {
//         throw Exception('City not found');
//       }
//       else {
//         throw Exception('Failed to load weather data. Status ${response.statusCode}');
//       }
//
//     }
//
//     catch (e) {
//       throw Exception('error fetching weather data: $e');
//     }
//   }
// }
//

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';

class WeatherService {
  static const String apiKey = "dbea7c72bb570865035c22e5732e29f2";
  static const String apiUrl = "https://api.openweathermap.org/data/2.5/weather";

  static Future<Weather> getWeather(String cityName) async {
    try {
      final String url = '$apiUrl?q=$cityName&appid=$apiKey&units=metric';

      final http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return Weather.fromJson(data);
      } else if (response.statusCode == 404) {
        throw Exception('City not found');
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Error fetching weather data: $e');
    }
  }
}

