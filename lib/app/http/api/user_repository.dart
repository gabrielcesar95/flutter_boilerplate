import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/app/exceptions/form_validation.dart';
import 'package:flutter_boilerplate/app/http/api/client.dart';
import 'package:flutter_boilerplate/app/models/user/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserRepository extends Api implements Disposable {
  String path = 'api/user';
  List<UserModel> users = [];

  Future<List<UserModel>> list({Map formData}) async {
    try {
      final response = await client.get(path, queryParameters: formData);

      for (var user in (response.data['data'] as List)) {
        UserModel model = UserModel.fromMap(user);

        users.add(model);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response == null) {
          throw Exception("Falha ao conectar");
        }

        if (e.response.statusCode == 422) {
          throw FormValidationException(e.response.data);
        }
      }
    }
    return users;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
