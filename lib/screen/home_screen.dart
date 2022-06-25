import 'package:flutter/material.dart';
import 'package:mobile_app_dev_project2/component/base_card.dart';
import 'package:mobile_app_dev_project2/model/daily_forecast.dart';
import 'package:mobile_app_dev_project2/test_resources/test_forecast.dart';
import 'package:mobile_app_dev_project2/utils/data_utils.dart';
import 'package:mobile_app_dev_project2/utils/widget_utils.dart';

import '../model/region_forecast.dart';

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
        body: ListView(
          children: createHomePageBody(forecast),
        ));
  }

  List<Widget> createHomePageBody(DailyForecast forecast) {
    List<Widget> body = <Widget>[
      createLogoBaseCard(forecast),
      Container(
          color: Colors.white,
          child: Container(
              alignment: Alignment.topCenter,
              child:
                  Text(forecast.date, style: const TextStyle(fontSize: 30)))),
      Container(
          color: Colors.white,
          child: Text(forecast.overallDescriptionEnglish,
              style: const TextStyle(fontSize: 18))),
    ];
    body.addAll(getRegionBaseCards(forecast.regionsForecast));
    return body;
  }

  BaseCard createLogoBaseCard(DailyForecast regionForecast) {
    String description = regionForecast.overallDescriptionEnglish;
    IconData icon = getWeatherIconFromData(description);
    Color color = chooseColorFromIcon(icon);
    return BaseCard(
        theColor: color,
        theChild: Container(
            alignment: Alignment.topCenter,
            height: 300,
            width: 300,
            child: Icon(
              icon,
              color: Colors.white,
              size: 200.0,
            )));
  }

  List<BaseCard> getRegionBaseCards(List<RegionForecast> data) {
    List<BaseCard> list = [];
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.lightBlue,
      Colors.blue,
      Colors.purple
    ];
    for (var i = 0; i < data.length; i++) {
      list.add(BaseCard(
          theColor: colors[i], theChild: Text(data[i].regionNameEnglish)));
    }
    return list;
  }
}
