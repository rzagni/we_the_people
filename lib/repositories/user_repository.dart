import '../models/app_user.dart';

class UserRepository {
  Future<AppUser?> getUserByFirebaseUid(String firebaseUid) async {
    // TODO: Replace with Firebase Data Connect query.
    return null;
  }

  Future<AppUser> createUser({
    required String firebaseUid,
    required String? email,
  }) async {
    // TODO: Replace with Firebase Data Connect mutation.
    return AppUser(id: 'temp-id', firebaseUid: firebaseUid, email: email);
  }
}
