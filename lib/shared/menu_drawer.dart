// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/wheather_screen.dart';
import 'bmi_calculator.dart';
import 'package:globo_fitness/IntroScreen/IntroScreen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          child: ListView(
        children: buildMenuItems(context),
      )),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitle = [
      'Home',
      'BMI Calculator',
      'Wheather',
      'Training',
      'Map Feature'
    ];
    List<Widget> menuItems = [];

    menuItems.add(DrawerHeader(
        decoration: BoxDecoration(color: Colors.black87),
        child: Center(
          child: Text(
            'Globo Fitness',
            style: TextStyle(color: Colors.white70, fontSize: 28),
          ),
        )));

    menuTitle.forEach((element) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element,
            style: TextStyle(color: Colors.black87, fontSize: 18)),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = IntroScreen();
              break;
            case 'BMI Calculator':
              screen = BMICalculator();
              break;
            case 'Wheather':
              screen = WheatherScreen();
              break;
            case 'Training':
              break;
            case 'Map Feature':
              break;
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });
    return menuItems;
  }
}
