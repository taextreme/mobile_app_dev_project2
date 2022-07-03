import 'package:flutter/material.dart';
import 'package:mobile_app_dev_project2/component/base_card.dart';
import 'package:mobile_app_dev_project2/model/daily_forecast.dart';
import 'package:mobile_app_dev_project2/screen/region_screen.dart';
import 'package:mobile_app_dev_project2/service/api_service.dart';
import 'package:mobile_app_dev_project2/utils/widget_utils.dart';

import '../model/region_forecast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DailyForecast forecast = DailyForecast.empty();

  _HomeScreenState() {
    ApiService().fetchDailyForecast().then((value) => setState(() {
          forecast = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    // use test data
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
      createLogoBaseCard(forecast.overallDescriptionEnglish),
      Container(
          color: Colors.white,
          child: Container(
              alignment: Alignment.topCenter,
              child:
                  Text(forecast.date, style: const TextStyle(fontSize: 30)))),
      Container(
          color: Colors.white60,
          child: Text(forecast.overallDescriptionEnglish,
              style: const TextStyle(fontSize: 20))),
      const SizedBox(height: 20),
      const Text("Regions Forecast",
          textAlign: TextAlign.center, style: TextStyle(fontSize: 28)),
    ];
    body.addAll(getRegionBaseCards(forecast.regionsForecast));
    return body;
  }

  List<Widget> getRegionBaseCards(List<RegionForecast> data) {
    List<Widget> list = [];
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.deepPurple
    ];
    for (var i = 0; i < data.length; i++) {
      RegionForecast regionForecast = data[i];
      list.add(SizedBox(
          height: 100,
          child: BaseCard(
              theOnTapFunc: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegionScreen(forecast: regionForecast);
                }));
              },
              theColor: colors[i],
              theChild: Container(
                  alignment: Alignment.center,
                  child: Text(regionForecast.regionNameEnglish,
                      style: const TextStyle(fontSize: 22))))));
    }
    return list;
  }
}
