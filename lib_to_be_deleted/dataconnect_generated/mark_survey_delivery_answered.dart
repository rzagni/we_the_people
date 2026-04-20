part of 'app.dart';

class MarkSurveyDeliveryAnsweredVariablesBuilder {
  String deliveryId;

  final FirebaseDataConnect _dataConnect;
  MarkSurveyDeliveryAnsweredVariablesBuilder(this._dataConnect, {required  this.deliveryId,});
  Deserializer<MarkSurveyDeliveryAnsweredData> dataDeserializer = (dynamic json)  => MarkSurveyDeliveryAnsweredData.fromJson(jsonDecode(json));
  Serializer<MarkSurveyDeliveryAnsweredVariables> varsSerializer = (MarkSurveyDeliveryAnsweredVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<MarkSurveyDeliveryAnsweredData, MarkSurveyDeliveryAnsweredVariables>> execute() {
    return ref().execute();
  }

  MutationRef<MarkSurveyDeliveryAnsweredData, MarkSurveyDeliveryAnsweredVariables> ref() {
    MarkSurveyDeliveryAnsweredVariables vars= MarkSurveyDeliveryAnsweredVariables(deliveryId: deliveryId,);
    return _dataConnect.mutation("MarkSurveyDeliveryAnswered", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class MarkSurveyDeliveryAnsweredSurveyDeliveryUpdate {
  final String id;
  MarkSurveyDeliveryAnsweredSurveyDeliveryUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarkSurveyDeliveryAnsweredSurveyDeliveryUpdate otherTyped = other as MarkSurveyDeliveryAnsweredSurveyDeliveryUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  MarkSurveyDeliveryAnsweredSurveyDeliveryUpdate({
    required this.id,
  });
}

@immutable
class MarkSurveyDeliveryAnsweredData {
  final MarkSurveyDeliveryAnsweredSurveyDeliveryUpdate? surveyDelivery_update;
  MarkSurveyDeliveryAnsweredData.fromJson(dynamic json):
  
  surveyDelivery_update = json['surveyDelivery_update'] == null ? null : MarkSurveyDeliveryAnsweredSurveyDeliveryUpdate.fromJson(json['surveyDelivery_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarkSurveyDeliveryAnsweredData otherTyped = other as MarkSurveyDeliveryAnsweredData;
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

  MarkSurveyDeliveryAnsweredData({
    this.surveyDelivery_update,
  });
}

@immutable
class MarkSurveyDeliveryAnsweredVariables {
  final String deliveryId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  MarkSurveyDeliveryAnsweredVariables.fromJson(Map<String, dynamic> json):
  
  deliveryId = nativeFromJson<String>(json['deliveryId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final MarkSurveyDeliveryAnsweredVariables otherTyped = other as MarkSurveyDeliveryAnsweredVariables;
    return deliveryId == otherTyped.deliveryId;
    
  }
  @override
  int get hashCode => deliveryId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['deliveryId'] = nativeToJson<String>(deliveryId);
    return json;
  }

  MarkSurveyDeliveryAnsweredVariables({
    required this.deliveryId,
  });
}

