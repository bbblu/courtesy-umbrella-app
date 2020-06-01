import 'package:flutter/material.dart';

import '../model/station.dart';
import '../resources/resources.dart';

class MapPage extends StatelessWidget {
  final List<Station> _datas = Station.fakeStationList;

  @override
  Widget build(BuildContext context) {
    final Station _data = _datas.first;

    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _data.name,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${_data.distance.toInt()} 公尺',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.beach_access,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      '${_data.remainCount} / ${_data.totalCount} 把',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            height: 100.0,
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 32.0,
            ),
            decoration: BoxDecoration(
              color: MyColors.primary3,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
