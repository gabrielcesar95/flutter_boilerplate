import 'package:flutter_boilerplate/app/http/api/user_repository.dart';

import 'user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'user_page.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserController(i.get())),
        Bind((i) => UserRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => UserPage()),
      ];

  static Inject get to => Inject<UserModule>.of();
}
