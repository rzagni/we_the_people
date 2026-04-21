import 'package:shared_services/dataconnect_generated/app.dart';

class SurveyDeliveryRepository {
  final AppConnector _connector;

  SurveyDeliveryRepository({AppConnector? connector})
    : _connector = connector ?? AppConnector.instance;

  Future<void> createSurveyDelivery({
    required String id,
    required String surveyId,
    required String userId,
    required String deviceId,
    required DeliveryStatus status,
  }) async {
    await _connector
        .createSurveyDelivery(
          id: id,
          surveyId: surveyId,
          userId: userId,
          deviceId: deviceId,
          status: status,
        )
        .execute();
  }

  Future<void> markOpened(String deliveryId) async {
    await _connector.markSurveyDeliveryOpened(deliveryId: deliveryId).execute();
  }

  Future<void> markAnswered(String deliveryId) async {
    await _connector
        .markSurveyDeliveryAnswered(deliveryId: deliveryId)
        .execute();
  }
}
