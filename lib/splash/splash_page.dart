import 'package:flutter/material.dart';

import './widget/widget.dart';
import '../common/logo.dart';
import '../resources/resources.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: MyColors.greenGradient,
        ),
        width: screenWidth,
        height: screenHeight,
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              DecorationCircle(size: 400),
              DecorationCircle(size: 300),
              DecorationCircle(size: 200),
              Logo(size: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
