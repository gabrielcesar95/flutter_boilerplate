import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Api {
  Dio client;
  String path;

  BaseOptions options = BaseOptions(
    baseUrl: DotEnv().env['APP_URL'],
    connectTimeout: 8000,
    receiveTimeout: 5000,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer token'
    },
  );

  Api() {
    client = new Dio(options);
  }
}
