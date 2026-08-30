import 'package:course_welcome_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows course details and updates progress', (tester) async {
    await tester.pumpWidget(const CourseWelcomeApp());

    expect(find.text('Advanced Mobile\nProgramming'), findsOneWidget);
    expect(find.text('CS.SE.0731'), findsOneWidget);
    expect(find.text('Spring 2026'), findsOneWidget);
    expect(find.text('0/3'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Complete next step'));
    await tester.pump();

    expect(find.text('1/3'), findsOneWidget);
  });
}
