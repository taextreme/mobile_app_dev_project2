import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mobile_app_dev_project2/model/daily_forecast.dart';
import 'package:mobile_app_dev_project2/utils/constants.dart';

class ApiService {
  Future<DailyForecast> fetchDailyForecast() async {
    try {
      var response = await http.get(Uri.parse(dailyForecastUrl));
      if (response.statusCode == 200) {
        dynamic decodeData =
            json.decode(response.body.toString())["DailyForecast"];
        DailyForecast dailyForecast = DailyForecast.fromJson(decodeData);
        return dailyForecast;
      }
    } catch (e) {
      log(e.toString());
    }
    return const DailyForecast(
        date: "ERROR!",
        overallDescriptionThai: "ข้อผิดพลาด!",
        overallDescriptionEnglish: "ERROR!",
        regionsForecast: []);
  }
}
