import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/http/api/user_repository.dart';
import 'package:flutter_boilerplate/app/models/user/user_model.dart';
import 'package:mobx/mobx.dart';

part 'user_view_controller.g.dart';

class UserViewController = _UserViewControllerBase with _$UserViewController;

abstract class _UserViewControllerBase with Store {
  final UserRepository repository;
  _UserViewControllerBase(this.repository);

  // Animations
  @observable
  bool pageLoading = true;

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
  UserModel? user;

  @action
  void toggleLoading() {
    pageLoading = !pageLoading;
  }

  // TODO: Remover
  @action
  void toggleActive() {
    active = !active;
  }

  void attemptGet(int id) async {
    try {
      user = await repository.getUser(id);
    } catch (e) {
      throw Exception('Falha ao obter usuário');
    }

    toggleLoading();
  }
}
