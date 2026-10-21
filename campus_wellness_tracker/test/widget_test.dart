import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:campus_wellness_tracker/main.dart';
import 'package:campus_wellness_tracker/widgets/answer_choice_tile.dart';

void main() {
  testWidgets('wide answer grid displays choices in A C / B D order', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(900, 800);
    tester.view.devicePixelRatio = 1;
    await tester.pumpWidget(const CampusWellnessApp());
    await tester.pumpAndSettle();
    await tester.tap(find.text('Start Assessment'));
    await tester.pumpAndSettle();

    final a = tester.getTopLeft(
      find.ancestor(
        of: find.text('Not well at all'),
        matching: find.byType(AnswerChoiceTile),
      ),
    );
    final b = tester.getTopLeft(
      find.ancestor(
        of: find.text('A little restless'),
        matching: find.byType(AnswerChoiceTile),
      ),
    );
    final c = tester.getTopLeft(
      find.ancestor(
        of: find.text('Pretty well'),
        matching: find.byType(AnswerChoiceTile),
      ),
    );
    final d = tester.getTopLeft(
      find.ancestor(
        of: find.text('Great, fully rested'),
        matching: find.byType(AnswerChoiceTile),
      ),
    );

    expect(a.dx, lessThan(c.dx));
    expect(b.dx, lessThan(d.dx));
    expect(a.dy, closeTo(c.dy, 1));
    expect(b.dy, closeTo(d.dy, 1));
    expect(a.dy, lessThan(b.dy));

    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  testWidgets('check-in adapts to narrow and landscape layouts', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    await tester.pumpWidget(const CampusWellnessApp());
    await tester.tap(find.text('Start Assessment'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);

    tester.view.physicalSize = const Size(800, 360);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);

    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  testWidgets('check-in questions lead to a scored summary', (tester) async {
    await tester.pumpWidget(const CampusWellnessApp());
    await tester.tap(find.text('Start Assessment'));
    await tester.pumpAndSettle();

    expect(find.text('How did you sleep last night?'), findsOneWidget);
    expect(find.text('Not well at all'), findsOneWidget);
    expect(find.text('A little restless'), findsOneWidget);
    expect(find.text('Pretty well'), findsOneWidget);
    expect(find.text('Great, fully rested'), findsOneWidget);

    const answers = [
      'Great, fully rested',
      'Feeling energized',
      'Really positive',
      'Lots of movement',
      'Very connected',
      'Well balanced',
    ];

    for (var index = 0; index < answers.length; index++) {
      await tester.tap(find.text(answers[index]));
      await tester.pump();
      await tester.tap(
        find.text(index == answers.length - 1 ? 'See my summary' : 'Continue'),
      );
      await tester.pumpAndSettle();
    }

    expect(find.text('18 out of 18 points'), findsOneWidget);
    expect(find.text('You’re doing great!'), findsOneWidget);
    expect(find.text('YOUR WELLNESS PICTURE'), findsOneWidget);

    await tester.ensureVisible(find.text('Start a new check-in'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Start a new check-in'));
    await tester.pumpAndSettle();

    expect(find.text('How did you sleep last night?'), findsOneWidget);
  });
}
