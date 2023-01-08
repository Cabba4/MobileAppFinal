import 'package:flutter/material.dart';
import 'current_weather.dart';
import 'forecast_screen.dart';
import 'dart:ui';

void main() {
  runApp(MaterialApp(title: "Weather App", initialRoute: "/", routes: {
    '/': (context) => const CurrentWeather(),
    '/forecast': (context) => const ForecastScreen(),
  }));
}

// Make widget here (main screen)
// stateless or stateful widgets

