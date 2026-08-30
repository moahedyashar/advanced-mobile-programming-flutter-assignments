# Student Profile App

Homework assignment for **Advanced Mobile Programming**.

> Before submission, replace `Yashar`, the email address, department, semester, and biography in `lib/main.dart` if your personal details differ.

## Requirement checklist

- Uses `MaterialApp`, `Scaffold`, and `AppBar`.
- Displays student name, department, semester, and biography.
- The app-wide Material 3 `ThemeData` defines colors, scaffold, app bar, and cards.
- A local `Theme` wraps only `SwitchListTile` and overrides its selected colors.
- `StudentProfileApp`, `ProfileHeader`, and `ProfileInfoCard` are stateless widgets.
- `StudentProfilePage` is stateful.
- The availability switch and biography button both call `setState`.
- `url_launcher` is an appropriate external package: **Send email** opens the device's email application.
- Widget tests cover the profile data and both state changes.

## Widget tree

```text
StudentProfileApp (StatelessWidget)
└── MaterialApp [global ThemeData]
    └── StudentProfilePage (StatefulWidget)
        └── Scaffold
            ├── AppBar
            └── SafeArea
                └── SingleChildScrollView
                    └── Column
                        ├── ProfileHeader (StatelessWidget)
                        ├── Row
                        │   ├── ProfileInfoCard [department]
                        │   └── ProfileInfoCard [semester]
                        ├── Card [biography + expand button]
                        ├── Theme [local SwitchTheme override]
                        │   └── Card
                        │       └── SwitchListTile [availability state]
                        └── FilledButton [url_launcher email action]
```

## Hot Reload demonstration

1. Run `flutter run` and turn **Available for projects** off.
2. Change the `AppBar` title or a UI color in `lib/main.dart`.
3. Save the file or press `r` in the terminal.

Hot Reload updates the code and rebuilds affected widgets while preserving the existing `State` object, so the switch stays off. Hot Restart (`R`) recreates the state and returns the switch to its initial on value.

## Run and test

```bash
flutter create . --platforms=android,web
flutter pub get
flutter test
flutter run
```

Capture screenshots with the switch on and off, then place them in `screenshots/`.
