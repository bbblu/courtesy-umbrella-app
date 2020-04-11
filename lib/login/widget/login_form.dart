import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/button.dart';
import '../../common/text_field.dart';
import '../../common/title_text.dart';
import '../bloc/bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            autovalidate: true,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyTitleText(text: '登入'),
                Expanded(
                  child: SizedBox(),
                ),
                MyTextFormField(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'account',
                  controller: _usernameController,
                ),
                Expanded(
                  child: SizedBox(),
                ),
                MyTextFormField(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'password',
                  controller: _passwordController,
                  obscureText: true,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                MyFlatButton(
                  onPressed:
                      state is! LoginLoading ? _onLoginButtonPressed : null,
                  text: '登入',
                ),
                Row(
                  children: <Widget>[
                    MyTextButton(
                      onPressed: null,
                      text: '忘記密碼',
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    MyTextButton(
                      onPressed: null,
                      text: '尚未註冊',
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 3,
                ),
                Container(
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
