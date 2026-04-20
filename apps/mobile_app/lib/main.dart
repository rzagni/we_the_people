import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_services/repositories/auth_repository.dart';
import 'package:shared_services/repositories/preferences_repository.dart';
import 'package:shared_services/repositories/user_repository.dart';
import 'package:we_the_people_mobile/app/app.dart';
import 'package:we_the_people_mobile/firebase_options.dart';
import 'package:we_the_people_mobile/providers/auth_provider.dart';
import 'package:we_the_people_mobile/providers/preferences_provider.dart';
import 'package:we_the_people_mobile/providers/user_provider.dart';
import 'package:we_the_people_mobile/services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (!kIsWeb) {
    await NotificationService.instance.initialize();
  }

  runApp(const Bootstrap());
}

class Bootstrap extends StatelessWidget {
  const Bootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepository>(create: (_) => AuthRepository()),
        Provider<UserRepository>(create: (_) => UserRepository()),
        Provider<PreferencesRepository>(create: (_) => PreferencesRepository()),
        ChangeNotifierProvider<AuthProvider>(
          create:
              (context) =>
                  AuthProvider(authRepository: context.read<AuthRepository>()),
        ),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<PreferencesProvider>(
          create: (_) => PreferencesProvider(),
        ),
      ],
      child: const WeThePeopleApp(),
    );
  }
}
