import 'dart:convert';

import 'package:courtesy_umbrella/model/api_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('jsonDecode', () {
    test('test json decoder', () {
      final Map<String, dynamic> json = jsonDecode('''{
          "result": false,
          "errorCode": "User - NotLogin",
          "message": "您尚未登入，請登入後再試一次。",
          "data": {}
      }''');

      final model = ApiModel.fromJson(json);
      print(model);
      expect(model.data, {});
    });

    test('test list decoder', () {
      final Map<String, dynamic> json = jsonDecode('''{
          "result": false,
          "errorCode": "User - NotLogin",
          "message": "您尚未登入，請登入後再試一次。",
          "data": []
      }''');

      final model = ApiModel.fromJson(json);
      print(model);
      expect(model.data, []);
    });
  });
}
