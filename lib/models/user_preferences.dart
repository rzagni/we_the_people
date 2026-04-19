class UserPreferences {
  final String? region;
  final String? language;
  final List<String> topics;
  final bool notificationsEnabled;

  const UserPreferences({
    this.region,
    this.language,
    this.topics = const [],
    this.notificationsEnabled = true,
  });

  UserPreferences copyWith({
    String? region,
    String? language,
    List<String>? topics,
    bool? notificationsEnabled,
  }) {
    return UserPreferences(
      region: region ?? this.region,
      language: language ?? this.language,
      topics: topics ?? this.topics,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}
