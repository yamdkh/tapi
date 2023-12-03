import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_york/main.dart';

main() {
  //    THIS TEST ONLY WORK ON DEVELOPMENT MODE.
  testWidgets('Test If List of Post are on the screen by it type',
      (tester) async {
    await tester.pumpWidget(const MyApp());

    // Create the Finders.
    await tester.pumpAndSettle();
    final titleFinder = find.byKey(Key("POST_KEY"));
    await tester.pump();
    expect(titleFinder, findsAtLeast(2));
  });
}
