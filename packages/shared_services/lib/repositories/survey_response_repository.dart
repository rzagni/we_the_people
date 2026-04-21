import 'package:shared_services/dataconnect_generated/app.dart';

class SurveyResponseRepository {
  final AppConnector _connector;

  SurveyResponseRepository({AppConnector? connector})
    : _connector = connector ?? AppConnector.instance;

  Future<void> submitSurveyResponse({
    required String id,
    required String surveyId,
    required String deliveryId,
    required SurveyAnswer answer,
  }) async {
    await _connector
        .submitSurveyResponse(
          id: id,
          surveyId: surveyId,
          deliveryId: deliveryId,
          answer: answer,
        )
        .execute();
  }

  Future<GetMySurveyResponseByDeliverySurveyResponses?> getMyResponseByDelivery(
    String deliveryId,
  ) async {
    final result =
        await _connector
            .getMySurveyResponseByDelivery(deliveryId: deliveryId)
            .execute();

    final responses = result.data.surveyResponses;
    if (responses.isEmpty) return null;
    return responses.first;
  }
}
