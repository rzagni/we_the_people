import 'package:shared_models/user_preferences.dart';

class PreferencesRepository {
  Future<UserPreferences?> getPreferencesByUserId(String userId) async {
    // TODO: Replace with Firebase Data Connect query.
    return null;
  }

  Future<void> savePreferences({
    required String userId,
    required UserPreferences preferences,
  }) async {
    // TODO: Replace with Firebase Data Connect mutation.
  }
}
