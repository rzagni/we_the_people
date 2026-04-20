import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:we_the_people/core/validators/app_validators.dart';
import 'package:we_the_people/providers/auth_provider.dart';
import 'package:we_the_people/providers/preferences_provider.dart';
import 'package:we_the_people/repositories/user_repository.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _regionController = TextEditingController();
  final _languageController = TextEditingController();

  final Set<String> _selectedTopics = <String>{};
  bool _notificationsEnabled = true;
  bool _isSaving = false;
  String? _screenError;

  static const List<String> _availableTopics = <String>[
    'Politics',
    'Social Issues',
    'Economy',
    'Education',
  ];

  @override
  void dispose() {
    _regionController.dispose();
    _languageController.dispose();
    super.dispose();
  }

  void _toggleTopic(String topic, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedTopics.add(topic);
      } else {
        _selectedTopics.remove(topic);
      }
    });
  }

  Future<void> _submit() async {
    setState(() {
      _screenError = null;
    });

    if (!_formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();
    final preferencesProvider = context.read<PreferencesProvider>();
    final userRepository = context.read<UserRepository>();

    final email = authProvider.currentUser?.email;
    if (email == null || email.isEmpty) {
      setState(() {
        _screenError = 'No authenticated user email found.';
      });
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      preferencesProvider.updateRegion(_regionController.text.trim());
      preferencesProvider.updateLanguage(_languageController.text.trim());
      preferencesProvider.updateTopics(_selectedTopics.toList());
      preferencesProvider.updateNotificationsEnabled(_notificationsEnabled);

      await userRepository.completeOnboarding(
        email: email,
        region: _regionController.text.trim(),
        language: _languageController.text.trim(),
        notificationsEnabled: _notificationsEnabled,
      );

      if (!mounted) return;
      context.go('/home');
    } catch (e) {
      setState(() {
        _screenError = 'Failed to save onboarding. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tell us a little about yourself',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'These preferences will help us send more relevant surveys.',
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _regionController,
                  decoration: const InputDecoration(
                    labelText: 'Region',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator:
                      (value) => AppValidators.requiredField(
                        value,
                        fieldName: 'Region',
                      ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _languageController,
                  decoration: const InputDecoration(
                    labelText: 'Language',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  validator:
                      (value) => AppValidators.requiredField(
                        value,
                        fieldName: 'Language',
                      ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Topics of interest',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                ..._availableTopics.map(
                  (topic) => CheckboxListTile(
                    value: _selectedTopics.contains(topic),
                    title: Text(topic),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) => _toggleTopic(topic, value ?? false),
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  value: _notificationsEnabled,
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Enable notifications'),
                  subtitle: const Text(
                    'Allow the app to notify you when a new survey is available.',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                if (_screenError != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      _screenError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSaving ? null : _submit,
                    child:
                        _isSaving
                            ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : const Padding(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              child: Text('Continue'),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
