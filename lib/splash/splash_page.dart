import 'package:flutter/material.dart';

import '../common/logo.dart';
import '../resources/resources.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary1,
      body: Center(
        child: Logo(size: screenWidth / 3),
      ),
    );
  }
}
