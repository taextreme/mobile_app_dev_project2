import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import '../component/base_card.dart';

IconData getWeatherIconFromData(String data) {
  data = data.toLowerCase();
  IconData iconData = WeatherIcons.cloud;
  if (data.contains("rain") || data.contains("rains")) {
    iconData = WeatherIcons.rain;
  } else if (data.contains("rain") && data.contains("wind")) {
    iconData = WeatherIcons.rain_wind;
  } else if (data.contains("storm")) {
    iconData = WeatherIcons.storm_showers;
  } else if (data.contains("thunder") && data.contains("storm")) {
    iconData = WeatherIcons.thunderstorm;
  } else if (data.contains("thundershower") ||
      data.contains("thundershowers") ||
      data.contains("heavy rain")) {
    iconData = WeatherIcons.thunderstorm;
  } else if (data.contains("cloudy")) {
    iconData = WeatherIcons.cloudy;
  } else if (data.contains("cloudy") && data.contains("windy")) {
    iconData = WeatherIcons.cloudy_windy;
  } else if (data.contains("cloudy") && data.contains("gust")) {
    iconData = WeatherIcons.cloudy_gusts;
  } else if (data.contains("sunny")) {
    iconData = WeatherIcons.day_sunny;
  } else if (data.contains("sunny") && data.contains("overcast")) {
    iconData = WeatherIcons.day_sunny_overcast;
  } else if (data.contains("windy")) {
    iconData = WeatherIcons.day_windy;
  } else if (data.contains("error")) {
    iconData = WeatherIcons.alien;
  }
  return iconData;
}

Color chooseColorFromIcon(IconData icon) {
  if (icon == WeatherIcons.rain || icon == WeatherIcons.rain_wind) {
    return Colors.lightBlue;
  } else if (icon == WeatherIcons.cloudy ||
      icon == WeatherIcons.cloudy_windy ||
      icon == WeatherIcons.cloudy_gusts) {
    return Colors.grey;
  } else if (icon == WeatherIcons.storm_showers ||
      icon == WeatherIcons.thunderstorm) {
    return Colors.blueGrey;
  } else if (icon == WeatherIcons.day_sunny ||
      icon == WeatherIcons.day_sunny_overcast) {
    return Colors.deepOrange;
  } else if (icon == WeatherIcons.windy || icon == WeatherIcons.wind) {
    return Colors.lightGreen;
  } else if (icon == WeatherIcons.alien) {
    return Colors.red.shade900;
  } else {
    return Colors.black54;
  }
}

BaseCard createLogoBaseCard(String description) {
  String descriptionLower = description.toLowerCase();
  IconData icon = getWeatherIconFromData(descriptionLower);
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
