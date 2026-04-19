import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
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
  final _languageController = TextEditingController();

  final Set<String> _selectedTopics = <String>{};
  bool _notificationsEnabled = true;

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

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final preferencesProvider = context.read<PreferencesProvider>();
    preferencesProvider.updateRegion(_regionController.text.trim());
    preferencesProvider.updateLanguage(_languageController.text.trim());
    preferencesProvider.updateTopics(_selectedTopics.toList());
    preferencesProvider.updateNotificationsEnabled(_notificationsEnabled);

    context.go('/home');
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
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: const Padding(
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
