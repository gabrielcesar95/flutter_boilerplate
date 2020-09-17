import 'package:flutter_boilerplate/app/http/api/user_repository.dart';
import 'package:flutter_boilerplate/app/models/user/user_model.dart';
import 'package:mobx/mobx.dart';

part 'users_controller.g.dart';

class UsersController = _UserControllerBase with _$UsersController;

abstract class _UserControllerBase with Store {
  final UserRepository repository;
  _UserControllerBase(this.repository);

  // Animations
  @observable
  bool pageLoading = false;

  // Data
  @observable
  int currentPage = 1;
  @observable
  ObservableFuture<List<UserModel>> users;

  @action
  void toggleLoading() {
    pageLoading = !pageLoading;
  }

  @action
  Future<void> fetchUsers() async {
    toggleLoading();
    users = ObservableFuture.value(await repository.list(page: currentPage));

    currentPage++;

    toggleLoading();
  }
}
