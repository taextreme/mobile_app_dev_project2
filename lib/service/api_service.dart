import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_dev_project2/data/user_update_data.dart';
import 'package:mobile_app_dev_project2/model/daily_forecast.dart';
import 'package:mobile_app_dev_project2/service/firestore_service.dart';
import 'package:mobile_app_dev_project2/utils/constants.dart';
import 'package:mobile_app_dev_project2/utils/time_utils.dart';

class ApiService {
  Future<DailyForecast> fetchDailyForecast() async {
    if (checkUpdateTime(stringToTime(UserUpdateData.getLastUpdateData()))) {
      try {
        var response = await http.get(Uri.parse(dailyForecastUrl));
        if (response.statusCode == 200) {
          dynamic decodeData =
              json.decode(response.body.toString())["DailyForecast"];
          DailyForecast dailyForecast = DailyForecast.fromJson(decodeData);
          log("Update Data to Firestore");
          FirestoreService()
              .setDailyForecast(dailyForecast.date, dailyForecast);
          UserUpdateData.setDate(dailyForecast.date);
          UserUpdateData.setLastUpdateData(timeToString(TimeOfDay.now()));
          return dailyForecast;
        }
        log("Get Data From Firestore because cannot receive request from API.");
        return FirestoreService().getDailyForecast(UserUpdateData.getDate());
      } catch (e) {
        log(e.toString());
      }
    }
    log("Get Data From Firestore because no need to Update yet.");
    return FirestoreService().getDailyForecast(UserUpdateData.getDate());
  }
}
