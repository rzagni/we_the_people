library dataconnect_generated;

import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

part 'create_survey.dart';

part 'get_survey_by_id.dart';

part 'list_surveys.dart';

part 'register_user_device.dart';

part 'list_my_user_devices.dart';

part 'create_survey_delivery.dart';

part 'list_survey_responses_by_survey.dart';

part 'mark_survey_delivery_opened.dart';

part 'submit_survey_response.dart';

part 'mark_survey_delivery_answered.dart';

part 'get_my_survey_response_by_delivery.dart';

part 'get_current_user.dart';

part 'upsert_current_user.dart';

part 'complete_onboarding.dart';

enum DeliveryStatus { PENDING, SENT, OPENED, ANSWERED, FAILED }

String deliveryStatusSerializer(EnumValue<DeliveryStatus> e) {
  return e.stringValue;
}

EnumValue<DeliveryStatus> deliveryStatusDeserializer(dynamic data) {
  switch (data) {
    case 'PENDING':
      return const Known(DeliveryStatus.PENDING);

    case 'SENT':
      return const Known(DeliveryStatus.SENT);

    case 'OPENED':
      return const Known(DeliveryStatus.OPENED);

    case 'ANSWERED':
      return const Known(DeliveryStatus.ANSWERED);

    case 'FAILED':
      return const Known(DeliveryStatus.FAILED);

    default:
      return Unknown(data);
  }
}

enum DevicePlatform { ANDROID, IOS, WEB }

String devicePlatformSerializer(EnumValue<DevicePlatform> e) {
  return e.stringValue;
}

EnumValue<DevicePlatform> devicePlatformDeserializer(dynamic data) {
  switch (data) {
    case 'ANDROID':
      return const Known(DevicePlatform.ANDROID);

    case 'IOS':
      return const Known(DevicePlatform.IOS);

    case 'WEB':
      return const Known(DevicePlatform.WEB);

    default:
      return Unknown(data);
  }
}

enum SurveyAnswer { YES, NO, NOT_SURE }

String surveyAnswerSerializer(EnumValue<SurveyAnswer> e) {
  return e.stringValue;
}

EnumValue<SurveyAnswer> surveyAnswerDeserializer(dynamic data) {
  switch (data) {
    case 'YES':
      return const Known(SurveyAnswer.YES);

    case 'NO':
      return const Known(SurveyAnswer.NO);

    case 'NOT_SURE':
      return const Known(SurveyAnswer.NOT_SURE);

    default:
      return Unknown(data);
  }
}

enum SurveyStatus { DRAFT, SCHEDULED, SENT, CLOSED }

String surveyStatusSerializer(EnumValue<SurveyStatus> e) {
  return e.stringValue;
}

EnumValue<SurveyStatus> surveyStatusDeserializer(dynamic data) {
  switch (data) {
    case 'DRAFT':
      return const Known(SurveyStatus.DRAFT);

    case 'SCHEDULED':
      return const Known(SurveyStatus.SCHEDULED);

    case 'SENT':
      return const Known(SurveyStatus.SENT);

    case 'CLOSED':
      return const Known(SurveyStatus.CLOSED);

    default:
      return Unknown(data);
  }
}

String enumSerializer(Enum e) {
  return e.name;
}

/// A sealed class representing either a known enum value or an unknown string value.
@immutable
sealed class EnumValue<T extends Enum> {
  const EnumValue();

  /// The string representation of the value.
  String get stringValue;
  @override
  String toString() {
    return "EnumValue($stringValue)";
  }
}

/// Represents a known, valid enum value.
class Known<T extends Enum> extends EnumValue<T> {
  /// The actual enum value.
  final T value;

  const Known(this.value);

  @override
  String get stringValue => value.name;

  @override
  String toString() {
    return "Known($stringValue)";
  }
}

/// Represents an unknown or unrecognized enum value.
class Unknown extends EnumValue<Never> {
  /// The raw string value that couldn't be mapped to a known enum.
  @override
  final String stringValue;

  const Unknown(this.stringValue);
  @override
  String toString() {
    return "Unknown($stringValue)";
  }
}

