import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_services/dataconnect_generated/app.dart';
import 'package:we_the_people_mobile/providers/auth_provider.dart';
import 'package:we_the_people_mobile/providers/preferences_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<String?> _createTestSurvey(BuildContext context) async {
    try {
      final surveyId = 'test-survey-${DateTime.now().millisecondsSinceEpoch}';

      await AppConnector.instance
          .createSurvey(
            id: surveyId,
            question:
                'Should local governments publish budget data in simpler language?',
            status: SurveyStatus.DRAFT,
            createdBy: 'admin-test',
          )
          .execute();

      if (!context.mounted) return null;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Test survey created: $surveyId')));

      return surveyId;
    } catch (e) {
      debugPrint('Create survey failed: $e');

      if (!context.mounted) return null;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create test survey: $e')),
      );
      return null;
    }
  }

  Future<void> _createAndOpenTestSurvey(BuildContext context) async {
    final surveyId = await _createTestSurvey(context);
    if (surveyId == null || !context.mounted) return;

    context.go('/survey/$surveyId');
  }

  Future<void> _createDeliveryAndOpenTestSurvey(BuildContext context) async {
    final authProvider = context.read<AuthProvider>();
    final currentUser = authProvider.currentUser;

    if (currentUser == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No logged in user found.')));
      return;
    }

    try {
      final surveyId = await _createTestSurvey(context);
      if (surveyId == null || !context.mounted) return;

      final devicesResult =
          await AppConnector.instance.listMyUserDevices().execute();
      final devices = devicesResult.data.userDevices;

      if (devices.isEmpty) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No registered device found for this user.'),
          ),
        );
        return;
      }

      final device = devices.first;
      final deliveryId = 'delivery-${DateTime.now().millisecondsSinceEpoch}';

      await AppConnector.instance
          .createSurveyDelivery(
            id: deliveryId,
            surveyId: surveyId,
            userId: currentUser.uid,
            deviceId: device.id,
            status: DeliveryStatus.PENDING,
          )
          .execute();

      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Delivery created: $deliveryId')));

      context.go('/survey/$surveyId?deliveryId=$deliveryId');
    } catch (e) {
      debugPrint('Create delivery failed: $e');

      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to create delivery: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final preferencesProvider = context.watch<PreferencesProvider>();

    final user = authProvider.currentUser;
    final preferences = preferencesProvider.preferences;

    return Scaffold(
      appBar: AppBar(
        title: const Text('We the People'),
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<AuthProvider>().signOut();
              if (!context.mounted) return;
              context.go('/login');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Logged in as: ${user?.email ?? 'Unknown'}'),
            const SizedBox(height: 12),
            Text('ZIP code: ${preferences.zipCode ?? '-'}'),
            Text('City: ${preferences.city ?? '-'}'),
            Text('State: ${preferences.state ?? '-'}'),
            Text('Language: ${preferences.language ?? '-'}'),
            Text(
              'Topics: ${preferences.topics.isEmpty ? '-' : preferences.topics.join(', ')}',
            ),
            Text(
              'Notifications: ${preferences.notificationsEnabled ? 'Enabled' : 'Disabled'}',
            ),
            const SizedBox(height: 24),
            const Text('Proof of concept foundation is in place.'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _createTestSurvey(context),
                child: const Text('Create test survey'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _createAndOpenTestSurvey(context),
                child: const Text('Create and open test survey'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _createDeliveryAndOpenTestSurvey(context),
                child: const Text('Create delivery and open test survey'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
