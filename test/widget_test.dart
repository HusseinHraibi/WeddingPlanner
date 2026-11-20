
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wedding_planner/main.dart';

void main() {
  testWidgets('Budget calculator displays inputs', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: BudgetCalculator()),
    );

    expect(find.text('Wedding Budget Calculator'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Calculate'), findsOneWidget);
  });
}
