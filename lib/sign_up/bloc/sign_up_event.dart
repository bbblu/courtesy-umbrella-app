import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpButtonPressed extends SignUpEvent {
  final String username;
  final String password;
  final String email;
  final String birthday;

  const SignUpButtonPressed({
    @required this.username,
    @required this.password,
    @required this.email,
    @required this.birthday,
  });

  @override
  List<Object> get props => [username, password, email, birthday];

  @override
  String toString() =>
      'SignUpButtonPressed { username: $username, password: $password, password: $email, password: $birthday }';
}
