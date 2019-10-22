import 'package:flutter/material.dart';
import 'package:flutter_planets/model/Planet.dart';
import 'package:flutter_planets/common/utils/StyleUtils.dart';
import 'package:flutter_planets/ui/detail/DetailPage.dart';
import 'package:flutter_planets/widgets/Separator.dart';

class PlanetRow extends StatelessWidget {
  final Planet planet;
  final bool horizontal;

  PlanetRow(this.planet, {this.horizontal = true});

  PlanetRow.vertical(this.planet) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new DetailPage(planet),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          new FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
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
      height: horizontal ? 124.0 : 154.0,
      margin:
          horizontal ? EdgeInsets.only(left: 46.0) : EdgeInsets.only(top: 72.0),
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
      margin: EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
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
          Separator(),
          Row(
            children: <Widget>[
              Expanded(
                flex: horizontal ? 1 : 0,
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
                flex: horizontal ? 1 : 0,
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
      mainAxisSize: MainAxisSize.min,
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
      alignment: horizontal ? Alignment.centerLeft : Alignment.center,
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
