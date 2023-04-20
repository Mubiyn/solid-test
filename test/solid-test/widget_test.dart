import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_test/screens/screens.dart';
import 'package:solid_test/utils/utils.dart';

void main() {
  testWidgets('Background color changes on tap', (WidgetTester tester) async {
    await tester.pumpWidget(const SolidTest());
    final gestureDetectorFinder = find.byType(GestureDetector);
    expect(gestureDetectorFinder, findsOneWidget);

    final scaffoldFinder = find.byType(Scaffold);
    expect(scaffoldFinder, findsOneWidget);
    expect(
      tester.widget<Scaffold>(scaffoldFinder).backgroundColor,
      kColorDefault,
    );

    await tester.tap(gestureDetectorFinder);
    await tester.pumpAndSettle(kAnimationDuration);
    expect(
      tester.widget<Scaffold>(scaffoldFinder).backgroundColor,
      isNot(kColorDefault),
    );
  });
}
