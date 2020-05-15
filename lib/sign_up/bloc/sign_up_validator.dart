import 'dart:async';

import 'package:rxdart/rxdart.dart';

class SignUpValidator {
  static final _regex = RegExp(r'^\w+$');
  static final _emailRegex = RegExp(r'^\w+(.\w+)*@\w+(.\w+)+$');

  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _birthdayController = BehaviorSubject<DateTime>();

  // Add data to stream
  Stream<String> get username =>
      _usernameController.stream.transform(validateUsername);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<String> get confirmPassword => Rx.combineLatest2(
      _passwordController.stream,
      _confirmPasswordController.stream,
      (p, c) => [p, c]).transform(validateConfirmPassword);

  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get birthday =>
      _birthdayController.stream.transform(validateBirthday);

  Stream<bool> get submitValid => Rx.combineLatest5(username, password,
      confirmPassword, email, birthday, (u, p, c, e, b) => true);

  // change data
  Function(String) get changeUsername => _usernameController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  Function(String) get changeConfirmPassword =>
      _confirmPasswordController.sink.add;

  Function(String) get changeEmail => _emailController.sink.add;

  Function(DateTime) get changeBirthday => _birthdayController.sink.add;

  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.isEmpty) {
      sink.addError('帳號不能是空的');
      return;
    }

    if (!_regex.hasMatch(username)) {
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

    if (!_regex.hasMatch(password)) {
      sink.addError('密碼不能含有特殊字元');
      return;
    }

    sink.add(password);
  });

  final validateConfirmPassword =
      StreamTransformer<List, String>.fromHandlers(handleData: (list, sink) {
    final password = list[0];
    final confirmPassword = list[1];

    if (confirmPassword.length < 4) {
      sink.addError('確認密碼不能少於4個字');
      return;
    }

    if (!_regex.hasMatch(confirmPassword)) {
      sink.addError('確認密碼不能含有特殊字元');
      return;
    }

    if (password != confirmPassword) {
      sink.addError('密碼與確認密碼不相符');
      return;
    }

    sink.add(confirmPassword);
  });

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.isEmpty) {
      sink.addError('信箱不能是空的');
      return;
    }

    if (!_emailRegex.hasMatch(email)) {
      sink.addError('請輸入正確的信箱');
      return;
    }

    sink.add(email);
  });

  final validateBirthday = StreamTransformer<DateTime, String>.fromHandlers(
      handleData: (birthday, sink) {
    sink.add(birthday.toString().split(' ').first);
  });

  List submit() {
    final validUsername = _usernameController.value;
    final validPassword = _passwordController.value;
    final validConfirmPassword = _confirmPasswordController.value;
    final validEmail = _emailController.value;
    final validBirthday = _birthdayController.value.toString().split(' ').first;

    return [
      validUsername,
      validPassword,
      validConfirmPassword,
      validEmail,
      validBirthday,
    ];
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
    _confirmPasswordController.close();
    _emailController.close();
    _birthdayController.close();
  }
}
