import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'user_form_controller.g.dart';

class UserFormController = _UserFormControllerBase with _$UserFormController;

abstract class _UserFormControllerBase with Store {
  @observable
  bool loading = false;

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

  @action
  void toggleLoading() {
    this.loading = !this.loading;
  }

  @action
  void toggleActive() {
    this.active = !this.active;
  }
  
}
