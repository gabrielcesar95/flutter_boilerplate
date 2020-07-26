import 'package:flutter_boilerplate/app/modules/fuel/fuel_controller.dart';
import 'package:flutter_boilerplate/app/modules/fuel/fuel_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FuelModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FuelController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: ((_, args) => FuelPage())),
      ];

  static Inject get to => Inject<FuelModule>.of();
}
