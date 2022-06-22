import 'package:flutter/material.dart';
import 'package:mobile_app_dev_project2/component/base_card.dart';
import 'package:mobile_app_dev_project2/model/daily_forecast.dart';
import 'package:mobile_app_dev_project2/test_resources/test_forecast.dart';
import 'package:mobile_app_dev_project2/utils/data_utils.dart';
import 'package:mobile_app_dev_project2/utils/weather_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DailyForecast forecast =
        dailyForecastFromXML(dailyForecastTestData); // use test data
    return Scaffold(
        appBar: AppBar(
          title: const Text('THAILAND DAILY FORECAST'),
        ),
        body: Column(
          children: <Widget>[
            createLogoBaseCard(forecast),
            BaseCard(
                theColor: Colors.white,
                theChild: Text(forecast.overallDescriptionEnglish))
          ],
        ));
  }

  BaseCard createLogoBaseCard(DailyForecast regionForecast) {
    String description = regionForecast.overallDescriptionEnglish;
    IconData icon = getWeatherIconFromData(description);
    Color color = Colors.black54; // TODO: add logic for color selection
    return BaseCard(theColor: color, theChild: Icon(icon, color: Colors.white));
  }
}
