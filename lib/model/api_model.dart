import 'package:equatable/equatable.dart';

import 'user.dart';

/* {
  "result": boolean,
  "errorCode": string,
  "message": string,
  "data": any
} */
class ApiModel<T> extends Equatable {
  final bool result;
  final String errorCode;
  final String message;
  final dynamic data;

  const ApiModel({
    this.result,
    this.errorCode,
    this.message,
    this.data,
  });

  @override
  List<Object> get props => [
        result,
        errorCode,
        message,
        data,
      ];

  ApiModel.fromJson(dynamic json)
      : result = json['result'],
        errorCode = json['errorCode'],
        message = json['message'],
        data = json['data'] is Iterable
            ? _mapList<T>(json['data'])
            : _mapData<T>(json['data']);

  Map<String, dynamic> toJson() => {
        'result': result,
        'errorCode': errorCode,
        'message': message,
        'data': data,
      };

  @override
  String toString() {
    return '''
    result: $result
    errorCode: $errorCode
    message: $message
    data: $data
    ''';
  }

  static T _mapData<T>(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return {} as T;
    }

    switch (T) {
      case User:
        return User.fromJson(json) as T;
    }

    throw Exception('Unknown Class Type');
  }

  static List<T> _mapList<T>(List jsonList) {
    if (jsonList.isEmpty) {
      return [];
    }

    List<T> output = [];

    for (Map<String, dynamic> json in jsonList) {
      output.add(_mapData<T>(json));
    }

    return output;
  }
}
