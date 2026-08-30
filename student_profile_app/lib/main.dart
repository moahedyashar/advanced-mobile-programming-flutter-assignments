import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const StudentProfileApp());

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF006D77);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
        scaffoldBackgroundColor: const Color(0xFFF4F8F7),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        cardTheme: const CardThemeData(
          elevation: 0,
          margin: EdgeInsets.zero,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
        ),
      ),
      home: const StudentProfilePage(),
    );
  }
}

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  bool _availableForProjects = true;
  bool _showFullBiography = false;

  static final Uri _emailUri = Uri(
    scheme: 'mailto',
    path: 'yashar.student@example.com',
    queryParameters: {'subject': 'Hello from the Student Profile app'},
  );

  Future<void> _sendEmail() async {
    if (!await launchUrl(_emailUri)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No email application is available.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final biography = _showFullBiography
        ? 'I am a Computer Science student interested in mobile development, '
              'clean user interfaces, and solving practical problems with code. '
              'I enjoy learning Flutter because one codebase can deliver polished '
              'experiences across multiple platforms.'
        : 'I am a Computer Science student interested in mobile development, '
              'clean user interfaces, and solving practical problems with code.';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Profile',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileHeader(
                name: 'Yashar',
                department: 'Computer Science',
                available: _availableForProjects,
              ),
              const SizedBox(height: 18),
              const Row(
                children: [
                  Expanded(
                    child: ProfileInfoCard(
                      icon: Icons.school_rounded,
                      label: 'Department',
                      value: 'Computer Science',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ProfileInfoCard(
                      icon: Icons.auto_stories_rounded,
                      label: 'Semester',
                      value: '7th Semester',
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
                      Text(
                        'About me',
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 10),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          biography,
                          style: TextStyle(
                            color: colors.onSurfaceVariant,
                            height: 1.55,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () => setState(
                            () => _showFullBiography = !_showFullBiography,
                          ),
                          icon: Icon(
                            _showFullBiography
                                ? Icons.expand_less_rounded
                                : Icons.expand_more_rounded,
                          ),
                          label: Text(
                            _showFullBiography ? 'Show less' : 'Read more',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              // Local theme override: only this card uses the warmer switch color.
              Theme(
                data: Theme.of(context).copyWith(
                  switchTheme: SwitchThemeData(
                    thumbColor: WidgetStateProperty.resolveWith(
                      (states) => states.contains(WidgetState.selected)
                          ? const Color(0xFFE76F51)
                          : null,
                    ),
                    trackColor: WidgetStateProperty.resolveWith(
                      (states) => states.contains(WidgetState.selected)
                          ? const Color(0xFFF4A896)
                          : null,
                    ),
                  ),
                ),
                child: Card(
                  child: SwitchListTile(
                    value: _availableForProjects,
                    onChanged: (value) =>
                        setState(() => _availableForProjects = value),
                    secondary: const Icon(Icons.work_outline_rounded),
                    title: const Text(
                      'Available for projects',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      _availableForProjects
                          ? 'Open to student collaboration'
                          : 'Currently focused on coursework',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              FilledButton.icon(
                onPressed: _sendEmail,
                icon: const Icon(Icons.mail_outline_rounded),
                label: const Text('Send email'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
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

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.department,
    required this.available,
  });

  final String name;
  final String department;
  final bool available;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: Text(
                    name.substring(0, 1).toUpperCase(),
                    style: TextStyle(
                      color: colors.primary,
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: available
                          ? const Color(0xFF52B788)
                          : const Color(0xFFB0BEC5),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '$department Student',
              style: const TextStyle(color: Color(0xFFCDEAE7), fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    super.key,
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: colors.primary),
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
