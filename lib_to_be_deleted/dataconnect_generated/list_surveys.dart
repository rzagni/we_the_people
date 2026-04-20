part of 'app.dart';

class ListSurveysVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListSurveysVariablesBuilder(this._dataConnect, );
  Deserializer<ListSurveysData> dataDeserializer = (dynamic json)  => ListSurveysData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListSurveysData, void>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<ListSurveysData, void> ref() {
    
    return _dataConnect.query("ListSurveys", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListSurveysSurveys {
  final String id;
  final String question;
  final EnumValue<SurveyStatus> status;
  final String createdBy;
  final String? language;
  final String? region;
  final String? topic;
  ListSurveysSurveys.fromJson(dynamic json):
  
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

    final ListSurveysSurveys otherTyped = other as ListSurveysSurveys;
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

  ListSurveysSurveys({
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
class ListSurveysData {
  final List<ListSurveysSurveys> surveys;
  ListSurveysData.fromJson(dynamic json):
  
  surveys = (json['surveys'] as List<dynamic>)
        .map((e) => ListSurveysSurveys.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListSurveysData otherTyped = other as ListSurveysData;
    return surveys == otherTyped.surveys;
    
  }
  @override
  int get hashCode => surveys.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['surveys'] = surveys.map((e) => e.toJson()).toList();
    return json;
  }

  ListSurveysData({
    required this.surveys,
  });
}

