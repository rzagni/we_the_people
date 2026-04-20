import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_services/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthProvider({required this.authRepository});

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get currentUser => authRepository.currentUser;

  Future<void> signUp({required String email, required String password}) async {
    _setLoading(true);
    _clearError();

    try {
      await authRepository.signUp(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message ?? 'Sign up failed';
    } catch (_) {
      _errorMessage = 'Unexpected error during sign up';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    _setLoading(true);
    _clearError();

    try {
      await authRepository.signIn(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message ?? 'Sign in failed';
    } catch (_) {
      _errorMessage = 'Unexpected error during sign in';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    _setLoading(true);
    _clearError();

    try {
      await authRepository.signOut();
    } catch (_) {
      _errorMessage = 'Failed to sign out';
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
