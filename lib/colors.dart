import 'package:flutter/material.dart';

Color kBackColor = const Color(0xFFFFFFFF);
Color kTextColor = const Color(0xFF000000);

void setWeatherColors(String condition) {
  Map<String, Color> backgroundColors = {
    "Sunny": Color(0xFFFDFBE3),
    "Clear": Color(0xFFFFFFFF),
    "Partly cloudy": Color(0xFFE1F5FE),
    "Cloudy": Color(0xFFB0BEC5),
    "Overcast": Color(0xFFB0BEC5),
    "Mist": Color(0xFFD3D3D3),
    "Patchy rain nearby": Color(0xFFBBDEFB),
    "Patchy snow nearby": Color(0xFFB3E5FC),
    "Patchy sleet nearby": Color(0xFFB2EBF2),
    "Thundery outbreaks in nearby": Color(0xFFB0BEC5),
    "Fog": Color(0xFFD3D3D3),
    "Light rain": Color(0xFFBBDEFB),
    "Moderate rain": Color(0xFFBBDEFB),
    "Heavy rain": Color(0xFFBBDEFB),
    "Light snow": Color(0xFFE0F7FA),
    "Moderate snow": Color(0xFFB3E5FC),
    "Heavy snow": Color(0xFFF0F4C3),
    "Ice pellets": Color(0xFFB2EBF2),
  };

  Map<String, Color> textColors = {
    "Sunny": Color.fromARGB(255, 199, 173, 0),
    "Clear": Color.fromARGB(255, 0, 183, 255),
    "Partly cloudy": Color(0xFF607D8B),
    "Cloudy": Color(0xFFFFFFFF),
    "Overcast": Color(0xFFFFFFFF),
    "Mist": Color(0xFF333333),
    "Patchy rain nearby": Color(0xFF1054BB),
    "Patchy snow nearby": Color(0xFF01579B),
    "Patchy sleet nearby": Color(0xFF004D40),
    "Thundery outbreaks in nearby": Color(0xFFFFFFFF),
    "Fog": Color(0xFF333333),
    "Light rain": Color(0xFF0D47A1),
    "Moderate rain": Color(0xFF0D47A1),
    "Heavy rain": Color(0xFF0D47A1),
    "Light snow": Color(0xFF0277BD),
    "Moderate snow": Color(0xFF01579B),
    "Heavy snow": Color(0xFF424242),
    "Ice pellets": Color(0xFF004D40),
  };

  kBackColor = backgroundColors[condition] ?? kBackColor; // Default to white
  kTextColor = textColors[condition] ?? kTextColor; // Default to black
}
