import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';
import '../model/api_model.dart';
import '../model/token.dart';

class UserRepository {
  Future<ApiModel> authenticate({
    @required String username,
    @required String password,
  }) async {
    final response = await ApiClient.instance.post<Token>('/login', body: {
      'account': username,
      'password': password,
    });

    return response;
  }

  Future<String> persistToken(String token) async {
    /// write to keystore/keychain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    return token;
  }

  Future<String> getToken() async {
    /// read from keystore/keychain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<bool> hasToken() async {
    /// check keystore/keychain is exist
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null;
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
