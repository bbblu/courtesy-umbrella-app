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

  Future<Map<String, String>> _getHeaders() async {
    return {
      'content-type': 'application/json',
      'x-auth-token': await UserRepository().getToken(),
    };
  }

  void _printLog(http.Response response, {Map<String, dynamic> body}) async {
    final request = response.request;
    print('''-----> [${request.method}] API Request <-----
    url: ${request.url}
    headers: ${request.headers}
    body: $body''');

    print('''-----> [${request.method}] API Response <-----
    status: ${response.statusCode}
    headers: ${response.headers}
    body: ${response.body}''');
  }

  Future<http.Response> retry(Future<http.Response> Function() fn) async {
    int index = this._retryTimes;
    while (index > 0) {
      try {
        return await fn();
      } catch (e) {
        print("第 ${this._retryTimes - index + 1} 次重試");
      }
      await Future.delayed(this._retryDelay);
      index--;
    }
    return null;
  }

  Future<ApiModel> get<T>(String url) async {
    final request = this._httpClient.get(
          '$_baseUrl$url',
          headers: await this._getHeaders(),
        );

    final response = await retry(() => request);
    final responseBody = jsonDecode(response.body);
    this._printLog(response);

    return ApiModel<T>.fromJson(responseBody);
  }

  Future<ApiModel> post<T>(String url, {Map<String, dynamic> body}) async {
    final request = this._httpClient.post(
          '$_baseUrl$url',
          headers: await this._getHeaders(),
          body: jsonEncode(body),
        );

    final response = await retry(() => request);
    final responseBody = jsonDecode(response.body);
    this._printLog(response, body: body);

    if (url == '/login') {
      responseBody['data'] = {'token': response.headers['x-auth-token']};
    }

    return ApiModel<T>.fromJson(responseBody);
  }
}
