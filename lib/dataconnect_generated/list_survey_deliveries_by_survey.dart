part of 'app.dart';

class ListSurveyDeliveriesBySurveyVariablesBuilder {
  String surveyId;

  final FirebaseDataConnect _dataConnect;
  ListSurveyDeliveriesBySurveyVariablesBuilder(this._dataConnect, {required  this.surveyId,});
  Deserializer<ListSurveyDeliveriesBySurveyData> dataDeserializer = (dynamic json)  => ListSurveyDeliveriesBySurveyData.fromJson(jsonDecode(json));
  Serializer<ListSurveyDeliveriesBySurveyVariables> varsSerializer = (ListSurveyDeliveriesBySurveyVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListSurveyDeliveriesBySurveyData, ListSurveyDeliveriesBySurveyVariables>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListSurveyDeliveriesBySurveyData, ListSurveyDeliveriesBySurveyVariables> ref() {
    ListSurveyDeliveriesBySurveyVariables vars= ListSurveyDeliveriesBySurveyVariables(surveyId: surveyId,);
    return _dataConnect.query("ListSurveyDeliveriesBySurvey", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListSurveyDeliveriesBySurveySurveyDeliveries {
  final String id;
  final String surveyId;
  final String userId;
  final String deviceId;
  final EnumValue<DeliveryStatus> status;
  ListSurveyDeliveriesBySurveySurveyDeliveries.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  surveyId = nativeFromJson<String>(json['surveyId']),
  userId = nativeFromJson<String>(json['userId']),
  deviceId = nativeFromJson<String>(json['deviceId']),
  status = deliveryStatusDeserializer(json['status']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListSurveyDeliveriesBySurveySurveyDeliveries otherTyped = other as ListSurveyDeliveriesBySurveySurveyDeliveries;
    return id == otherTyped.id && 
    surveyId == otherTyped.surveyId && 
    userId == otherTyped.userId && 
    deviceId == otherTyped.deviceId && 
    status == otherTyped.status;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, surveyId.hashCode, userId.hashCode, deviceId.hashCode, status.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['surveyId'] = nativeToJson<String>(surveyId);
    json['userId'] = nativeToJson<String>(userId);
    json['deviceId'] = nativeToJson<String>(deviceId);
    json['status'] = 
    deliveryStatusSerializer(status)
    ;
    return json;
  }

  ListSurveyDeliveriesBySurveySurveyDeliveries({
    required this.id,
    required this.surveyId,
    required this.userId,
    required this.deviceId,
    required this.status,
  });
}

@immutable
class ListSurveyDeliveriesBySurveyData {
  final List<ListSurveyDeliveriesBySurveySurveyDeliveries> surveyDeliveries;
  ListSurveyDeliveriesBySurveyData.fromJson(dynamic json):
  
  surveyDeliveries = (json['surveyDeliveries'] as List<dynamic>)
        .map((e) => ListSurveyDeliveriesBySurveySurveyDeliveries.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListSurveyDeliveriesBySurveyData otherTyped = other as ListSurveyDeliveriesBySurveyData;
    return surveyDeliveries == otherTyped.surveyDeliveries;
    
  }
  @override
  int get hashCode => surveyDeliveries.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['surveyDeliveries'] = surveyDeliveries.map((e) => e.toJson()).toList();
    return json;
  }

  ListSurveyDeliveriesBySurveyData({
    required this.surveyDeliveries,
  });
}

@immutable
class ListSurveyDeliveriesBySurveyVariables {
  final String surveyId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListSurveyDeliveriesBySurveyVariables.fromJson(Map<String, dynamic> json):
  
  surveyId = nativeFromJson<String>(json['surveyId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListSurveyDeliveriesBySurveyVariables otherTyped = other as ListSurveyDeliveriesBySurveyVariables;
    return surveyId == otherTyped.surveyId;
    
  }
  @override
  int get hashCode => surveyId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['surveyId'] = nativeToJson<String>(surveyId);
    return json;
  }

  ListSurveyDeliveriesBySurveyVariables({
    required this.surveyId,
  });
}

