import 'package:meta/meta.dart';

class Station {
  final String name;
  final double distance;
  final int remainCount;
  final int totalCount;

  Station({
    @required this.name,
    @required this.distance,
    @required this.remainCount,
    @required this.totalCount,
  });

  static List<Station> fakeStationList = [
    Station(
      name: '北商門口',
      distance: 20.0,
      remainCount: 3,
      totalCount: 5,
    )
  ];
}
