import 'package:flutter_boilerplate/app/modules/user/user_module.dart';

import 'widgets/main_drawer/main_drawer_controller.dart';
import 'package:flutter_boilerplate/app/http/api/auth_repository.dart';
import 'package:flutter_boilerplate/app/app_controller.dart';
import 'package:flutter_boilerplate/app/modules/auth/register/register_module.dart';
import 'package:flutter_boilerplate/app/modules/auth/login/login_module.dart';
import 'package:flutter_boilerplate/app/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/app_widget.dart';
import 'package:flutter_boilerplate/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MainDrawerController()),
        Bind((i) => AuthRepository()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (context, args) => SplashPage()),
        Router('/login', module: LoginModule()),
        Router('/register', module: RegisterModule()),
        Router('/home', module: HomeModule()),
        Router('/users', module: UserModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
