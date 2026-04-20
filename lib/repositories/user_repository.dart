import 'package:firebase_auth/firebase_auth.dart';
import 'package:we_the_people/dataconnect_generated/generated.dart';

class AppUserRecord {
  final String id;
  final String email;
  final bool profileCompleted;
  final String? region;
  final String? language;
  final bool notificationsEnabled;

  const AppUserRecord({
    required this.id,
    required this.email,
    required this.profileCompleted,
    this.region,
    this.language,
    required this.notificationsEnabled,
  });
}

class UserRepository {
  final AppConnector _connector;

  UserRepository({AppConnector? connector})
    : _connector = connector ?? AppConnector.instance;

  Future<AppUserRecord?> getCurrentUserRecord() async {
    final result = await _connector.getCurrentUser().execute();

    final users = result.data.appUsers;
    if (users.isEmpty) return null;

    final user = users.first;

    return AppUserRecord(
      id: user.id,
      email: user.email,
      profileCompleted: user.profileCompleted,
      region: user.region,
      language: user.language,
      notificationsEnabled: user.notificationsEnabled,
    );
  }

  Future<AppUserRecord> upsertCurrentUser({required String email}) async {
    await _connector.upsertCurrentUser(email: email).execute();

    final user = await getCurrentUserRecord();
    if (user == null) {
      throw Exception('Failed to load current user after upsert.');
    }

    return user;
  }

  Future<void> completeOnboarding({
    required String email,
    required String region,
    required String language,
    required bool notificationsEnabled,
  }) async {
    await _connector
        .completeOnboarding(
          email: email,
          region: region,
          language: language,
          notificationsEnabled: notificationsEnabled,
        )
        .execute();
  }

  String? getCurrentFirebaseEmail() {
    return FirebaseAuth.instance.currentUser?.email;
  }
}
