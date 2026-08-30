import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_profile_app/main.dart';

void main() {
  testWidgets('shows profile details and changes availability', (tester) async {
    await tester.pumpWidget(const StudentProfileApp());

    expect(find.text('Yashar'), findsOneWidget);
    expect(find.text('Computer Science'), findsOneWidget);
    expect(find.text('7th Semester'), findsOneWidget);
    expect(find.text('Open to student collaboration'), findsOneWidget);

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    expect(find.text('Currently focused on coursework'), findsOneWidget);
  });

  testWidgets('expands biography', (tester) async {
    await tester.pumpWidget(const StudentProfileApp());

    await tester.tap(find.text('Read more'));
    await tester.pumpAndSettle();

    expect(find.text('Show less'), findsOneWidget);
    expect(find.textContaining('one codebase'), findsOneWidget);
  });
}
