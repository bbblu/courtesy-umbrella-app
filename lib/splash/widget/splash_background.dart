import 'package:flutter/material.dart';

class SplashBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/launch-screen-background.jpg',
      height: double.infinity,
      fit: BoxFit.fitHeight,
      color: Colors.white.withOpacity(0.5),
      colorBlendMode: BlendMode.dstATop,
    );
  }
}
