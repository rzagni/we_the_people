import 'package:flutter/foundation.dart';
import 'package:we_the_people/models/user_preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  UserPreferences _preferences = const UserPreferences();
  bool _isLoading = false;
  String? _errorMessage;

  UserPreferences get preferences => _preferences;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void updateZipCode(String value) {
    _preferences = _preferences.copyWith(zipCode: value);
    notifyListeners();
  }

  void updateCity(String value) {
    _preferences = _preferences.copyWith(city: value);
    notifyListeners();
  }

  void updateState(String value) {
    _preferences = _preferences.copyWith(state: value);
    notifyListeners();
  }

  void updateLanguage(String value) {
    _preferences = _preferences.copyWith(language: value);
    notifyListeners();
  }

  void updateTopics(List<String> topics) {
    _preferences = _preferences.copyWith(topics: topics);
    notifyListeners();
  }

  void updateNotificationsEnabled(bool value) {
    _preferences = _preferences.copyWith(notificationsEnabled: value);
    notifyListeners();
  }

  void setPreferences(UserPreferences preferences) {
    _preferences = preferences;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}
