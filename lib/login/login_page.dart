import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/bloc.dart';
import '../auth/user_repository.dart';
import '../common/button.dart';
import '../common/logo.dart';
import '../common/title_text.dart';
import '../resources/resources.dart';
import 'bloc/bloc.dart';
import 'widget/widget.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authBloc: BlocProvider.of<AuthBloc>(context),
            userRepository: userRepository,
          );
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -screenWidth / 7,
              right: -screenWidth / 7,
              child: Logo(
                size: screenWidth / 1.5,
                color: MyColors.primary1,
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Container(
                height: screenHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        height: screenHeight > 600
                            ? screenWidth / 1.5
                            : screenWidth / 2),
                    MyTitleText(text: '登入'),
                    SizedBox(
                      height: 30.0,
                    ),
                    LoginForm(),
                    Row(
                      children: <Widget>[
                        MyTextButton(
                          onPressed: null,
                          text: '忘記密碼',
                        ),
                        Spacer(),
                        MyTextButton(
                          onPressed: null,
                          text: '尚未註冊',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
