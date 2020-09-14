import 'package:flutter_boilerplate/app/modules/user/user_form/user_form_page.dart';

import 'user_form/user_form_controller.dart';
import 'package:flutter_boilerplate/app/http/api/user_repository.dart';

import 'user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'user_page.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserFormController(i.get())),
        Bind((i) => UserController(i.get())),
        Bind((i) => UserRepository()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => UserPage()),
        ModularRouter('/new', child: (_, args) => UserFormPage()),
        ModularRouter('/edit/:id', child: (_, args) => UserFormPage(id: args.params['id'])),
      ];

  static Inject get to => Inject<UserModule>.of();
}
