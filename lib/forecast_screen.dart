import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  List? forecastData;

  @override
  void initState() {
    // we do this at the first load of this forecast screen
    super.initState();
    fetchForecastData();
  }

  void fetchForecastData() async {
    Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast/daily?q=tampere&units=metric&appid=c75051189dd4fe9cef3fc5cec64b98a9');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      setState(() {
        var weatherData = json.decode(response.body);
        forecastData = weatherData['list'];
      });
    }
  }

  @override
  Widget build(Object context) {
    return Scaffold(
        appBar: AppBar(title: Text("Weather Forecast screen")),
        body: forecastData != null
            ? ListView.separated(
                itemCount: forecastData!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 50,
                      color:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(1.0),
                      child: Center(
                          child:
                              Text('${forecastData![index]["temp"]["day"]}')));
                },
                separatorBuilder: (BuildContext context, index) =>
                    const Divider(),
              )
            : const Text("Waiting for data"));
  }
}
