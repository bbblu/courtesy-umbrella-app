import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'auth/bloc/bloc.dart';
import 'auth/user_repository.dart';
import 'common/loading_indicator.dart';
import 'home/home_page.dart';
import 'login/login_page.dart';
import 'resources/resources.dart';
import 'splash/splash_page.dart';
import 'utils/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();

  runApp(BlocProvider<AuthBloc>(
    create: (context) {
      return AuthBloc(userRepository: userRepository)..add(AppStarted());
    },
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      darkTheme: darkTheme,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          screenWidth = MediaQuery.of(context).size.width;
          screenHeight = MediaQuery.of(context).size.height;
          appBrightness = MediaQuery.of(context).platformBrightness;

          if (state is AuthUninitialized) {
            return SplashPage();
          }
          if (state is AuthAuthenticated) {
            return HomePage();
          }
          if (state is AuthUnauthenticated) {
            return LoginPage(userRepository: userRepository);
          }
          if (state is AuthLoading) {
            return LoadingIndicator();
          }

          return LoginPage(userRepository: userRepository);
        },
      ),
    );
  }
}
