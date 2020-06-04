import 'dart:async';

import 'package:rxdart/rxdart.dart';

class ForgetPasswordValidator {
  static final _emailRegex = RegExp(r'^\w+(.\w+)*@\w+(.\w+)+$');

  final _emailController = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<bool> get submitValid => email.map((e) => true);

  // change data
  Function(String) get changeEmail => _emailController.sink.add;

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

  String submit() {
    final validEmail = _emailController.value;

    return validEmail;
  }

  void dispose() {
    _emailController.close();
  }
}
