import 'package:flutter_boilerplate/app/exceptions/form_validation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class OauthService {
  static final OauthService _singleton = OauthService._internal();

  final Future<Box> _box = Hive.openBox('oauth');
  static final String _url = DotEnv().env['APP_URL'];
  static final String _endpoint = 'oauth/token';
  static final String _clientId = DotEnv().env['APP_CLIENT_ID'];
  static final String _clientSecret = DotEnv().env['APP_CLIENT_SECRET'];

  factory OauthService() {
    return _singleton;
  }

  OauthService._internal();

  final authorizationEndpoint = Uri.parse('$_url$_endpoint');

  Future<String> getMobileToken() async {
    final Box box = await _box;

    return box.get('token');
  }

  Future<void> _setMobileToken(oauth2.Credentials credentials) async {
    final Box box = await _box;

    return box.put('token', credentials.toJson());
  }

  Future getClient() async {
    var _mobileToken = await getMobileToken();

    if (_mobileToken == null || _mobileToken.isEmpty) {
      throw "Couldn't get user";
    } else {
      oauth2.Client client = oauth2.Client(oauth2.Credentials.fromJson(_mobileToken));

      return client;
    }
  }

  Future<void> setClient(username, password) async {
    try {
      var client = await oauth2.resourceOwnerPasswordGrant(
          authorizationEndpoint, username, password,
          identifier: _clientId, secret: _clientSecret);

      await _setMobileToken(client.credentials);
    } catch (e) {
      Map responseData = {
        'errors': {
          'auth': ['Falha no login']
        }
      };

      if (e is oauth2.AuthorizationException) {
        responseData = {
          'errors': {
            'auth': ['Usuário/senha incorretos']
          }
        };
      }

      throw FormValidationException(responseData);
    }
  }

  void closeClient(client) async {
    await _setMobileToken(client.credentials);

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
      await box.delete('token');
    }
  }
}
