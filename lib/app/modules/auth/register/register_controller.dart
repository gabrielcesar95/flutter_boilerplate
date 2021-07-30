import 'package:flutter_boilerplate/app/exceptions/form_validation.dart';
import 'package:flutter_boilerplate/app/http/api/auth_repository.dart';
import 'package:flutter_boilerplate/app/http/api/oauth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final OauthService _oauthService = Modular.get<OauthService>();
  final AuthRepository _repo = Modular.get<AuthRepository>();

  @observable
  bool pageLoading = false;

  @action
  void toggleLoading() {
    pageLoading = !pageLoading;
  }

  Future<List<SnackBar>> attemptRegister(
      String name, String email, String password) async {
    toggleLoading();
    try {
      await _repo
          .register({'name': name, 'email': email, 'password': password});

      await _oauthService.setClient(email, password);

      Modular.to.navigate('/home');
    } on FormValidationException catch (e) {
      List<SnackBar> snackMessages = [];

      e.errors?.forEach((field, errors) {
        errors.forEach((error) {
          snackMessages.add(SnackBar(
            content: Text(error),
          ));
        });
      });

      return snackMessages;
    }

    toggleLoading();
    return [];
  }
}
