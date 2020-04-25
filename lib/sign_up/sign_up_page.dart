import 'package:flutter/material.dart';

import '../common/button.dart';
import '../common/title_text.dart';
import '../sign_up/widget/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyTitleText(text: '註冊'),
              SizedBox(
                height: 30.0,
              ),
              SignUpForm(),
              Align(
                alignment: Alignment.centerRight,
                child: MyTextButton(
                  onPressed: () {},
                  text: '已擁有帳戶',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
