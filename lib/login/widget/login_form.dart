import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/button.dart';
import '../../common/text_field.dart';
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
          final LoginValidator validator = LoginValidator();

          return Form(
            autovalidate: true,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 85.0,
                  child: MyTextFormField(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'account',
                    stream: validator.username,
                    onChanged: validator.changeUsername,
                  ),
                ),
                SizedBox(
                  height: 105.0,
                  child: MyTextFormField(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'password',
                    stream: validator.password,
                    onChanged: validator.changePassword,
                    obscureText: true,
                  ),
                ),
                MyFlatButton(
                  onPressed:
                      state is! LoginLoading ? _onLoginButtonPressed : null,
                  text: '登入',
                  stream: validator.submitValid,
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
