import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/api_model.dart';

class ApiClient {
  static final instance = ApiClient();
  static const _baseUrl = 'http://172.20.10.3:8080';
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
    print('''-----> [GET] Api Request <-----
          url: $_baseUrl$url
          header:''');
    final request = this._httpClient.get('$_baseUrl$url');
    final response = await retry(() => request);
    final json = jsonDecode(response.body);
    print('''-----> [GET] Api Response <-----
          header: ${response.headers}
          body: $json''');

    return ApiModel<T>.fromJson(json);
  }

  Future<ApiModel> post<T>(String url, {Map<String, String> body}) async {
    print('''-----> [POST] Api Request <-----
          url: $_baseUrl$url
          header:
          body: $body''');
    final request = this._httpClient.post('$_baseUrl$url', body: body);
    final response = await retry(() => request);
    final json = jsonDecode(response.body);
    print('''-----> [POST] Api Response <-----
          header: ${response.headers}
          body: $json''');

    return ApiModel<T>.fromJson(json);
  }
}
