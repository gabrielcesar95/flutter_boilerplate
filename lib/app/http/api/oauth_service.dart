import 'package:flutter_boilerplate/app/exceptions/form_validation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:oauth2/oauth2.dart' as oauth2;

class OauthService {
  static final OauthService _singleton = OauthService._internal();

  Future<Box> _box = Hive.openBox('oauth');
  static final String _url = DotEnv().env['APP_URL'];
  static final String _endpoint = "oauth/token";
  static final String _clientId = DotEnv().env['APP_CLIENT_ID'];
  static final String _clientSecret = DotEnv().env['APP_CLIENT_SECRET'];

  factory OauthService() {
    return _singleton;
  }

  OauthService._internal();

  final authorizationEndpoint = Uri.parse('$_url$_endpoint');

  Future<String> _getMobileToken() async {
    final Box box = await _box;

    return box.get('token');
  }

  Future<void> _setMobileToken(String token) async {
    final Box box = await _box;

    return box.put('token', token);
  }

  Future getClient() async {
    var _mobileToken = await _getMobileToken();

    if (_mobileToken == null || _mobileToken.isEmpty) {
      throw "Couldn't get user";
    } else {
      oauth2.Client client =
          oauth2.Client(oauth2.Credentials.fromJson(jsonDecode(_mobileToken)));

      return client;
    }
  }

  Future<void> setClient(username, password) async {
    try {
      var client = await oauth2.resourceOwnerPasswordGrant(
          authorizationEndpoint, username, password,
          identifier: _clientId, secret: _clientSecret);

      await _setMobileToken(jsonEncode(client.credentials.toJson()));
    } catch (e) {
      Map responseData = {
        "errors": {
          "auth": ["Falha no login"]
        }
      };

      if (e is oauth2.AuthorizationException) {
        responseData = {
          "errors": {
            "auth": ["Usuário/senha incorretos"]
          }
        };
      }

      throw FormValidationException(responseData);
    }
  }

  void closeClient(client) async {
    await _setMobileToken(jsonEncode(client.credentials.toJson()));

    client.close();
  }

  Future<bool> ensureLoggedIn() async {
    try {
      await getClient();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<void> logout() async {
    if (await ensureLoggedIn()) {
      final Box box = await _box;
      box.delete('token');
    }
  }
}
