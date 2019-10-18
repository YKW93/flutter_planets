import 'package:flutter/material.dart';
import 'package:flutter_planets/ui/home/PlanetRow.dart';
import 'package:flutter_planets/model/Planet.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlanetRow(planets[0]);
  }
}
