import 'package:flutter/material.dart';
import 'package:we_the_people/dataconnect_generated/app.dart';

class SurveyDetailScreen extends StatefulWidget {
  final String surveyId;
  final String? deliveryId;

  const SurveyDetailScreen({
    super.key,
    required this.surveyId,
    this.deliveryId,
  });

  @override
  State<SurveyDetailScreen> createState() => _SurveyDetailScreenState();
}

class _SurveyDetailScreenState extends State<SurveyDetailScreen> {
  bool _isLoading = true;
  bool _isSubmitting = false;
  String? _errorMessage;
  String? _question;
  bool _markedOpened = false;
  bool _answered = false;

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
      final result =
          await AppConnector.instance
              .getSurveyById(id: widget.surveyId)
              .execute();

      final surveys = result.data.surveys;

      if (surveys.isEmpty) {
        setState(() {
          _errorMessage = 'Survey not found.';
          _isLoading = false;
        });
        return;
      }

      final survey = surveys.first;

      if (!_markedOpened &&
          widget.deliveryId != null &&
          widget.deliveryId!.isNotEmpty) {
        await AppConnector.instance
            .markSurveyDeliveryOpened(deliveryId: widget.deliveryId!)
            .execute();

        _markedOpened = true;
      }

      setState(() {
        _question = survey.question;
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

    if (widget.deliveryId == null || widget.deliveryId!.isEmpty) {
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
          '${widget.deliveryId}_${DateTime.now().millisecondsSinceEpoch}';

      await AppConnector.instance
          .submitSurveyResponse(
            id: responseId,
            surveyId: widget.surveyId,
            deliveryId: widget.deliveryId!,
            answer: answer,
          )
          .execute();

      await AppConnector.instance
          .markSurveyDeliveryAnswered(deliveryId: widget.deliveryId!)
          .execute();

      if (!mounted) return;

      setState(() {
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

  Widget _buildAnswerButton({
    required String label,
    required SurveyAnswer answer,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed:
            _isSubmitting || _answered ? null : () => _submitAnswer(answer),
        child:
            _isSubmitting
                ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                : Text(label),
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
                    _buildAnswerButton(label: 'Yes', answer: SurveyAnswer.YES),
                    const SizedBox(height: 12),
                    _buildAnswerButton(label: 'No', answer: SurveyAnswer.NO),
                    const SizedBox(height: 12),
                    _buildAnswerButton(
                      label: 'Don’t know / Not sure',
                      answer: SurveyAnswer.NOT_SURE,
                    ),
                    if (_answered) ...[
                      const SizedBox(height: 24),
                      const Text('Your response has been recorded.'),
                    ],
                  ],
                ),
      ),
    );
  }
}
