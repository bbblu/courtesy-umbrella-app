import 'dart:async';

import 'package:rxdart/rxdart.dart';

class LoginValidator {
  static final instance = LoginValidator();
  static final regex = RegExp(r'^[a-zA-Z0-9]+$');

  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get username =>
      _usernameController.stream.transform(validateUsername);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(username, password, (e, p) => true);

  // change data
  Function(String) get changeUsername => _usernameController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.isEmpty) {
      sink.addError('帳號不能是空的');
      return;
    }

    if (!regex.hasMatch(username)) {
      sink.addError('帳號不能含有特殊字元');
      return;
    }

    sink.add(username);
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length < 4) {
      sink.addError('密碼不能少於4個字');
      return;
    }

    if (!regex.hasMatch(password)) {
      sink.addError('密碼不能含有特殊字元');
      return;
    }

    sink.add(password);
  });

  List submit() {
    final validUsername = _usernameController.value;
    final validPassword = _passwordController.value;

    return [validUsername, validPassword];
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }
}
