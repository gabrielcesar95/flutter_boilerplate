import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutter_boilerplate/app/modules/fuel/fuel_page.dart';

main() {
  testWidgets('FuelPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(FuelPage(title: 'Fuel')));
    final titleFinder = find.text('Fuel');
    expect(titleFinder, findsOneWidget);
  });
}
