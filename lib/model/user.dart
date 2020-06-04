import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String account;
  final String password;
  final String email;
  final String birthday;
  final int violationTimes;

  const User({
    this.account,
    this.password,
    this.email,
    this.birthday,
    this.violationTimes,
  });

  @override
  List<Object> get props => [
        account,
        password,
        email,
        birthday,
        violationTimes,
      ];

  factory User.fromJson(dynamic json) {
    return User(
      account: json['account'],
      password: json['password'],
      email: json['email'],
      birthday: json['birthday'],
      violationTimes: json['violationTimes'],
    );
  }

  Map<String, dynamic> toJson() => {
        'account': account,
        'password': password,
        'email': email,
        'birthday': birthday,
        'violationTimes': violationTimes,
      };

  static User fakeUser = User(
    account: 'john0224',
    password: '',
    email: 'john0224@gmail.com',
    birthday: '2005-05-25',
    violationTimes: 0,
  );
}
