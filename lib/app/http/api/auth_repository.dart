import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/app/exceptions/form_validation.dart';
import 'package:flutter_boilerplate/app/http/api/client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthRepository extends Api implements Disposable {
  Future register(formData) async {
    try {
      final response = await client.post('api/register', data: formData);

      return response.data;
    } on DioError catch (e) {
      if (e.response == null) {
        throw Exception('Falha ao conectar');
      }

      if (e.response?.statusCode == 422) {
        throw FormValidationException(e.response?.data);
      }

      return e.response.toString();
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
