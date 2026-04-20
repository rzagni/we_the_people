part of 'app.dart';

class CreateSurveyVariablesBuilder {
  String id;
  String question;
  SurveyStatus status;
  String createdBy;
  Optional<String> _language = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _region = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _topic = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  CreateSurveyVariablesBuilder language(String? t) {
   _language.value = t;
   return this;
  }
  CreateSurveyVariablesBuilder region(String? t) {
   _region.value = t;
   return this;
  }
  CreateSurveyVariablesBuilder topic(String? t) {
   _topic.value = t;
   return this;
  }

  CreateSurveyVariablesBuilder(this._dataConnect, {required  this.id,required  this.question,required  this.status,required  this.createdBy,});
  Deserializer<CreateSurveyData> dataDeserializer = (dynamic json)  => CreateSurveyData.fromJson(jsonDecode(json));
  Serializer<CreateSurveyVariables> varsSerializer = (CreateSurveyVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateSurveyData, CreateSurveyVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateSurveyData, CreateSurveyVariables> ref() {
    CreateSurveyVariables vars= CreateSurveyVariables(id: id,question: question,status: status,createdBy: createdBy,language: _language,region: _region,topic: _topic,);
    return _dataConnect.mutation("CreateSurvey", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateSurveySurveyInsert {
  final String id;
  CreateSurveySurveyInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateSurveySurveyInsert otherTyped = other as CreateSurveySurveyInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateSurveySurveyInsert({
    required this.id,
  });
}

@immutable
class CreateSurveyData {
  final CreateSurveySurveyInsert survey_insert;
  CreateSurveyData.fromJson(dynamic json):
  
  survey_insert = CreateSurveySurveyInsert.fromJson(json['survey_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateSurveyData otherTyped = other as CreateSurveyData;
    return survey_insert == otherTyped.survey_insert;
    
  }
  @override
  int get hashCode => survey_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['survey_insert'] = survey_insert.toJson();
    return json;
  }

  CreateSurveyData({
    required this.survey_insert,
  });
}

@immutable
class CreateSurveyVariables {
  final String id;
  final String question;
  final SurveyStatus status;
  final String createdBy;
  late final Optional<String>language;
  late final Optional<String>region;
  late final Optional<String>topic;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateSurveyVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  question = nativeFromJson<String>(json['question']),
  status = SurveyStatus.values.byName(json['status']),
  createdBy = nativeFromJson<String>(json['createdBy']) {
  
  
  
  
  
  
    language = Optional.optional(nativeFromJson, nativeToJson);
    language.value = json['language'] == null ? null : nativeFromJson<String>(json['language']);
  
  
    region = Optional.optional(nativeFromJson, nativeToJson);
    region.value = json['region'] == null ? null : nativeFromJson<String>(json['region']);
  
  
    topic = Optional.optional(nativeFromJson, nativeToJson);
    topic.value = json['topic'] == null ? null : nativeFromJson<String>(json['topic']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateSurveyVariables otherTyped = other as CreateSurveyVariables;
    return id == otherTyped.id && 
    question == otherTyped.question && 
    status == otherTyped.status && 
    createdBy == otherTyped.createdBy && 
    language == otherTyped.language && 
    region == otherTyped.region && 
    topic == otherTyped.topic;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, question.hashCode, status.hashCode, createdBy.hashCode, language.hashCode, region.hashCode, topic.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['question'] = nativeToJson<String>(question);
    json['status'] = 
    status.name
    ;
    json['createdBy'] = nativeToJson<String>(createdBy);
    if(language.state == OptionalState.set) {
      json['language'] = language.toJson();
    }
    if(region.state == OptionalState.set) {
      json['region'] = region.toJson();
    }
    if(topic.state == OptionalState.set) {
      json['topic'] = topic.toJson();
    }
    return json;
  }

  CreateSurveyVariables({
    required this.id,
    required this.question,
    required this.status,
    required this.createdBy,
    required this.language,
    required this.region,
    required this.topic,
  });
}

