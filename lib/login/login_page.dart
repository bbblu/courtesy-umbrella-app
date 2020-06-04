import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/bloc.dart';
import '../auth/user_repository.dart';
import '../common/button.dart';
import '../forget_password/bloc/bloc.dart';
import '../forget_password/forget_password_page.dart';
import '../resources/resources.dart';
import '../sign_up/bloc/bloc.dart';
import '../sign_up/sign_up_page.dart';
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
            Container(
              width: screenWidth,
              height: screenHeight,
              child: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            Container(
              height: 600.0,
              margin: EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(flex: 3),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  Spacer(),
                  Text(
                    '一機在手 未雨綢繆',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(flex: 2),
                  LoginForm(),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      MyTextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => ForgetPasswordBloc(),
                              child: ForgetPasswordPage(),
                            ),
                          ),
                        ),
                        text: '忘記密碼',
                        color: Colors.white,
                      ),
                      Spacer(),
                      MyTextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => SignUpBloc(),
                              child: SignUpPage(),
                            ),
                          ),
                        ),
                        text: '尚未註冊',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
