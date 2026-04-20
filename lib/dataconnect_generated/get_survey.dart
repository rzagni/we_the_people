part of 'app.dart';

class GetSurveyVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  GetSurveyVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<GetSurveyData> dataDeserializer = (dynamic json)  => GetSurveyData.fromJson(jsonDecode(json));
  Serializer<GetSurveyVariables> varsSerializer = (GetSurveyVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetSurveyData, GetSurveyVariables>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<GetSurveyData, GetSurveyVariables> ref() {
    GetSurveyVariables vars= GetSurveyVariables(id: id,);
    return _dataConnect.query("GetSurvey", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetSurveySurveys {
  final String id;
  final String question;
  final EnumValue<SurveyStatus> status;
  final String createdBy;
  final String? language;
  final String? region;
  final String? topic;
  GetSurveySurveys.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  question = nativeFromJson<String>(json['question']),
  status = surveyStatusDeserializer(json['status']),
  createdBy = nativeFromJson<String>(json['createdBy']),
  language = json['language'] == null ? null : nativeFromJson<String>(json['language']),
  region = json['region'] == null ? null : nativeFromJson<String>(json['region']),
  topic = json['topic'] == null ? null : nativeFromJson<String>(json['topic']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetSurveySurveys otherTyped = other as GetSurveySurveys;
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
    surveyStatusSerializer(status)
    ;
    json['createdBy'] = nativeToJson<String>(createdBy);
    if (language != null) {
      json['language'] = nativeToJson<String?>(language);
    }
    if (region != null) {
      json['region'] = nativeToJson<String?>(region);
    }
    if (topic != null) {
      json['topic'] = nativeToJson<String?>(topic);
    }
    return json;
  }

  GetSurveySurveys({
    required this.id,
    required this.question,
    required this.status,
    required this.createdBy,
    this.language,
    this.region,
    this.topic,
  });
}

@immutable
class GetSurveyData {
  final List<GetSurveySurveys> surveys;
  GetSurveyData.fromJson(dynamic json):
  
  surveys = (json['surveys'] as List<dynamic>)
        .map((e) => GetSurveySurveys.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetSurveyData otherTyped = other as GetSurveyData;
    return surveys == otherTyped.surveys;
    
  }
  @override
  int get hashCode => surveys.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['surveys'] = surveys.map((e) => e.toJson()).toList();
    return json;
  }

  GetSurveyData({
    required this.surveys,
  });
}

@immutable
class GetSurveyVariables {
  final String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetSurveyVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetSurveyVariables otherTyped = other as GetSurveyVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  GetSurveyVariables({
    required this.id,
  });
}

