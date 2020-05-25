import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/bloc.dart';
import '../auth/user_repository.dart';
import '../common/button.dart';
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
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Container(
                height: screenHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      '一機在手 未雨綢繆',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 64.0,
                    ),
                    LoginForm(),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: <Widget>[
                        MyTextButton(
                          onPressed: null,
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
            ),
          ],
        ),
      ),
    );
  }
}
