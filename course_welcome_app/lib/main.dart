import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const CourseWelcomeApp());

class CourseWelcomeApp extends StatelessWidget {
  const CourseWelcomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF315CDE);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Mobile Programming',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
        cardTheme: const CardThemeData(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
      home: const CourseHomePage(),
    );
  }
}

class CourseHomePage extends StatefulWidget {
  const CourseHomePage({super.key});

  @override
  State<CourseHomePage> createState() => _CourseHomePageState();
}

class _CourseHomePageState extends State<CourseHomePage> {
  int _completedSteps = 0;
  bool _remindersEnabled = true;

  static const int _totalSteps = 3;

  void _completeNextStep() {
    setState(() {
      if (_completedSteps < _totalSteps) {
        _completedSteps++;
      } else {
        _completedSteps = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isComplete = _completedSteps == _totalSteps;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Welcome'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            tooltip: _remindersEnabled
                ? 'Disable reminders'
                : 'Enable reminders',
            onPressed: () =>
                setState(() => _remindersEnabled = !_remindersEnabled),
            icon: Icon(
              _remindersEnabled
                  ? Icons.notifications_active_rounded
                  : Icons.notifications_off_rounded,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CourseHero(colors: colors),
              const SizedBox(height: 20),
              Text(
                'Welcome to week 2',
                style: Theme.of(context).textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                'Build beautiful, responsive mobile experiences with Flutter.',
                style: Theme.of(context).textTheme.bodyLarge
                    ?.copyWith(color: colors.onSurfaceVariant, height: 1.5),
              ),
              const SizedBox(height: 18),
              const Row(
                children: [
                  Expanded(
                    child: _InfoCard(
                      icon: Icons.calendar_month_rounded,
                      label: 'Semester',
                      value: 'Spring 2026',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _InfoCard(
                      icon: Icons.layers_rounded,
                      label: 'Module',
                      value: 'Week 2',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Getting started',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '$_completedSteps/$_totalSteps',
                            style: TextStyle(
                              color: colors.primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      LinearProgressIndicator(
                        value: _completedSteps / _totalSteps,
                        minHeight: 9,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      const SizedBox(height: 18),
                      FilledButton.icon(
                        onPressed: _completeNextStep,
                        icon: Icon(
                          isComplete
                              ? Icons.refresh_rounded
                              : Icons.check_circle_outline_rounded,
                        ),
                        label: Text(
                          isComplete ? 'Reset progress' : 'Complete next step',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseHero extends StatelessWidget {
  const _CourseHero({required this.colors});

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.primary, const Color(0xFF6C63FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(99),
            ),
            child: const Text(
              'CS.SE.0731',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'Advanced Mobile\nProgramming',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              height: 1.12,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Learn • Build • Iterate',
            style: TextStyle(color: Color(0xFFDDE4FF), fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: colors.primary),
            const SizedBox(height: 14),
            Text(label, style: TextStyle(color: colors.onSurfaceVariant)),
            const SizedBox(height: 3),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
