import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../model/weather.dart';
import '../../resources/resources.dart';

class RainPercentage extends StatelessWidget {
  final Weather weather;

  RainPercentage({@required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '降雨機率',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            thickness: 1.0,
            color: Colors.white,
          ),
          Text(
            '90%',
            style: TextStyle(
              fontSize: 70.0,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 16.0),
      decoration: BoxDecoration(
        gradient: MyColors.greenGradient,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }
}
