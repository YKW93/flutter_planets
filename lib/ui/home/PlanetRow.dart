import 'package:flutter/material.dart';
import 'package:flutter_planets/model/Planet.dart';
import 'package:flutter_planets/common/utils/StyleUtils.dart';
import 'package:flutter_planets/ui/detail/DetailPage.dart';

class PlanetRow extends StatelessWidget {
  final Planet planet;

  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          PageRouteBuilder(pageBuilder: (_, __, ___) => DetailPage(planet))),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            _buildPlanetCard(),
            _buildPlanetThumbnail(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanetCard() {
    return Container(
      height: 124.0,
      margin: EdgeInsets.only(
        left: 46.0,
      ),
      decoration: BoxDecoration(
          color: Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            )
          ]),
      child: _buildPlanetCardContent(),
    );
  }

  Widget _buildPlanetCardContent() {
    return Container(
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(
            planet.name,
            style: TextStyleUtils.headerTextStyle,
          ),
          Container(height: 10.0),
          Text(
            planet.location,
            style: TextStyleUtils.subHeaderTextStyle,
          ),
          Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: Color(0xff00c6ff),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    _buildPlanetValue(
                      value: planet.distance,
                      image: "assets/img/ic_distance.png",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    _buildPlanetValue(
                      value: planet.gravity,
                      image: "assets/img/ic_gravity.png",
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPlanetValue({String value, String image}) {
    return Row(
      children: <Widget>[
        Image.asset(
          image,
          height: 12.0,
        ),
        Container(width: 8.0),
        Text(
          value,
          style: TextStyleUtils.regularTextStyle,
        )
      ],
    );
  }

  Widget _buildPlanetThumbnail() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      alignment: Alignment.centerLeft,
      child: Hero(
        tag: 'planet-hero-${planet.id}',
        child: Image(
          image: AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );
  }
}
