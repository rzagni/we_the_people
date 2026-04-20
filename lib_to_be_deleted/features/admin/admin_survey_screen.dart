import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:we_the_people/dataconnect_generated/app.dart';

class AdminSurveyScreen extends StatefulWidget {
  const AdminSurveyScreen({super.key});

  @override
  State<AdminSurveyScreen> createState() => _AdminSurveyScreenState();
}

class _AdminSurveyScreenState extends State<AdminSurveyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _createdByController = TextEditingController(text: 'admin-test');

  bool _isLoading = false;
  SurveyStatus _selectedStatus = SurveyStatus.DRAFT;

  static const String _functionUrl =
      'https://us-west1-we-the-people-f1776.cloudfunctions.net/sendSurveyNotification';

  @override
  void dispose() {
    _questionController.dispose();
    _createdByController.dispose();
    super.dispose();
  }

  String? _validateQuestion(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter a survey question';
    }
    if (value.trim().length < 8) {
      return 'Question is too short';
    }
    return null;
  }

  Future<String> _createSurveyOnly() async {
    final surveyId = 'admin-survey-${DateTime.now().millisecondsSinceEpoch}';

    await AppConnector.instance
        .createSurvey(
          id: surveyId,
          question: _questionController.text.trim(),
          status: _selectedStatus,
          createdBy: _createdByController.text.trim(),
        )
        .execute();

    return surveyId;
  }

  Future<void> _createSurvey() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final surveyId = await _createSurveyOnly();

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Survey created: $surveyId')));

      _questionController.clear();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to create survey: $e')));
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _createAndSendToMyDevice() async {
    if (!_formKey.currentState!.validate()) return;

    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No logged in admin user found.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final surveyId = await _createSurveyOnly();

      final devicesResult =
          await AppConnector.instance.listMyUserDevices().execute();
      final devices = devicesResult.data.userDevices;

      if (devices.isEmpty) {
        throw Exception('No registered device found for this user.');
      }

      final device = devices.first;
      final deliveryId = 'delivery-${DateTime.now().millisecondsSinceEpoch}';

      await AppConnector.instance
          .createSurveyDelivery(
            id: deliveryId,
            surveyId: surveyId,
            userId: firebaseUser.uid,
            deviceId: device.id,
            status: DeliveryStatus.PENDING,
          )
          .execute();

      final response = await http.post(
        Uri.parse(_functionUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'token': device.fcmToken,
          'surveyId': surveyId,
          'deliveryId': deliveryId,
          'title': 'New survey available',
          'body': _questionController.text.trim(),
        }),
      );

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception(
          'Push send failed (${response.statusCode}): ${response.body}',
        );
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Survey created, delivery created, and push sent: $surveyId',
          ),
        ),
      );

      _questionController.clear();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to send survey: $e')));
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin - Create Survey')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Survey',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _questionController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Survey question',
                          hintText:
                              'Should local governments publish budget data in simpler language?',
                        ),
                        validator: _validateQuestion,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _createdByController,
                        decoration: const InputDecoration(
                          labelText: 'Created by',
                        ),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<SurveyStatus>(
                        value: _selectedStatus,
                        decoration: const InputDecoration(labelText: 'Status'),
                        items:
                            SurveyStatus.values
                                .map(
                                  (status) => DropdownMenuItem(
                                    value: status,
                                    child: Text(status.name),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _selectedStatus = value;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _createSurvey,
                          child:
                              _isLoading
                                  ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                  : const Text('Create survey'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed:
                              _isLoading ? null : _createAndSendToMyDevice,
                          child: const Text('Create and send to my device'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
