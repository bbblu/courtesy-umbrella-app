import 'package:flutter/material.dart';

import '../resources/resources.dart';
import 'widget/widget.dart';

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenWidth / 2),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: MyColors.greenGradient,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '忘記密碼',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ForgetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
