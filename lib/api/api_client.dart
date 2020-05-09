import 'dart:convert';

import 'package:http/http.dart' as http;

import '../auth/user_repository.dart';
import '../model/api_model.dart';

class ApiClient {
  static final instance = ApiClient();
  static const _baseUrl = 'http://127.0.0.1:8080';
  final _httpClient = http.Client();
  final _retryTimes = 3;
  final _retryDelay = Duration(seconds: 5);

  Future<http.Response> retry(Future<http.Response> Function() fn) async {
    int index = this._retryTimes;
    while (index > 0) {
      try {
        return await fn();
      } catch (e) {
        print("第 $index 次重試");
      }
      await Future.delayed(this._retryDelay);
      index--;
    }
    return null;
  }

  Future<ApiModel> get<T>(String url) async {
    final token = await UserRepository().getToken();
    print('''-----> [GET] Api Request <-----
          url: $_baseUrl$url
          header:''');
    final request = this._httpClient.get(
      '$_baseUrl$url',
      headers: {'X-Auth-Token': token},
    );
    final response = await retry(() => request);
    final json = jsonDecode(response.body);
    print('''-----> [GET] Api Response <-----
          header: ${response.headers}
          body: $json''');

    return ApiModel<T>.fromJson(json);
  }

  Future<ApiModel> post<T>(String url, {Map<String, String> body}) async {
    final token = await UserRepository().getToken();
    print('''-----> [POST] Api Request <-----
          url: $_baseUrl$url
          header:
          body: $body''');
    final request = this._httpClient.post(
          '$_baseUrl$url',
          headers: {'X-Auth-Token': token},
          body: body,
        );
    final response = await retry(() => request);
    final json = jsonDecode(response.body);
    print('''-----> [POST] Api Response <-----
          header: ${response.headers}
          body: $json''');

    if (url == '/login') {
      json['data'] = {'token': response.headers['x-auth-token']};
    }

    return ApiModel<T>.fromJson(json);
  }
}
