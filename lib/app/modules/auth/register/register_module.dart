import 'package:flutter_boilerplate/app/http/api/auth_repository.dart';
import 'package:flutter_boilerplate/app/http/api/oauth_service.dart';
import 'package:flutter_boilerplate/app/modules/auth/register/register_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_boilerplate/app/modules/auth/register/register_page.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController()),
        Bind((i) => OauthService()),
        Bind((i) => AuthRepository())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => RegisterPage()),
      ];

  //static Inject get to => Inject<RegisterModule>.of();
}
