import 'package:flutter/material.dart';
import 'package:mobile_app_dev_project2/model/region_forecast.dart';

import '../utils/widget_utils.dart';

class RegionScreen extends StatefulWidget {
  const RegionScreen({Key? key, required this.forecast, required this.lang})
      : super(key: key);
  final String lang;
  final RegionForecast forecast;

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
          children: createRegionPageBodyFromLang(widget.forecast, widget.lang),
        ));
  }

  List<Widget> createRegionPageBodyFromLang(
      RegionForecast forecast, String lang) {
    if (lang == "TH") {
      return createRegionPageBodyTH(forecast);
    }
    return createRegionPageBody(forecast);
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

  List<Widget> createRegionPageBodyTH(RegionForecast forecast) {
    List<Widget> body = <Widget>[
      createLogoBaseCard(forecast.descriptionEnglish),
      Container(
          color: Colors.white60,
          child: Text(forecast.descriptionThai,
              style: const TextStyle(fontSize: 20))),
    ];

    return body;
  }
}