class AppConnector {
  CreateSurveyVariablesBuilder createSurvey({
    required String id,
    required String question,
    required SurveyStatus status,
    required String createdBy,
  }) {
    return CreateSurveyVariablesBuilder(
      dataConnect,
      id: id,
      question: question,
      status: status,
      createdBy: createdBy,
    );
  }

  GetSurveyByIdVariablesBuilder getSurveyById({required String id}) {
    return GetSurveyByIdVariablesBuilder(dataConnect, id: id);
  }

  ListSurveysVariablesBuilder listSurveys() {
    return ListSurveysVariablesBuilder(dataConnect);
  }

  RegisterUserDeviceVariablesBuilder registerUserDevice({
    required String id,
    required String fcmToken,
    required DevicePlatform platform,
    required bool notificationsEnabled,
  }) {
    return RegisterUserDeviceVariablesBuilder(
      dataConnect,
      id: id,
      fcmToken: fcmToken,
      platform: platform,
      notificationsEnabled: notificationsEnabled,
    );
  }

  ListMyUserDevicesVariablesBuilder listMyUserDevices() {
    return ListMyUserDevicesVariablesBuilder(dataConnect);
  }

  CreateSurveyDeliveryVariablesBuilder createSurveyDelivery({
    required String id,
    required String surveyId,
    required String userId,
    required String deviceId,
    required DeliveryStatus status,
  }) {
    return CreateSurveyDeliveryVariablesBuilder(
      dataConnect,
      id: id,
      surveyId: surveyId,
      userId: userId,
      deviceId: deviceId,
      status: status,
    );
  }

  ListSurveyResponsesBySurveyVariablesBuilder listSurveyResponsesBySurvey({
    required String surveyId,
  }) {
    return ListSurveyResponsesBySurveyVariablesBuilder(
      dataConnect,
      surveyId: surveyId,
    );
  }

  MarkSurveyDeliveryOpenedVariablesBuilder markSurveyDeliveryOpened({
    required String deliveryId,
  }) {
    return MarkSurveyDeliveryOpenedVariablesBuilder(
      dataConnect,
      deliveryId: deliveryId,
    );
  }

  SubmitSurveyResponseVariablesBuilder submitSurveyResponse({
    required String id,
    required String surveyId,
    required String deliveryId,
    required SurveyAnswer answer,
  }) {
    return SubmitSurveyResponseVariablesBuilder(
      dataConnect,
      id: id,
      surveyId: surveyId,
      deliveryId: deliveryId,
      answer: answer,
    );
  }

  MarkSurveyDeliveryAnsweredVariablesBuilder markSurveyDeliveryAnswered({
    required String deliveryId,
  }) {
    return MarkSurveyDeliveryAnsweredVariablesBuilder(
      dataConnect,
      deliveryId: deliveryId,
    );
  }

  GetMySurveyResponseByDeliveryVariablesBuilder getMySurveyResponseByDelivery({
    required String deliveryId,
  }) {
    return GetMySurveyResponseByDeliveryVariablesBuilder(
      dataConnect,
      deliveryId: deliveryId,
    );
  }

  GetCurrentUserVariablesBuilder getCurrentUser() {
    return GetCurrentUserVariablesBuilder(dataConnect);
  }

  UpsertCurrentUserVariablesBuilder upsertCurrentUser({required String email}) {
    return UpsertCurrentUserVariablesBuilder(dataConnect, email: email);
  }

  CompleteOnboardingVariablesBuilder completeOnboarding({
    required String email,
    required String zipCode,
    required String city,
    required String state,
    required String language,
    required bool notificationsEnabled,
  }) {
    return CompleteOnboardingVariablesBuilder(
      dataConnect,
      email: email,
      zipCode: zipCode,
      city: city,
      state: state,
      language: language,
      notificationsEnabled: notificationsEnabled,
    );
  }

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-west1',
    'app',
    'wethepeople',
  );

  AppConnector({required this.dataConnect});
  static AppConnector get instance {
    CacheSettings cacheSettings = CacheSettings(
      maxAge: Duration(milliseconds: 0),
      storage: CacheStorage.persistent,
    );

    return AppConnector(
      dataConnect: FirebaseDataConnect.instanceFor(
        connectorConfig: connectorConfig,

        cacheSettings: cacheSettings,

        sdkType: CallerSDKType.generated,
      ),
    );
  }

  FirebaseDataConnect dataConnect;
}
