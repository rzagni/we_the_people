import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_the_people/providers/auth_provider.dart';
import 'package:we_the_people/providers/preferences_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final preferencesProvider = context.watch<PreferencesProvider>();

    final user = authProvider.currentUser;
    final preferences = preferencesProvider.preferences;

    return Scaffold(
      appBar: AppBar(
        title: const Text('We the People'),
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<AuthProvider>().signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Logged in as: ${user?.email ?? 'Unknown'}'),
            const SizedBox(height: 12),
            Text('Region: ${preferences.region ?? '-'}'),
            Text('Language: ${preferences.language ?? '-'}'),
            Text('Topics: ${preferences.topics.join(', ')}'),
            Text(
              'Notifications: ${preferences.notificationsEnabled ? 'Enabled' : 'Disabled'}',
            ),
            const SizedBox(height: 24),
            const Text(
              'Sprint 1 complete: auth + onboarding foundation is in place.',
            ),
          ],
        ),
      ),
    );
  }
}
