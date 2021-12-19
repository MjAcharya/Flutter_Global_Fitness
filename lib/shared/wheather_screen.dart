// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:globo_fitness/Data/http_helper.dart';
import 'package:globo_fitness/Data/wheather.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';

import 'BottomNavigation.dart';

class WheatherScreen extends StatefulWidget {
  const WheatherScreen({Key? key}) : super(key: key);

  @override
  _WheatherScreenState createState() => _WheatherScreenState();
}

class _WheatherScreenState extends State<WheatherScreen> {
  final TextEditingController country = TextEditingController();
  Wheather result = Wheather('', '', 0, 0, 0, 0);
  String countryMessage = '';
  String countryName = '';
  String description = '';
  String temperature = '';
  String preceived = '';
  String pressure = '';
  String humidity = '';

  @override
  Widget build(BuildContext context) {
    countryMessage = "Please enter the country for wheather";
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text('Wheather Screen'),
        backgroundColor: Colors.black87,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            controller: country,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: countryMessage),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: ElevatedButton(
              onPressed: getData,
              child: Text(
                'Wheather Details',
                style: TextStyle(fontSize: 16),
              )),
        ),
        Text(countryName, style: TextStyle(fontSize: 16)),
        Text(description, style: TextStyle(fontSize: 16)),
        Text(temperature, style: TextStyle(fontSize: 16)),
        Text(preceived, style: TextStyle(fontSize: 16)),
        Text(pressure, style: TextStyle(fontSize: 16)),
        Text(humidity, style: TextStyle(fontSize: 16))
      ]),
    );
  }

  Future getData() async {
    HttpHelper httpHelper = HttpHelper();
    result = await httpHelper.getWeather(country.text);

    setState(() {
      countryName = 'Country     :' + result.name;
      description = 'Description :' + result.description;
      temperature = 'Temperature :' + result.temperature.toString();
      preceived = 'Preceived :' + result.preceived.toString();
      pressure = 'Pressure :' + result.pressure.toString();
      humidity = 'Humidity :' + result.humidity.toString();
    });
  }
}
