import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_boilerplate/app/modules/fuel/fuel_controller.dart';
import 'package:flutter_boilerplate/app/modules/fuel/fuel_module.dart';

void main() {
  initModule(FuelModule());
  FuelController fuel;

  setUp(() {
    // fuel = FuelModule.to.bloc<FuelController>();
  });

  group('FuelController Test', () {
    test("First Test", () {
      expect(fuel, isInstanceOf<FuelController>());
    });

    test("Set Value", () {
      // expect(fuel.value, equals(0));
      // fuel.increment();
      // expect(fuel.value, equals(1));
    });
  });
}
