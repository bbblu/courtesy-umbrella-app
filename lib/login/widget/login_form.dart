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
  final validator = LoginValidator();

  @override
  void dispose() {
    super.dispose();
    validator.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: validator.submit()[0],
          password: validator.submit()[1],
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 85.0,
                child: MyTextField(
                  prefixIcon: Icons.person,
                  hintText: '帳號',
                  stream: validator.username,
                  onChanged: validator.changeUsername,
                ),
              ),
              SizedBox(
                height: 105.0,
                child: MyTextField(
                  prefixIcon: Icons.lock,
                  hintText: '密碼',
                  stream: validator.password,
                  onChanged: validator.changePassword,
                  isPassword: true,
                ),
              ),
              MyFlatButton(
                onPressed:
                    state is! LoginLoading ? _onLoginButtonPressed : null,
                text: '登入',
                stream: validator.submitValid,
              ),
              Container(
                child:
                    state is LoginLoading ? CircularProgressIndicator() : null,
              ),
            ],
          );
        },
      ),
    );
  }
}
