// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/BottomNavigation.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontsize = 18;
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String result = '';
  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ' + ((isMetric) ? 'meters.' : 'inches.');
    weightMessage =
        'Please insert your weight in ' + ((isMetric) ? 'kilos.' : 'pounds.');

    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      drawer: MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ToggleButtons(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Metric',
                      style: TextStyle(fontSize: fontsize),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Imperial',
                      style: TextStyle(fontSize: fontsize),
                    ),
                  )
                ],
                isSelected: isSelected,
                onPressed: togglePressed,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: heightMessage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: weightMessage),
                ),
              ),
              ElevatedButton(
                onPressed: () => findBmi(),
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(fontSize: fontsize),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  result,
                  style: TextStyle(fontSize: fontsize),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void togglePressed(index) {
    if (index == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }

    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBmi() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = 'Your BMI is ' + bmi.toStringAsFixed(3);
    });
  }
}
