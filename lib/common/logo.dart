import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta/meta.dart';

class Logo extends StatelessWidget {
  final double size;
  final Color color;

  Logo({Key key, @required this.size, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      width: size,
      height: size,
      color: color,
    );
  }
}
