import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../resources/resources.dart';

class MyTitleText extends StatelessWidget {
  final String text;

  MyTitleText({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
        color: getThemeColor(MyColors.primary1, Colors.white),
      ),
    );
  }
}
