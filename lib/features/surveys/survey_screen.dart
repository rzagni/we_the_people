import 'package:flutter/material.dart';
import 'package:we_the_people/dataconnect_generated/app.dart';

class SurveyScreen extends StatefulWidget {
  final String surveyId;
  final String? deliveryId;

  const SurveyScreen({super.key, required this.surveyId, this.deliveryId});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  bool _isLoading = true;
  bool _isSubmitting = false;
  bool _answered = false;
  String? _errorMessage;
  String? _question;
  SurveyAnswer? _savedAnswer;

  @override
  void initState() {
    super.initState();
    _loadSurvey();
  }

  Future<void> _loadSurvey() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final surveyResult =
          await AppConnector.instance
              .getSurveyById(id: widget.surveyId)
              .execute();

      final surveys = surveyResult.data.surveys;

      if (surveys.isEmpty) {
        setState(() {
          _errorMessage = 'Survey not found.';
          _isLoading = false;
        });
        return;
      }

      final survey = surveys.first;

      SurveyAnswer? existingAnswer;

      final deliveryId = widget.deliveryId;
      if (deliveryId != null && deliveryId.isNotEmpty) {
        await AppConnector.instance
            .markSurveyDeliveryOpened(deliveryId: deliveryId)
            .execute();

        final responseResult =
            await AppConnector.instance
                .getMySurveyResponseByDelivery(deliveryId: deliveryId)
                .execute();

        final responses = responseResult.data.surveyResponses;
        if (responses.isNotEmpty) {
          final storedAnswer = responses.first.answer;
          if (storedAnswer is Known<SurveyAnswer>) {
            existingAnswer = storedAnswer.value;
          }
        }
      }

      setState(() {
        _question = survey.question;
        _savedAnswer = existingAnswer;
        _answered = existingAnswer != null;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load survey: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _submitAnswer(SurveyAnswer answer) async {
    if (_isSubmitting || _answered) return;

    final deliveryId = widget.deliveryId;
    if (deliveryId == null || deliveryId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Missing delivery ID.')));
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final responseId =
          '${widget.surveyId}_${DateTime.now().millisecondsSinceEpoch}';

      await AppConnector.instance
          .submitSurveyResponse(
            id: responseId,
            surveyId: widget.surveyId,
            deliveryId: deliveryId,
            answer: answer,
          )
          .execute();

      await AppConnector.instance
          .markSurveyDeliveryAnswered(deliveryId: deliveryId)
          .execute();

      if (!mounted) return;

      setState(() {
        _savedAnswer = answer;
        _answered = true;
        _isSubmitting = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Answer submitted.')));
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isSubmitting = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to submit answer: $e')));
    }
  }

  String _answerLabel(SurveyAnswer answer) {
    switch (answer) {
      case SurveyAnswer.YES:
        return 'Yes';
      case SurveyAnswer.NO:
        return 'No';
      case SurveyAnswer.NOT_SURE:
        return 'Don’t know / Not sure';
    }
  }

  Widget _answerButton({required String label, required SurveyAnswer answer}) {
    final isSelected = _savedAnswer == answer;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed:
            _isSubmitting || _answered ? null : () => _submitAnswer(answer),
        child:
            _isSubmitting
                ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(label),
                    if (isSelected) ...[
                      const SizedBox(width: 8),
                      const Icon(Icons.check, size: 18),
                    ],
                  ],
                ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Survey')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage != null
                ? Center(child: Text(_errorMessage!))
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _question ?? '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 24),
                    _answerButton(label: 'Yes', answer: SurveyAnswer.YES),
                    const SizedBox(height: 12),
                    _answerButton(label: 'No', answer: SurveyAnswer.NO),
                    const SizedBox(height: 12),
                    _answerButton(
                      label: 'Don’t know / Not sure',
                      answer: SurveyAnswer.NOT_SURE,
                    ),
                    if (_answered) ...[
                      const SizedBox(height: 24),
                      Text(
                        _savedAnswer != null
                            ? 'You already answered this survey: ${_answerLabel(_savedAnswer!)}'
                            : 'Your response has been recorded.',
                      ),
                    ],
                  ],
                ),
      ),
    );
  }
}
