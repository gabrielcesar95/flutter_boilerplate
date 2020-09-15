import 'package:flutter_boilerplate/app/http/api/user_repository.dart';
import 'package:flutter_boilerplate/app/models/user/user_model.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final UserRepository repository;  
  
  @observable
  ObservableFuture<List<UserModel>> users;

  _UserControllerBase(this.repository){
    users = repository.list().asObservable();
  }
  
}
