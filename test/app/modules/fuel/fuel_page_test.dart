import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_boilerplate/app/modules/fuel/fuel_page.dart';

main() {
  testWidgets('FuelPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(FuelPage(title: 'Fuel')));
    final titleFinder = find.text('Fuel');
    expect(titleFinder, findsOneWidget);
  });
}
