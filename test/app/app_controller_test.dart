import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_boilerplate/app/app_controller.dart';
import 'package:flutter_boilerplate/app/app_module.dart';

void main() {
  initModule(AppModule());
  AppController? app;

  setUp(() {
    // app = AppModule.to.get<AppController>();
  });

  group('AppController Test', () {
    test('First Test', () {
      expect(app, isInstanceOf<AppController>());
    });

    test('Set Value', () {
      // expect(app.value, equals(0));
      // app.increment();
      // expect(app.value, equals(1));
    });
  });
}
