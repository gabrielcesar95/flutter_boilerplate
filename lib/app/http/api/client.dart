import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/app/http/api/oauth_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Api {
  late Dio client;
  String path = '';

  final Future<String> _token = OauthService().getMobileToken();

  BaseOptions options = BaseOptions(
    baseUrl: dotenv.env['APP_URL'] ?? '',
    connectTimeout: 8000,
    receiveTimeout: 5000,
    headers: {
      'accept': 'application/json',
    },
  );

  Api() {
    client = Dio(options);

    client.interceptors.add(InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        String token = await _token;

        if (token.isNotEmpty && !options.headers.containsKey('Authorization')) {
          options.headers = {
            'Authorization': 'Bearer ${await getAccessToken()}'
          };
        }

        return handler.next(options);
      },
    ));
  }

  Future<String> getAccessToken() async {
    Map credentials = jsonDecode(await _token);

    return credentials['accessToken'];
  }
}
