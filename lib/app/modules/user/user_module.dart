import 'package:flutter_boilerplate/app/modules/user/form/user_form_controller.dart';
import 'package:flutter_boilerplate/app/modules/user/form/user_form_page.dart';
import 'package:flutter_boilerplate/app/modules/user/list/users_controller.dart';

import 'package:flutter_boilerplate/app/http/api/user_repository.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'list/users_page.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserFormController(i.get())),
        Bind((i) => UsersController(i.get())),
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
