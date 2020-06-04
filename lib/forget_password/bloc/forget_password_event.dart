import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();
}

class ForgetPasswordButtonPressed extends ForgetPasswordEvent {
  final String email;

  const ForgetPasswordButtonPressed({
    @required this.email,
  });

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'ForgetPasswordButtonPressed { email: $email }';
}
