import 'package:flutter_boilerplate/app/http/api/oauth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  
  final _oauthService = OauthService();

  void attemptLogout() async {
    try {
      await _oauthService.logout();
    } catch (error) {
      print(error.toString());
    }

    await Modular.to.pushReplacementNamed('/login');
  }
}
