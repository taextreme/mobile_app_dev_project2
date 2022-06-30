import 'package:flutter/material.dart';
import 'package:mobile_app_dev_project2/model/region_forecast.dart';

import '../utils/widget_utils.dart';

class RegionScreen extends StatefulWidget {
  const RegionScreen({Key? key, required this.forecast, required this.date})
      : super(key: key);

  final RegionForecast forecast;
  final String date;

  @override
  State<RegionScreen> createState() => _RegionScreenState();
}

class _RegionScreenState extends State<RegionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.forecast.regionNameEnglish),
        ),
        body: ListView(
          children: createRegionPageBody(widget.forecast),
        ));
  }

  List<Widget> createRegionPageBody(RegionForecast forecast) {
    List<Widget> body = <Widget>[
      createLogoBaseCard(forecast.descriptionEnglish),
      Container(
          color: Colors.white60,
          child: Text(forecast.descriptionEnglish,
              style: const TextStyle(fontSize: 20))),
    ];

    return body;
  }
}
