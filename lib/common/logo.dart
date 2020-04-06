import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../utils/color_scheme.dart';

class Logo extends StatelessWidget {
  final double size;

  Logo({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: MyColorScheme.primary1,
        borderRadius: BorderRadius.all(
          Radius.circular(size / 4),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(size / 10),
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    );
  }
}
