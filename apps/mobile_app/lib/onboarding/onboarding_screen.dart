import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:we_the_people_mobile/app/theme/app_colors.dart';
import 'package:we_the_people_mobile/app/theme/app_spacing.dart';
import 'package:we_the_people_mobile/validators/app_validators.dart';
import 'package:shared_services/dataconnect_generated/app.dart';
import 'package:we_the_people_mobile/providers/auth_provider.dart';
import 'package:we_the_people_mobile/providers/preferences_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _zipCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();

  final Set<String> _selectedTopics = <String>{};
  bool _notificationsEnabled = true;
  bool _isSaving = false;
  String? _selectedLanguage;

  static const List<String> _availableTopics = <String>[
    'Politics',
    'Social Issues',
    'Economy',
    'Education',
  ];

  static const List<String> _availableLanguages = <String>[
    'English',
    'Español',
    'Português',
    'Tagalog',
  ];

  @override
  void dispose() {
    _zipCodeController.dispose();
    _cityController.dispose();
    _stateController.dispose();
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
    if (!_formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();
    final preferencesProvider = context.read<PreferencesProvider>();
    final email = authProvider.currentUser?.email;

    if (email == null || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to determine current user email.'),
        ),
      );
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      await AppConnector.instance
          .completeOnboarding(
            email: email,
            zipCode: _zipCodeController.text.trim(),
            city: _cityController.text.trim(),
            state: _stateController.text.trim(),
            language: _selectedLanguage!,
            notificationsEnabled: _notificationsEnabled,
          )
          .execute();

      preferencesProvider.updateZipCode(_zipCodeController.text.trim());
      preferencesProvider.updateCity(_cityController.text.trim());
      preferencesProvider.updateState(_stateController.text.trim());
      preferencesProvider.updateLanguage(_selectedLanguage!);
      preferencesProvider.updateTopics(_selectedTopics.toList());
      preferencesProvider.updateNotificationsEnabled(_notificationsEnabled);

      if (!mounted) return;
      context.go('/home');
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to save onboarding: $e')));
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
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.lg),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
                ),
                child: const Text(
                  'YOUR PREFERENCES',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Help us make surveys more relevant.',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Set a few preferences so we can send you short questions that match your interests and location.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('About you', style: theme.textTheme.titleLarge),
                      const SizedBox(height: AppSpacing.lg),
                      TextFormField(
                        controller: _zipCodeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'ZIP code',
                          hintText: 'e.g. 33101',
                        ),
                        validator: (value) {
                          final trimmed = value?.trim() ?? '';
                          if (trimmed.isEmpty) {
                            return 'ZIP code is required';
                          }
                          if (trimmed.length < 5) {
                            return 'Enter a valid ZIP code';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      TextFormField(
                        controller: _cityController,
                        decoration: const InputDecoration(labelText: 'City'),
                        validator:
                            (value) => AppValidators.requiredField(
                              value,
                              fieldName: 'City',
                            ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      TextFormField(
                        controller: _stateController,
                        decoration: const InputDecoration(labelText: 'State'),
                        validator:
                            (value) => AppValidators.requiredField(
                              value,
                              fieldName: 'State',
                            ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      DropdownButtonFormField<String>(
                        value: _selectedLanguage,
                        decoration: const InputDecoration(
                          labelText: 'Language',
                        ),
                        items:
                            _availableLanguages
                                .map(
                                  (language) => DropdownMenuItem<String>(
                                    value: language,
                                    child: Text(language),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedLanguage = value;
                          });
                        },
                        validator:
                            (value) => AppValidators.requiredField(
                              value,
                              fieldName: 'Language',
                            ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      Text(
                        'Topics of interest',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ..._availableTopics.map(
                        (topic) => CheckboxListTile(
                          value: _selectedTopics.contains(topic),
                          title: Text(topic),
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged:
                              (value) => _toggleTopic(topic, value ?? false),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      SwitchListTile(
                        value: _notificationsEnabled,
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Enable notifications'),
                        subtitle: const Text(
                          'Receive alerts when a new survey is available.',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _notificationsEnabled = value;
                          });
                        },
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isSaving ? null : _submit,
                          child:
                              _isSaving
                                  ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                  : const Text('Continue'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
