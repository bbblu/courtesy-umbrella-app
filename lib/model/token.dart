import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String token;

  const Token({
    this.token,
  });

  @override
  List<Object> get props => [
        token,
      ];

  factory Token.fromJson(dynamic json) {
    return Token(
      token: json['token'],
    );
  }
}
