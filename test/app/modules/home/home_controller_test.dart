import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_boilerplate/app/modules/home/home_controller.dart';
import 'package:flutter_boilerplate/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  HomeController? home;

  setUp(() {
    // home = HomeModule.to.get<HomeController>();
  });

  group('HomeController Test', () {
    test('First Test', () {
      expect(home, isInstanceOf<HomeController>());
    });

    test('Set Value', () {
      // expect(home.value, equals(0));
      // home.increment();
      // expect(home.value, equals(1));
    });
  });
}
