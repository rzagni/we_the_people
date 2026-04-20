import 'package:firebase_auth/firebase_auth.dart';
import 'package:we_the_people/dataconnect_generated/app.dart';

class AppUserRecord {
  final String id;
  final String email;
  final bool profileCompleted;
  final String? zipCode;
  final String? city;
  final String? state;
  final String? language;
  final bool notificationsEnabled;

  const AppUserRecord({
    required this.id,
    required this.email,
    required this.profileCompleted,
    this.zipCode,
    this.city,
    this.state,
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
      zipCode: user.zipCode,
      city: user.city,
      state: user.state,
      language: user.language,
      notificationsEnabled: user.notificationsEnabled,
    );
  }

  Future<AppUserRecord> createCurrentUserIfMissing({
    required String email,
  }) async {
    final existingUser = await getCurrentUserRecord();
    if (existingUser != null) {
      return existingUser;
    }

    await _connector.upsertCurrentUser(email: email).execute();

    final createdUser = await getCurrentUserRecord();
    if (createdUser == null) {
      throw Exception('Failed to load current user after creation.');
    }

    return createdUser;
  }

  Future<void> completeOnboarding({
    required String email,
    required String zipCode,
    required String city,
    required String state,
    required String language,
    required bool notificationsEnabled,
  }) async {
    await _connector
        .completeOnboarding(
          email: email,
          zipCode: zipCode,
          city: city,
          state: state,
          language: language,
          notificationsEnabled: notificationsEnabled,
        )
        .execute();
  }

  String? getCurrentFirebaseEmail() {
    return FirebaseAuth.instance.currentUser?.email;
  }
}
