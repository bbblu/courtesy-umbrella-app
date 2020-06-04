import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/button.dart';
import '../../common/text_field.dart';
import '../bloc/bloc.dart';

class ForgetPasswordForm extends StatefulWidget {
  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final validator = ForgetPasswordValidator();

  @override
  void dispose() {
    super.dispose();
    validator.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _onForgetPasswordButtonPressed() {
      BlocProvider.of<ForgetPasswordBloc>(context).add(
        ForgetPasswordButtonPressed(
          email: validator.submit(),
        ),
      );
    }

    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyTextField(
                prefixIcon: Icons.email,
                hintText: '信箱',
                stream: validator.email,
                onChanged: validator.changeEmail,
              ),
              SizedBox(height: 128.0),
              MyFlatButton(
                onPressed: state is! ForgetPasswordLoading
                    ? _onForgetPasswordButtonPressed
                    : null,
                text: '寄送郵件',
                stream: validator.submitValid,
              ),
              SizedBox(height: 32.0),
              BackFlatButton(),
              Container(
                child: state is ForgetPasswordLoading
                    ? CircularProgressIndicator()
                    : null,
              ),
            ],
          );
        },
      ),
    );
  }
}
