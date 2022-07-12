import 'dart:convert';

import 'package:mobile_app_dev_project2/model/daily_forecast.dart';
import 'package:xml2json/xml2json.dart';

DailyForecast dailyForecastFromXML(String xml) {
  final xmlJsonTransformer = Xml2Json();
  xmlJsonTransformer.parse(xml);
  String jsonData = xmlJsonTransformer.toParkerWithAttrs();
  dynamic decodeData = json.decode(jsonData)["DailyForecast"];
  return DailyForecast.fromJson(decodeData);
}

String replaceDegWithCelsius(String original) {
  return original.replaceAll("&deg;C", "\u2103");
}

String formatDateForFireStore(String date) {
  return date.replaceAll('/', '-');
}
