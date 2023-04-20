import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_test/screens/screens.dart';
import 'package:solid_test/utils/utils.dart';

void main() {
  testWidgets('Tap on the widget changes the background color', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SolidTest()));

    // Verify initial background color
    expect(
      tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor,
      kColorDefault,
    );

    // Tap on the widget to change the background color
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle(kAnimationDuration);

    // Verify that the background color has changed
    expect(
      tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor,
      isNot(kColorDefault),
    );
  });
}
