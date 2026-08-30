# Course Welcome App

Mini Project for **CS.SE.0731 — Advanced Mobile Programming, Week 2**.

## Requirement checklist

- `MaterialApp`, `Scaffold`, and `AppBar` are used.
- The home screen displays course title, code, semester, and week.
- A global Material 3 `ThemeData` controls colors, type, cards, and buttons.
- `CourseHomePage` is a `StatefulWidget`; the progress button and reminder icon update state with `setState`.
- `google_fonts` is the external package, used to apply the Inter font throughout the app.
- Reusable stateless widgets keep the UI readable: `_CourseHero` and `_InfoCard`.

## Widget tree

```text
CourseWelcomeApp (StatelessWidget)
└── MaterialApp [global ThemeData]
    └── CourseHomePage (StatefulWidget)
        └── Scaffold
            ├── AppBar
            │   └── IconButton [toggle reminder state]
            └── SafeArea
                └── SingleChildScrollView
                    └── Column
                        ├── _CourseHero (StatelessWidget)
                        ├── Row
                        │   ├── _InfoCard [semester]
                        │   └── _InfoCard [week]
                        └── Card
                            ├── LinearProgressIndicator
                            └── FilledButton [change progress state]
```

## Hot Reload demonstration

1. Run `flutter run` and tap **Complete next step** once so the screen shows `1/3`.
2. Change a visible string or color in `lib/main.dart`.
3. Save the file or press `r` in the terminal.

Hot Reload injects the updated Dart code and rebuilds the widget tree without restarting the app, so `_completedSteps` remains `1`. Hot Restart (`R`) recreates the app and resets it to `0`.

## Run and test

```bash
flutter create . --platforms=android,web
flutter pub get
flutter test
flutter run
```

Capture screenshots before and after pressing **Complete next step** and place them in `screenshots/`.
