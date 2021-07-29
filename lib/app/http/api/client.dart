import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/app/http/api/oauth_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Api {
  Dio client;
  String path;

  Future<String> _token = OauthService().getMobileToken();

  BaseOptions options = BaseOptions(
    baseUrl: dotenv.env['APP_URL'],
    connectTimeout: 8000,
    receiveTimeout: 5000,
    headers: {
      'Accept': 'application/json',
    },
  );

  Api() {
    client = new Dio(options);

    client.interceptors.add(InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        String token = await this._token;

        if (token != null && !options.headers.containsKey('Authorization')) {
          options.headers = {
            'Authorization': 'Bearer ${await getAccessToken()}'
          };
        }

        return handler.next(options);
      },
    ));
  }

  getAccessToken() async {
    Map credentials = jsonDecode(await this._token);

    return credentials['accessToken'];
  }
}
