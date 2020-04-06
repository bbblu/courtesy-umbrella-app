import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/logo.dart';
import 'widget/widget.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            SplashBackground(),
            Logo(size: MediaQuery.of(context).size.width / 3),
          ],
        ),
      ),
    );
  }
}
