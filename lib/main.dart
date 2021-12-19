// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:globo_fitness/IntroScreen/IntroScreen.dart';
import 'package:globo_fitness/shared/bmi_calculator.dart';

void main() {
  runApp(GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueAccent),
      initialRoute: '/',
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BMICalculator()
      },
    );
  }
}
