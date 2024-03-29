import 'package:flutter_boilerplate/app/http/api/auth_repository.dart';
import 'package:flutter_boilerplate/app/http/api/oauth_service.dart';
import 'package:flutter_boilerplate/app/modules/auth/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_boilerplate/app/modules/auth/login/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
        Bind((i) => OauthService()),
        Bind((i) => AuthRepository())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  // static Inject get to => Inject<LoginModule>.of();
}
