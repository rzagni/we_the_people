import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:we_the_people/models/user_preferences.dart';
import 'package:we_the_people/providers/auth_provider.dart';
import 'package:we_the_people/providers/preferences_provider.dart';
import 'package:we_the_people/repositories/user_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authProvider = context.read<AuthProvider>();
      final preferencesProvider = context.read<PreferencesProvider>();
      final userRepository = context.read<UserRepository>();
      final firebaseUser = authProvider.currentUser;

      if (firebaseUser == null) {
        if (!mounted) return;
        context.go('/login');
        return;
      }

      final email = firebaseUser.email;
      if (email == null || email.isEmpty) {
        if (!mounted) return;
        context.go('/login');
        return;
      }

      try {
        final userRecord = await userRepository.createCurrentUserIfMissing(
          email: email,
        );

        preferencesProvider.setPreferences(
          UserPreferences(
            zipCode: userRecord.zipCode,
            city: userRecord.city,
            state: userRecord.state,
            language: userRecord.language,
            notificationsEnabled: userRecord.notificationsEnabled,
            topics: const [],
          ),
        );

        if (!mounted) return;

        if (userRecord.profileCompleted) {
          context.go('/home');
        } else {
          context.go('/onboarding');
        }
      } catch (e) {
        debugPrint('Splash error: $e');

        if (!mounted) return;
        context.go('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
