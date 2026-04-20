part of 'app.dart';

class SubmitSurveyResponseVariablesBuilder {
  String id;
  String surveyId;
  String userId;
  String deliveryId;
  SurveyAnswer answer;

  final FirebaseDataConnect _dataConnect;
  SubmitSurveyResponseVariablesBuilder(this._dataConnect, {required  this.id,required  this.surveyId,required  this.userId,required  this.deliveryId,required  this.answer,});
  Deserializer<SubmitSurveyResponseData> dataDeserializer = (dynamic json)  => SubmitSurveyResponseData.fromJson(jsonDecode(json));
  Serializer<SubmitSurveyResponseVariables> varsSerializer = (SubmitSurveyResponseVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SubmitSurveyResponseData, SubmitSurveyResponseVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SubmitSurveyResponseData, SubmitSurveyResponseVariables> ref() {
    SubmitSurveyResponseVariables vars= SubmitSurveyResponseVariables(id: id,surveyId: surveyId,userId: userId,deliveryId: deliveryId,answer: answer,);
    return _dataConnect.mutation("SubmitSurveyResponse", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SubmitSurveyResponseSurveyResponseInsert {
  final String id;
  SubmitSurveyResponseSurveyResponseInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SubmitSurveyResponseSurveyResponseInsert otherTyped = other as SubmitSurveyResponseSurveyResponseInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  SubmitSurveyResponseSurveyResponseInsert({
    required this.id,
  });
}

@immutable
class SubmitSurveyResponseData {
  final SubmitSurveyResponseSurveyResponseInsert surveyResponse_insert;
  SubmitSurveyResponseData.fromJson(dynamic json):
  
  surveyResponse_insert = SubmitSurveyResponseSurveyResponseInsert.fromJson(json['surveyResponse_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SubmitSurveyResponseData otherTyped = other as SubmitSurveyResponseData;
    return surveyResponse_insert == otherTyped.surveyResponse_insert;
    
  }
  @override
  int get hashCode => surveyResponse_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['surveyResponse_insert'] = surveyResponse_insert.toJson();
    return json;
  }

  SubmitSurveyResponseData({
    required this.surveyResponse_insert,
  });
}

@immutable
class SubmitSurveyResponseVariables {
  final String id;
  final String surveyId;
  final String userId;
  final String deliveryId;
  final SurveyAnswer answer;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SubmitSurveyResponseVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  surveyId = nativeFromJson<String>(json['surveyId']),
  userId = nativeFromJson<String>(json['userId']),
  deliveryId = nativeFromJson<String>(json['deliveryId']),
  answer = SurveyAnswer.values.byName(json['answer']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SubmitSurveyResponseVariables otherTyped = other as SubmitSurveyResponseVariables;
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
    answer.name
    ;
    return json;
  }

  SubmitSurveyResponseVariables({
    required this.id,
    required this.surveyId,
    required this.userId,
    required this.deliveryId,
    required this.answer,
  });
}

