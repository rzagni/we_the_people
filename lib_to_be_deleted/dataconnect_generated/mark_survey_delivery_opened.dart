part of 'app.dart';

class MarkSurveyDeliveryOpenedVariablesBuilder {
  String deliveryId;

  final FirebaseDataConnect _dataConnect;
  MarkSurveyDeliveryOpenedVariablesBuilder(this._dataConnect, {required  this.deliveryId,});
  Deserializer<MarkSurveyDeliveryOpenedData> dataDeserializer = (dynamic json)  => MarkSurveyDeliveryOpenedData.fromJson(jsonDecode(json));
  Serializer<MarkSurveyDeliveryOpenedVariables> varsSerializer = (MarkSurveyDeliveryOpenedVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<MarkSurveyDeliveryOpenedData, MarkSurveyDeliveryOpenedVariables>> execute() {
    return ref().execute();
  }

  MutationRef<MarkSurveyDeliveryOpenedData, MarkSurveyDeliveryOpenedVariables> ref() {
    MarkSurveyDeliveryOpenedVariables vars= MarkSurveyDeliveryOpenedVariables(deliveryId: deliveryId,);
    return _dataConnect.mutation("MarkSurveyDeliveryOpened", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class MarkSurveyDeliveryOpenedSurveyDeliveryUpdate {
  final String id;
  MarkSurveyDeliveryOpenedSurveyDeliveryUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarkSurveyDeliveryOpenedSurveyDeliveryUpdate otherTyped = other as MarkSurveyDeliveryOpenedSurveyDeliveryUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  MarkSurveyDeliveryOpenedSurveyDeliveryUpdate({
    required this.id,
  });
}

@immutable
class MarkSurveyDeliveryOpenedData {
  final MarkSurveyDeliveryOpenedSurveyDeliveryUpdate? surveyDelivery_update;
  MarkSurveyDeliveryOpenedData.fromJson(dynamic json):
  
  surveyDelivery_update = json['surveyDelivery_update'] == null ? null : MarkSurveyDeliveryOpenedSurveyDeliveryUpdate.fromJson(json['surveyDelivery_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarkSurveyDeliveryOpenedData otherTyped = other as MarkSurveyDeliveryOpenedData;
    return surveyDelivery_update == otherTyped.surveyDelivery_update;
    
  }
  @override
  int get hashCode => surveyDelivery_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (surveyDelivery_update != null) {
      json['surveyDelivery_update'] = surveyDelivery_update!.toJson();
    }
    return json;
  }

  MarkSurveyDeliveryOpenedData({
    this.surveyDelivery_update,
  });
}

@immutable
class MarkSurveyDeliveryOpenedVariables {
  final String deliveryId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  MarkSurveyDeliveryOpenedVariables.fromJson(Map<String, dynamic> json):
  
  deliveryId = nativeFromJson<String>(json['deliveryId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarkSurveyDeliveryOpenedVariables otherTyped = other as MarkSurveyDeliveryOpenedVariables;
    return deliveryId == otherTyped.deliveryId;
    
  }
  @override
  int get hashCode => deliveryId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['deliveryId'] = nativeToJson<String>(deliveryId);
    return json;
  }

  MarkSurveyDeliveryOpenedVariables({
    required this.deliveryId,
  });
}

