import 'package:flutter/material.dart';
import 'package:flutter_planets/model/Planet.dart';
import 'package:flutter_planets/widgets/Separator.dart';
import 'package:flutter_planets/common/utils/StyleUtils.dart';
import 'package:flutter_planets/widgets/PlanetRow.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context)
          ],
        ),
      ),
    );
  }

  Widget _getBackground() {
    return Container(
      child: Image.network(
        planet.picture,
        height: 300.0,
        fit: BoxFit.cover,
      ),
      constraints: BoxConstraints.expand(height: 300.0),
    );
  }

  Widget _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0x00736AB7),
            Color(0xFF736AB7),
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 122.0, 0.0, 32.0),
      children: <Widget>[
        PlanetRow(
          planet,
          horizontal: false,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: <Widget>[
              Text(
                _overviewTitle,
                style: TextStyleUtils.headerTextStyle,
              ),
              Separator(),
              Text(
                planet.description,
                style: TextStyleUtils.commonTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(color: Colors.white),
    );
  }
}
