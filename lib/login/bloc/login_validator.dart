import 'dart:async';

import 'package:rxdart/rxdart.dart';

class LoginValidator {
  static final instance = LoginValidator();

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
    if (username.isNotEmpty) {
      sink.add(username);
    } else {
      sink.addError('帳號不能是空的');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 5) {
      sink.add(password);
    } else {
      sink.addError('密碼至少要五個字以上');
    }
  });

  void submit() {
    final validUsername = _usernameController.value;
    final validPassword = _passwordController.value;

    print('Username is $validUsername, and password is $validPassword');
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }
}
