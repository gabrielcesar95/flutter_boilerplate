import 'package:mobx/mobx.dart';

part 'user_form_controller.g.dart';

class UserFormController = _UserFormControllerBase with _$UserFormController;

abstract class _UserFormControllerBase with Store {
  @observable
  bool loading = false;

  @action
  void toggleLoading() {
    this.loading = !this.loading;
  }

  
}
