class UserPreferences {
  final String? zipCode;
  final String? city;
  final String? state;
  final String? language;
  final List<String> topics;
  final bool notificationsEnabled;

  const UserPreferences({
    this.zipCode,
    this.city,
    this.state,
    this.language,
    this.topics = const [],
    this.notificationsEnabled = true,
  });

  UserPreferences copyWith({
    String? zipCode,
    String? city,
    String? state,
    String? language,
    List<String>? topics,
    bool? notificationsEnabled,
  }) {
    return UserPreferences(
      zipCode: zipCode ?? this.zipCode,
      city: city ?? this.city,
      state: state ?? this.state,
      language: language ?? this.language,
      topics: topics ?? this.topics,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}
