import 'package:flutter_boilerplate/app/exceptions/form_validation.dart';
import 'package:flutter_boilerplate/app/http/api/oauth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final OauthService _oauthService = Modular.get<OauthService>();

  @observable
  bool loading = false;

  @action
  void toggleLoading() {
    loading = !loading;
  }

  Future<List<SnackBar>> attemptLogin(String email, String password) async {
    try {
      await _oauthService.setClient(email, password);

      await Modular.to.pushReplacementNamed('/home');
      return [];
    } catch (e) {
      if (e is FormValidationException) {
        List<SnackBar> snackMessages = [];
        e.errors.forEach((field, errors) {
          errors.forEach((error) {
            snackMessages.add(SnackBar(
              content: Text(error),
            ));
          });
        });

        return snackMessages;
      }
    }
    return [];
  }
}
