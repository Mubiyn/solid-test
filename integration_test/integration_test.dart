import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_test/screens/screens.dart';
import 'package:solid_test/utils/utils.dart';

void main() {
  group('SolidTest integration test', () {
    testWidgets('Test tap gesture changes the background color',
        (WidgetTester tester) async {
      // Build the widget tree and trigger a frame
      await tester.pumpWidget(const SolidTest());

      // Verify that the initial background color is kColorDefault
      expect(
        (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
        equals(kColorDefault),
      );

      // Tap the screen to change the background color
      await tester.tap(find.byKey(const Key('tap')));
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));

      await Future.delayed(const Duration(milliseconds: 1000), () {
        debugPrint('One second');
      });

      // Verify that the background color has changed
      expect(
        (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
        isNot(equals(kColorDefault)),
      );
    });
  });
}
