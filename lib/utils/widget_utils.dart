import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

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
      data.contains("thundershowers")) {
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
  } else {
    return Colors.black54;
  }
}
