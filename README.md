# Advanced Mobile Programming — Flutter Assignments

This repository contains two independent Flutter projects for **CS.SE.0731 — Advanced Mobile Programming (Week 2)**.

| Project | Purpose | Stateful interaction | External package |
| --- | --- | --- | --- |
| [`course_welcome_app`](course_welcome_app/) | Mini Project: Course Welcome App | Tracks completed welcome steps and toggles reminders | `google_fonts` for course typography |
| [`student_profile_app`](student_profile_app/) | Homework: Student Profile App | Toggles availability and expands/collapses biography | `url_launcher` for the email action |

## Run either project

```bash
cd course_welcome_app # or student_profile_app
flutter create . --platforms=android,web
flutter pub get
flutter run
```

The `flutter create` command only supplies platform runner files if they are not already present; it does not replace `lib/main.dart`.

Each project has its own README with requirement mapping, Hot Reload explanation, widget tree, testing commands, and screenshot instructions.
