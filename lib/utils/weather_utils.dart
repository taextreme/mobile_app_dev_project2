import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

IconData getWeatherIconFromData(String data) {
  data = data.toLowerCase();
  IconData iconData = WeatherIcons.alien;
  if (data.contains("rain")) {
    iconData = WeatherIcons.rain;
  } else if (data.contains("rain") && data.contains("wind")) {
    iconData = WeatherIcons.rain_wind;
  } else if (data.contains("storm")) {
    iconData = WeatherIcons.storm_showers;
  } else if (data.contains("thunder") && data.contains("storm")) {
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
