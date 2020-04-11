import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/bloc.dart';
import '../auth/user_repository.dart';
import '../common/logo.dart';
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
              child: Container(
                height: screenHeight,
                margin:
                    EdgeInsets.fromLTRB(32.0, screenWidth / 1.5, 32.0, 32.0),
                child: LoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
