import 'package:shared_services/dataconnect_generated/app.dart';

class SurveyRepository {
  final AppConnector _connector;

  SurveyRepository({AppConnector? connector})
    : _connector = connector ?? AppConnector.instance;

  Future<void> createSurvey({
    required String id,
    required String question,
    required SurveyStatus status,
    required String createdBy,
  }) async {
    await _connector
        .createSurvey(
          id: id,
          question: question,
          status: status,
          createdBy: createdBy,
        )
        .execute();
  }

  Future<GetSurveyByIdSurveys?> getSurveyById(String surveyId) async {
    final result = await _connector.getSurveyById(id: surveyId).execute();
    final surveys = result.data.surveys;
    if (surveys.isEmpty) return null;
    return surveys.first;
  }

  Future<List<ListSurveysSurveys>> listSurveys() async {
    final result = await _connector.listSurveys().execute();
    return result.data.surveys;
  }
}
