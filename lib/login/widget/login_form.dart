import 'package:courtesy_umbrella/common/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import 'login_button.dart';
import 'login_text_field.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
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
            child: Column(
              children: <Widget>[
                SizedBox(height: 80.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Logo(size: 64.0),
                    SizedBox(width: 20.0),
                    Text(
                      'Umbrella',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 80.0),
                LoginTextField(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'username',
                  controller: _usernameController,
                ),
                SizedBox(height: 32.0),
                LoginTextField(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'password',
                  controller: _passwordController,
                ),
                SizedBox(height: 128.0),
                LoginFlatButton(
                  onPressed:
                      state is! LoginLoading ? _onLoginButtonPressed : null,
                  text: 'LOGIN',
                ),
                Row(
                  children: <Widget>[
                    LoginTextButton(
                      onPressed: null,
                      text: '忘記密碼',
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    LoginTextButton(
                      onPressed: null,
                      text: '尚未註冊',
                    ),
                  ],
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
