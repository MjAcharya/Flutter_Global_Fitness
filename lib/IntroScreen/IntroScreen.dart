// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/BottomNavigation.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Globo Fitness'),
      ),
      drawer: MenuDrawer(),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/view.jpg'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white70,
              ),
              child: Text(
                'Demonstate of Dart and building andriod application in Flutter.',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}

