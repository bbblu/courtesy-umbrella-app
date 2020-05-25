import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/button.dart';
import '../../common/text_field.dart';
import '../bloc/bloc.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final validator = SignUpValidator();
  final birthdayController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    validator.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _onSignUpButtonPressed() {
      BlocProvider.of<SignUpBloc>(context).add(
        SignUpButtonPressed(
          username: validator.submit()[0],
          password: validator.submit()[1],
          email: validator.submit()[3],
          birthday: validator.submit()[4],
        ),
      );
    }

    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is SignUpInitial) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Wrap(
            runSpacing: 24.0,
            children: <Widget>[
              MyTextField(
                prefixIcon: Icons.person,
                hintText: '帳號',
                stream: validator.username,
                onChanged: validator.changeUsername,
              ),
              MyTextField(
                prefixIcon: Icons.lock,
                hintText: '密碼',
                stream: validator.password,
                onChanged: validator.changePassword,
                isPassword: true,
              ),
              MyTextField(
                prefixIcon: Icons.lock,
                hintText: '確認密碼',
                stream: validator.confirmPassword,
                onChanged: validator.changeConfirmPassword,
                isPassword: true,
              ),
              MyTextField(
                prefixIcon: Icons.email,
                hintText: '信箱',
                stream: validator.email,
                onChanged: validator.changeEmail,
              ),
              MyTextField(
                prefixIcon: Icons.cake,
                hintText: '生日',
                stream: validator.birthday,
                isReadOnly: true,
                controller: birthdayController,
              ),
              SizedBox(
                height: 100.0,
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (dateTime) {
                    validator.changeBirthday(dateTime);
                    birthdayController.text =
                        dateTime.toString().split(' ').first;
                  },
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              MyFlatButton(
                onPressed:
                    state is! SignUpLoading ? _onSignUpButtonPressed : null,
                text: '註冊',
                stream: validator.submitValid,
              ),
              Container(
                child:
                    state is SignUpLoading ? CircularProgressIndicator() : null,
              ),
            ],
          );
        },
      ),
    );
  }
}
