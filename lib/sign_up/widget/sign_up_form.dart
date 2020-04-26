import 'package:flutter/material.dart';

import '../../common/button.dart';
import '../../common/text_field.dart';

class SignUpForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidate: true,
      key: _formKey,
      child: Wrap(
        runSpacing: 32.0,
        children: <Widget>[
          MyTextField(
            prefixIcon: Icon(Icons.person),
            hintText: 'account',
          ),
          MyTextField(
            prefixIcon: Icon(Icons.lock),
            hintText: 'password',
            isPassword: true,
          ),
          MyTextField(
            prefixIcon: Icon(Icons.lock),
            hintText: 'password again',
            isPassword: true,
          ),
          MyTextField(
            prefixIcon: Icon(Icons.email),
            hintText: 'email',
          ),
          MyTextField(
            prefixIcon: Icon(Icons.cake),
            hintText: 'birthday',
          ),
          SizedBox(
            height: 100.0,
          ),
          MyFlatButton(
            onPressed: null,
            text: '註冊',
          ),
        ],
      ),
    );
  }
}
