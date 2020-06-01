import 'package:flutter/material.dart';

import '../common/button.dart';
import '../resources/resources.dart';
import 'widget/widget.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          UserInfo(),
          SizedBox(height: 64.0),
          MyFlatButton(
            onPressed: () {},
            text: '修改密碼',
            stream: Stream.value(true),
          ),
          SizedBox(height: 32.0),
          MyFlatButton(
            onPressed: () {},
            text: '常見問題',
            stream: Stream.value(true),
          ),
          SizedBox(height: 32.0),
          MyFlatButton(
            onPressed: () {},
            text: '問題回報',
            stream: Stream.value(true),
            color: MyColors.redGradient,
          ),
        ],
      ),
    );
  }
}
