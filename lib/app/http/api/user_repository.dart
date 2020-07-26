import 'package:flutter_boilerplate/app/exceptions/form_validation.dart';
import 'package:flutter_boilerplate/app/http/api/client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserRepository extends Api implements Disposable {
  String path = 'api/user';

  Future list({Map formData}) async {
    try {
      final response = await client.get(path, queryParameters: formData);

      return response.data;
    } catch (e) {
      if (e.response == null) {
        throw Exception("Falha ao conectar");
      }

      if (e.response.statusCode == 422) {
        throw FormValidationException(e.response.data);
      }

      return e.response.toString();
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
