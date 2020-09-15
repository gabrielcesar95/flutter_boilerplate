import 'package:flutter_boilerplate/app/http/api/user_repository.dart';
import 'package:flutter_boilerplate/app/models/user/user_model.dart';
import 'package:mobx/mobx.dart';

part 'users_controller.g.dart';

class UsersController = _UserControllerBase with _$UsersController;

abstract class _UserControllerBase with Store {
  final UserRepository repository;  
  
  @observable
  ObservableFuture<List<UserModel>> users;

  _UserControllerBase(this.repository){
    users = repository.list().asObservable();
  }
  
}
