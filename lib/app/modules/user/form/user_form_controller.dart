import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/exceptions/form_validation.dart';
import 'package:flutter_boilerplate/app/http/api/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'user_form_controller.g.dart';

class UserFormController = _UserFormControllerBase with _$UserFormController;

abstract class _UserFormControllerBase with Store {
  final UserRepository repository;
  _UserFormControllerBase(this.repository);

  // Animations
  @observable
  bool pageLoading = false;

  // Form Controllers
  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();
  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  bool active = false;
  @observable
  bool emailVerified = false;

  // User
  // TODO: Adicionar model de usuário

  @action
  void toggleLoading() {
    pageLoading = !pageLoading;
  }

  @action
  void toggleActive() {
    active = !active;
  }

  Future<List<SnackBar>> attemptCreate(Map<String, dynamic> formData) async {
    toggleLoading();

    try {
      await repository.create(formData);
      
      await Modular.to.pushReplacementNamed('/users'); // TODO: Corrigir rota
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

        toggleLoading();
        return snackMessages;
      }
    }

    toggleLoading();
    return [];
  }
}
