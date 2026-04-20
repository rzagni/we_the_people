part of 'app.dart';

class ListSurveyResponsesBySurveyVariablesBuilder {
  String surveyId;

  final FirebaseDataConnect _dataConnect;
  ListSurveyResponsesBySurveyVariablesBuilder(this._dataConnect, {required  this.surveyId,});
  Deserializer<ListSurveyResponsesBySurveyData> dataDeserializer = (dynamic json)  => ListSurveyResponsesBySurveyData.fromJson(jsonDecode(json));
  Serializer<ListSurveyResponsesBySurveyVariables> varsSerializer = (ListSurveyResponsesBySurveyVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListSurveyResponsesBySurveyData, ListSurveyResponsesBySurveyVariables>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListSurveyResponsesBySurveyData, ListSurveyResponsesBySurveyVariables> ref() {
    ListSurveyResponsesBySurveyVariables vars= ListSurveyResponsesBySurveyVariables(surveyId: surveyId,);
    return _dataConnect.query("ListSurveyResponsesBySurvey", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListSurveyResponsesBySurveySurveyResponses {
  final String id;
  final String surveyId;
  final String userId;
  final String deliveryId;
  final EnumValue<SurveyAnswer> answer;
  ListSurveyResponsesBySurveySurveyResponses.fromJson(dynamic json):
  
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

    final ListSurveyResponsesBySurveySurveyResponses otherTyped = other as ListSurveyResponsesBySurveySurveyResponses;
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

  ListSurveyResponsesBySurveySurveyResponses({
    required this.id,
    required this.surveyId,
    required this.userId,
    required this.deliveryId,
    required this.answer,
  });
}

@immutable
class ListSurveyResponsesBySurveyData {
  final List<ListSurveyResponsesBySurveySurveyResponses> surveyResponses;
  ListSurveyResponsesBySurveyData.fromJson(dynamic json):
  
  surveyResponses = (json['surveyResponses'] as List<dynamic>)
        .map((e) => ListSurveyResponsesBySurveySurveyResponses.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListSurveyResponsesBySurveyData otherTyped = other as ListSurveyResponsesBySurveyData;
    return surveyResponses == otherTyped.surveyResponses;
    
  }
  @override
  int get hashCode => surveyResponses.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['surveyResponses'] = surveyResponses.map((e) => e.toJson()).toList();
    return json;
  }

  ListSurveyResponsesBySurveyData({
    required this.surveyResponses,
  });
}

@immutable
class ListSurveyResponsesBySurveyVariables {
  final String surveyId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListSurveyResponsesBySurveyVariables.fromJson(Map<String, dynamic> json):
  
  surveyId = nativeFromJson<String>(json['surveyId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListSurveyResponsesBySurveyVariables otherTyped = other as ListSurveyResponsesBySurveyVariables;
    return surveyId == otherTyped.surveyId;
    
  }
  @override
  int get hashCode => surveyId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['surveyId'] = nativeToJson<String>(surveyId);
    return json;
  }

  ListSurveyResponsesBySurveyVariables({
    required this.surveyId,
  });
}

