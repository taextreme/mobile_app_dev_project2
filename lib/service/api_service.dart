import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:mobile_app_dev_project2/model/daily_forecast.dart';
import 'package:mobile_app_dev_project2/utils/constants.dart';

class ApiService {
  Future<DailyForecast?> fetchDailyForecast() async {
    try {
      var response = await http.get(Uri.parse(dailyForecastUrl));
      if (response.statusCode == 200) {
        DailyForecast dailyForecast = DailyForecast.fromJson(jsonDecode(response.body)["DailyForecast"]);
        return dailyForecast;
      }
    }
    catch (e) {
      print(e.toString());
    }
    return null;
  }
}