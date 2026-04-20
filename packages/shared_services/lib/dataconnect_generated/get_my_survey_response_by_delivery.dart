part of 'app.dart';

class GetMySurveyResponseByDeliveryVariablesBuilder {
  String deliveryId;

  final FirebaseDataConnect _dataConnect;
  GetMySurveyResponseByDeliveryVariablesBuilder(this._dataConnect, {required  this.deliveryId,});
  Deserializer<GetMySurveyResponseByDeliveryData> dataDeserializer = (dynamic json)  => GetMySurveyResponseByDeliveryData.fromJson(jsonDecode(json));
  Serializer<GetMySurveyResponseByDeliveryVariables> varsSerializer = (GetMySurveyResponseByDeliveryVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetMySurveyResponseByDeliveryData, GetMySurveyResponseByDeliveryVariables>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<GetMySurveyResponseByDeliveryData, GetMySurveyResponseByDeliveryVariables> ref() {
    GetMySurveyResponseByDeliveryVariables vars= GetMySurveyResponseByDeliveryVariables(deliveryId: deliveryId,);
    return _dataConnect.query("GetMySurveyResponseByDelivery", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetMySurveyResponseByDeliverySurveyResponses {
  final String id;
  final String surveyId;
  final String userId;
  final String deliveryId;
  final EnumValue<SurveyAnswer> answer;
  GetMySurveyResponseByDeliverySurveyResponses.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  surveyId = nativeFromJson<String>(json['surveyId']),
  userId = nativeFromJson<String>(json['userId']),
  deliveryId = nativeFromJson<String>(json['deliveryId']),
  answer = surveyAnswerDeserializer(json['answer']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetMySurveyResponseByDeliverySurveyResponses otherTyped = other as GetMySurveyResponseByDeliverySurveyResponses;
    return id == otherTyped.id && 
    surveyId == otherTyped.surveyId && 
    userId == otherTyped.userId && 
    deliveryId == otherTyped.deliveryId && 
    answer == otherTyped.answer;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, surveyId.hashCode, userId.hashCode, deliveryId.hashCode, answer.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['surveyId'] = nativeToJson<String>(surveyId);
    json['userId'] = nativeToJson<String>(userId);
    json['deliveryId'] = nativeToJson<String>(deliveryId);
    json['answer'] = 
    surveyAnswerSerializer(answer)
    ;
    return json;
  }

  GetMySurveyResponseByDeliverySurveyResponses({
    required this.id,
    required this.surveyId,
    required this.userId,
    required this.deliveryId,
    required this.answer,
  });
}

@immutable
class GetMySurveyResponseByDeliveryData {
  final List<GetMySurveyResponseByDeliverySurveyResponses> surveyResponses;
  GetMySurveyResponseByDeliveryData.fromJson(dynamic json):
  
  surveyResponses = (json['surveyResponses'] as List<dynamic>)
        .map((e) => GetMySurveyResponseByDeliverySurveyResponses.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetMySurveyResponseByDeliveryData otherTyped = other as GetMySurveyResponseByDeliveryData;
    return surveyResponses == otherTyped.surveyResponses;
    
  }
  @override
  int get hashCode => surveyResponses.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['surveyResponses'] = surveyResponses.map((e) => e.toJson()).toList();
    return json;
  }

  GetMySurveyResponseByDeliveryData({
    required this.surveyResponses,
  });
}

@immutable
class GetMySurveyResponseByDeliveryVariables {
  final String deliveryId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetMySurveyResponseByDeliveryVariables.fromJson(Map<String, dynamic> json):
  
  deliveryId = nativeFromJson<String>(json['deliveryId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetMySurveyResponseByDeliveryVariables otherTyped = other as GetMySurveyResponseByDeliveryVariables;
    return deliveryId == otherTyped.deliveryId;
    
  }
  @override
  int get hashCode => deliveryId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['deliveryId'] = nativeToJson<String>(deliveryId);
    return json;
  }

  GetMySurveyResponseByDeliveryVariables({
    required this.deliveryId,
  });
}

