import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:we_the_people/app/theme/app_colors.dart';
import 'package:we_the_people/app/theme/app_spacing.dart';
import 'package:we_the_people/core/validators/app_validators.dart';
import 'package:we_the_people/providers/preferences_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _regionController = TextEditingController();

  final Set<String> _selectedTopics = <String>{};
  bool _notificationsEnabled = true;
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
    _regionController.dispose();
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

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final preferencesProvider = context.read<PreferencesProvider>();
    preferencesProvider.updateRegion(_regionController.text.trim());
    preferencesProvider.updateLanguage(_selectedLanguage!);
    preferencesProvider.updateTopics(_selectedTopics.toList());
    preferencesProvider.updateNotificationsEnabled(_notificationsEnabled);

    context.go('/home');
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
                'Set a few preferences so we can send you short questions that match your interests and language.',
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
                        controller: _regionController,
                        decoration: const InputDecoration(
                          labelText: 'Region',
                          hintText: 'e.g. Florida, Ontario, Madrid',
                        ),
                        textInputAction: TextInputAction.next,
                        validator:
                            (value) => AppValidators.requiredField(
                              value,
                              fieldName: 'Region',
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
                      Text(
                        'Choose the areas you want to hear about first.',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.sm,
                        children:
                            _availableTopics.map((topic) {
                              final isSelected = _selectedTopics.contains(
                                topic,
                              );

                              return FilterChip(
                                label: Text(topic),
                                selected: isSelected,
                                showCheckmark: false,
                                labelStyle: TextStyle(
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                                backgroundColor: AppColors.surfaceMuted,
                                selectedColor: AppColors.primary,
                                side: BorderSide(
                                  color:
                                      isSelected
                                          ? AppColors.primary
                                          : AppColors.border,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppSpacing.radiusXl,
                                  ),
                                ),
                                onSelected:
                                    (value) => _toggleTopic(topic, value),
                              );
                            }).toList(),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceMuted,
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusMd,
                          ),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Enable notifications',
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  Text(
                                    'Receive a quick alert when a new survey is available.',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: AppSpacing.md),
                            Switch(
                              value: _notificationsEnabled,
                              onChanged: (value) {
                                setState(() {
                                  _notificationsEnabled = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submit,
                          child: const Text('Continue'),
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
