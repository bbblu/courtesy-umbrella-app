import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../model/weather.dart';

class WeatherInfo extends StatelessWidget {
  final Weather weather;

  WeatherInfo({@required this.weather});

  @override
  Widget build(BuildContext context) {
    final String condition = weather.condition.toString().split('.').last;
    final String lastUpdated =
        '${weather.lastUpdated.hour}:${weather.lastUpdated.minute}';

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${weather.location}',
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                '更新時間: $lastUpdated',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${weather.temp.toInt()} °C',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$condition',
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
          Image.asset(
            'assets/images/$condition.png',
            width: 125.0,
            fit: BoxFit.fitWidth,
            alignment: AlignmentDirectional.center,
          )
        ],
      ),
      height: 350.0,
      padding: EdgeInsets.symmetric(
        vertical: 48.0,
        horizontal: 32.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
