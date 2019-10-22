import 'package:flutter/material.dart';
import 'package:flutter_planets/widgets/PlanetRow.dart';
import 'package:flutter_planets/model/Planet.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF736AB7),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              sliver: SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PlanetRow(planets[index]),
                  childCount: planets.length,
                ),
                itemExtent: 152.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
