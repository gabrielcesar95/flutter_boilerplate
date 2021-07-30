import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/main_drawer/main_drawer_controller.dart';
import 'package:flutter_boilerplate/app/http/api/auth_repository.dart';
import 'package:flutter_boilerplate/app/http/api/user_repository.dart';
import 'package:flutter_boilerplate/app/app_controller.dart';
import 'package:flutter_boilerplate/app/modules/auth/register/register_module.dart';
import 'package:flutter_boilerplate/app/modules/auth/login/login_module.dart';
import 'package:flutter_boilerplate/app/modules/user/user_module.dart';
import 'package:flutter_boilerplate/app/splash/splash_page.dart';
import 'package:flutter_boilerplate/app/modules/home/home_module.dart';
import 'package:flutter_boilerplate/app/modules/fuel/fuel_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => UserRepository()),
        Bind((i) => MainDrawerController()),
        Bind((i) => AuthRepository()),
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => SplashPage()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/register', module: RegisterModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/users', module: UserModule()),
        ModuleRoute('/fuel', module: FuelModule()),
      ];
}
