class AppUser {
  final String id;
  final String firebaseUid;
  final String? email;

  const AppUser({
    required this.id,
    required this.firebaseUid,
    required this.email,
  });

  AppUser copyWith({String? id, String? firebaseUid, String? email}) {
    return AppUser(
      id: id ?? this.id,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      email: email ?? this.email,
    );
  }
}
