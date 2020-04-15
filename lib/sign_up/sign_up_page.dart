import 'package:courtesy_umbrella/common/button.dart';
import 'package:courtesy_umbrella/common/text_field.dart';
import 'package:courtesy_umbrella/common/title_text.dart';
import 'package:courtesy_umbrella/sign_up/widget/sign_up_form.dart';
import 'package:flutter/material.dart';

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
